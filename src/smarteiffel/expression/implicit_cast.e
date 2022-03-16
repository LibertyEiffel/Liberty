-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class IMPLICIT_CAST
   --
   -- To memorize an implicit legal conversion from one type to another. This invisible expression
   -- used for all kinds of legal implicit conversions:
   --
   --   from INTEGER_8 to INTEGER_16
   --   from INTEGER_8 to INTEGER_32,
   --   from INTEGER_8 to INTEGER_64,
   --
   --   from INTEGER_16 to INTEGER_32,
   --   from INTEGER_16 to INTEGER_64,
   --
   --   from INTEGER_32 to INTEGER_64,
   --
   --   from REAL_32 to REAL_64,
   --   from REAL_32 to REAL_80,
   --   from REAL_32 to REAL_128,
   --   from REAL_32 to REAL_EXTENDED,
   --
   -- (See also NO_DISPATCH.)
   --

inherit
   EXPRESSION

create {ASSIGNMENT_HANDLER, IMPLICIT_CAST}
   make

feature {ANY}
   resolved_memory: TYPE
         -- The final type of Current.

   expression: EXPRESSION
         -- The wrapped `expression'.

   expression_type: TYPE
         -- The original one at the creation of this IMPLICIT_CAST.

   start_position: POSITION
      do
         Result := expression.start_position
      end

   is_manifest_string: BOOLEAN
      do
         Result := expression.is_manifest_string
      end

   extra_bracket_flag: BOOLEAN
      do
         Result := expression.extra_bracket_flag
      end

   resolve_in (type: TYPE): TYPE
      do
         Result := resolved_memory
      end

   is_void: BOOLEAN
      do
         Result := expression.is_void
      end

   declaration_type: TYPE
      do
         Result := resolved_memory
      end

   written_declaration_type_mark: TYPE_MARK
      do
         Result := declaration_type.canonical_type_mark
      end

   is_writable: BOOLEAN
      do
         Result := expression.is_writable
      end

   is_result: BOOLEAN
      do
         Result := expression.is_result
      end

   is_implicit_current, is_current: BOOLEAN
      do
         -- (Even if expression is a `Current', we must not forget this IMPLICIT_CAST.)
      end

   is_static: BOOLEAN
      do
         Result := expression.is_static
      end

   safety_check (type: TYPE)
      do
         expression.safety_check(type)
      end

   use_current (type: TYPE): BOOLEAN
      do
         Result := expression.use_current(type)
      end

   side_effect_free (type: TYPE): BOOLEAN
      do
         Result := expression.side_effect_free(type)
      end

   specialize_in (new_type: TYPE): like Current
      do
         check
            False -- (IMPLICIT_CAST are not written.)
         end
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current
      local
         e: like expression; implicit_cast: IMPLICIT_CAST
      do
         -- To avoid nested IMPLICIT_CAST:
         if implicit_cast ?:= expression then
            implicit_cast ::= expression
            e := implicit_cast.expression.specialize_thru(parent_type, parent_edge, new_type)
         else
            e := expression.specialize_thru(parent_type, parent_edge, new_type)
         end
         if e = expression then
            Result := Current
         else
            Result := twin
            Result.set_expression(e)
         end
      end

   specialize_and_check (type: TYPE): EXPRESSION
      local
         e: like expression
      do
         e := expression.specialize_and_check(type)
         if type.is_integer then
            -- Because INTEGER_GENERAL is a very special case, we have to unwrap the IMPLICIT_CAST
            -- in order to give another chance for expression to match with INTEGER_8 / 16 / 32 / 64:
            Result := e
         elseif e = expression then
            Result := Current
         else
            create {IMPLICIT_CAST} Result.make(e, e.resolve_in(type), resolved_memory)
         end
      end

   has_been_specialized: BOOLEAN
      do
         Result := expression.has_been_specialized
      end

   collect (type: TYPE): TYPE
      do
         Result := expression.collect(type)
         Result := resolved_memory
      end

   adapt_for (type: TYPE): like Current
      local
         e: like expression
      do
         e := expression.adapt_for(type)
         if e = expression then
            Result := Current
         else
            Result := twin
            Result.set_expression(e)
         end
      end

   non_void_no_dispatch_type (type: TYPE): TYPE
      do
         --|*** To be done. *** (Dom. june 18th 2004) ***
      end

   simplify (type: TYPE): EXPRESSION
      local
         e: like expression; ic: INTEGER_CONSTANT; rc: REAL_CONSTANT; et: like expression_type
      do
         -- Going back to the INTEGER_CONSTANT canonical form:
         if (ic ?:= expression) and then resolved_memory.is_integer then
            ic ::= expression
            smart_eiffel.magic_count_increment
            ic := ic.twin
            ic.set_result_type(resolved_memory.canonical_type_mark)
            Result := ic
         end
         -- Going back to the REAL_CONSTANT canonical form:
         if Result = Void then
            if (rc ?:= expression) and then resolved_memory.is_real then
               rc ::= expression
               smart_eiffel.magic_count_increment
               rc := rc.twin
               rc.set_result_type(resolved_memory.canonical_type_mark)
               Result := rc
            end
         end
         -- Finally, the general scheme:
         if Result = Void then
            e := expression.simplify(type)
            et := e.resolve_in(type)
            check e = expression implies et = expression_type end
            if e = expression then
               Result := Current
            else
               create {IMPLICIT_CAST} Result.make(e, et, resolved_memory)
            end
         end
      end

   accept (visitor: IMPLICIT_CAST_VISITOR)
      do
         visitor.visit_implicit_cast(Current)
      end

   pretty (indent_level: INTEGER)
      do
         expression.pretty(indent_level)
      end

   bracketed_pretty (indent_level: INTEGER)
      do
         expression.bracketed_pretty(indent_level)
      end

   pretty_target (indent_level: INTEGER)
      do
         expression.pretty_target(indent_level)
      end

   short (type: TYPE)
      do
         expression.short(type)
      end

   short_target (type: TYPE)
      do
         expression.short_target(type)
      end

   precedence: INTEGER
      do
         Result := expression.precedence
      end

feature {IMPLICIT_CAST}
   set_expression (e: like expression)
      do
         expression := e
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         e: like expression; implicit_cast: like Current
      do
         expression.inline_dynamic_dispatch_(code_accumulator, type)
         e := code_accumulator.current_context.last.to_expression
         code_accumulator.current_context.remove_last
         if e = expression then
            code_accumulator.current_context.add_last(Current)
         else
            implicit_cast := twin
            implicit_cast.set_expression(e)
            code_accumulator.current_context.add_last(implicit_cast)
         end
      end

feature {}
   make (e: like expression; et: like expression_type; rm: like resolved_memory)
      require
         no_implicit_cast_of_implicit_cast: not e.generating_type.is_equal(once "IMPLICIT_CAST")
         at_least_one_expanded: et.is_expanded or rm.is_expanded
         valid_assignment: et.can_be_assigned_to(rm)
      do
         resolved_memory := rm
         expression := e
         expression_type := et
      ensure
         expression /= Void
         expression_type = et
         resolved_memory = rm
      end

   canonical_form: BOOLEAN
      do
         Result := not ({IMPLICIT_CAST} ?:= expression)
      ensure
         assertion_check_only: Result
      end

invariant
   resolved_memory /= Void

   expression /= Void

   expression_type /= Void

   canonical_form

end -- class IMPLICIT_CAST
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
