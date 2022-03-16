-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSIGNMENT_HANDLER
   --
   -- Singleton object used to register all kinds of assignments from one type to another. First, one have to note
   -- that  assignments not only occurs in the assignment statement itself but also, for example, while passing
   -- some argument to a routine or for creation statements, or, as another example, for the assignment attempt.
   -- The `assignment_handler' singleton has two main goals. The most basic goal (historically speaking) is to
   -- provide IMPLICIT_CAST wrappers when they are necessary. The brand new usage of the `assignment_handler'
   -- (since the 1.0 Liberty Eiffel release) is to build the assignments type graph in order to compute more
   -- accurately the possible dynamic types of an expression (i.e. the corresponding RUN_TIME_SET). This
   -- information is important to implement dynamic dispatch and to perform the whole system covariance check
   -- (`safety_check').This singleton is shared via the GLOBALS.`assignment_handler' once function.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {ANY}
   collect_normal (source, destination: TYPE)
         -- Collect normal allowed assignment of `source' into `destination' (see export and require).
      require
         not_too_early: smart_eiffel.status.is_collecting
         not_too_late: not smart_eiffel.status.is_adapting
         not smart_eiffel.simplify_done implies source.can_be_assigned_to(destination)
      do
         collect_force(source, destination)
      end

feature {ASSIGNMENT_ATTEMPT, EFFECTIVE_ARG_LIST}
   collect_force (source, destination: TYPE)
         -- Collect a possibly non normal assignment of `source' into `destination' (see export and require).
      require
         not_too_early: smart_eiffel.status.is_collecting
         not_too_late: not smart_eiffel.status.is_adapting
         source /= Void
         destination /= Void
      do
         if source = destination then
            -- No impact on RUN_TIME_SETs.
         elseif source.is_expanded then
            if destination.is_expanded then
               -- No impact on RUN_TIME_SETs.
               -- Happens for implicit conversions such as INTEGER_8 => INTEGER_32
            else
               sedb_breakpoint
            end
         elseif destination.is_expanded then
            sedb_breakpoint -- ??? Whats that ? INTEGER_GENERAL or REAL_GENERAL ???
         else
            check
               source.is_reference
               destination.is_reference
            end
            graph_node_for(source).collect_way_to(graph_node_for(destination))
         end
      end

feature {SMART_EIFFEL}
   recompute_all_run_time_sets
      local
         i: INTEGER; gn: GRAPH_NODE; magic, new_magic: INTEGER
      do
         echo.put_string(once "Recompute RUN_TIME_SETs..")
         from
            i := graph_node_dictionary.lower
         until
            i > graph_node_dictionary.upper
         loop
            gn := graph_node_dictionary.item(i)
            new_magic := gn.recompute_run_time_set(new_magic)
            i := i + 1
            if i > graph_node_dictionary.upper then
               if new_magic /= magic then
                  magic := new_magic
                  smart_eiffel.magic_count_increment
                  i := graph_node_dictionary.lower
                  echo.put_string(once ".")
               end
            end
         end
         echo.put_string(once ".(done).%N")
      end

feature {FEATURE_CALL, ASSIGNMENT, EFFECTIVE_ARG_LIST, MANIFEST_GENERIC, FAKE_TUPLE, EFFECTIVE_ROUTINE}
   implicit_cast (expression: EXPRESSION; expression_type, destination_type: TYPE): EXPRESSION
         -- If necessary, wrap the source `expression' inside an IMPLICIT_CAST invisible wrapper object,
         -- hence the name of this function.
      require
         (expression_type /= destination_type) implies smart_eiffel.status.is_collecting
         expression_type.can_be_assigned_to(destination_type)
      local
         cast: IMPLICIT_CAST
      do
         if cast ?:= expression then
            cast ::= expression
            Result := implicit_cast_(cast.expression, cast.expression_type, destination_type)
         else
            Result := implicit_cast_(expression, expression_type, destination_type)
         end
      ensure
         Result /= Void
      end

feature {}
   implicit_cast_ (expression: EXPRESSION; expression_type, destination_type: TYPE): EXPRESSION
      do
         if expression_type = destination_type then
            Result := expression
         elseif expression_type.is_reference then
            if expression_type.name.to_string = as_integer_general then
               create {IMPLICIT_CAST} Result.make(expression, expression_type, destination_type)
            elseif expression_type.name.to_string = as_real_general then
               create {IMPLICIT_CAST} Result.make(expression, expression_type, destination_type)
            elseif expression_type.name.to_string = as_natural_general then
               create {IMPLICIT_CAST} Result.make(expression, expression_type, destination_type)
            else
               check
                  expression_type.is_reference
                  destination_type.is_reference
               end
               -- Implicit cast are only for expanded special conversion.
               Result := expression
            end
         else
            create {IMPLICIT_CAST} Result.make(expression, expression_type, destination_type)
         end
      end

feature {LIVE_TYPE}
   id_extra_information (tfw: TEXT_FILE_WRITE; lt: LIVE_TYPE)
      local
         graph_node: GRAPH_NODE
      do
         tfw.put_string(once "destination-graph-nodes: ")
         graph_node := graph_node_dictionary.fast_reference_at(lt.type)
         if graph_node = Void then
            tfw.put_string(once "none")
         else
            graph_node.id_extra_information(tfw)
         end
         tfw.put_character('%N')
      end

feature {SMART_EIFFEL}
   reset
         -- Called before a re-collect cycle.
      local
         i: INTEGER
      do
         external_types.clear_count
         -- Reset all GRAPH_NODEs:
         from
            i := graph_node_dictionary.lower
         until
            i > graph_node_dictionary.upper
         loop
            graph_node_dictionary.item(i).reset
            i := i + 1
         end
      end

   echo_information
      local
         i, n: INTEGER; graph_node: GRAPH_NODE
      do
         echo.put_string(once "Assignment graph: ")
         echo.put_integer(graph_node_dictionary.count)
         echo.put_string(once " nodes and ")
         from
            i := graph_node_dictionary.lower
         until
            i > graph_node_dictionary.upper
         loop
            graph_node := graph_node_dictionary.item(i)
            n := n + graph_node.destination_count
            i := i + 1
         end
         echo.put_integer(n)
         echo.put_string(once " transitions.%N")
      end

feature {}
   graph_node_for (type: TYPE): GRAPH_NODE
      require
         type /= Void
      do
         Result := graph_node_dictionary.fast_reference_at(type)
         if Result = Void then
            create Result.make(type)
            graph_node_dictionary.add(Result, type)
         end
      end

feature {NATIVE, CECIL_ENTRY}
   from_external (type: TYPE; args: FORMAL_ARG_LIST; result_type: TYPE_MARK)
      require
         type /= Void
      local
         i: INTEGER
      do
         if args /= Void then
            from
               i := 1
            until
               i > args.count
            loop
               from_external_(type, args.type_mark(i))
               i := i + 1
            end
         end
         if result_type /= Void then
            from_external_(type, result_type)
         end
         from_external_(type, type.canonical_type_mark)
      end

feature {}
   buffer: STRING
      once
         create Result.make(128)
      end

   graph_node_dictionary: HASHED_DICTIONARY[GRAPH_NODE, TYPE]
         -- To get the corresponding GRAPH_NODE.
      once
         create Result.with_capacity(512)
      end

   external_types: SET[TYPE]
      once
         create {HASHED_SET[TYPE]} Result.make
      end

   from_external_ (type: TYPE; type_mark: TYPE_MARK)
      require
         type_mark /= Void
      local
         i: INTEGER; type1, type2: TYPE
      do
         type1 := type_mark.resolve_in(type)
         if not type1.is_expanded then
            if not external_types.has(type1) then
               from
                  i := external_types.lower
               until
                  i > external_types.upper
               loop
                  type2 := external_types.item(i)
                  -- We must be pessimistic (i.e. everything can happen in the wild external world ;-):
                  collect_force(type1, type2)
                  collect_force(type2, type1)
                  i := i + 1
               end
               external_types.add(type1)
            end
         end
      end

end -- class ASSIGNMENT_HANDLER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
