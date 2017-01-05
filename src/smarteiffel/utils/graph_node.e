-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class GRAPH_NODE
   --
   -- One node of the whole system assignment graph node.
   --

inherit
   HASHABLE

insert
   GLOBALS
      redefine is_equal
      end

create {ASSIGNMENT_HANDLER}
   make

feature {ANY}
   source_type: TYPE
         -- The one (source) of the `Current' node in the graph.

   hash_code: INTEGER
         -- A memory cache for `source_type.run_time_mark.hash_code'.

   is_equal (other: like Current): BOOLEAN
      do
         Result := Current = other
      end

feature{GRAPH_NODE}
   destination_graph_nodes: SET[GRAPH_NODE]
         -- The set of possible destination starting from `source_type'.

feature {ASSIGNMENT_HANDLER}
   id_extra_information (tfw: TEXT_FILE_WRITE)
      local
         i: INTEGER; gn: like Current
      do
         if destination_graph_nodes.is_empty then
            tfw.put_string(once "empty")
         else
            from
               i := destination_graph_nodes.lower
            until
               i > destination_graph_nodes.upper
            loop
               gn := destination_graph_nodes.item(i)
               tfw.put_string(once "->")
               tfw.put_string(gn.source_type.name.to_string)
               i := i + 1
               if i <= destination_graph_nodes.upper then
                  tfw.put_string(once ", ")
               end
            end
         end
      end

   reset
         -- To `reset' before each collect cycle.
      do
         destination_graph_nodes.clear_count
      end

   collect_way_to (destination_gn: GRAPH_NODE)
      require
         smart_eiffel.status.is_analyzing
         destination_gn /= Current
      do
         destination_graph_nodes.fast_add(destination_gn)
      end

   destination_count: INTEGER
      do
         Result := destination_graph_nodes.count
      end

feature {ASSIGNMENT_HANDLER}
   recompute_run_time_set (magic: INTEGER): INTEGER
      local
         source_lt: LIVE_TYPE; source_rts: RUN_TIME_SET; destination_gn: like Current; i: INTEGER
      do
         Result := magic
         source_lt := source_type.live_type
         if source_lt /= Void then
            source_rts := source_lt.run_time_set
            if source_rts.is_empty then
               -- Nothing to push.
            else
               -- Pushing my RUN_TIME_SET:
               from
                  i := destination_graph_nodes.lower
               until
                  i > destination_graph_nodes.upper
               loop
                  destination_gn := destination_graph_nodes.item(i)
                  check
                     destination_gn /= Current
                  end
                  Result := Result + destination_gn.run_time_set_add(source_rts)
                  i := i + 1
               end
            end
         end
      ensure
         Result >= magic
      end

feature {GRAPH_NODE}
   run_time_set_add (rts: RUN_TIME_SET): INTEGER
         -- The `Result' indicate the number of added items.
      require
         source_type /= Void
         not rts.is_empty
      local
         source_lt: LIVE_TYPE; source_rts: RUN_TIME_SET; destination_gn: GRAPH_NODE; i: INTEGER
      do
         source_lt := source_type.live_type
         if source_lt = Void then
            from
               i := destination_graph_nodes.lower
            until
               i > destination_graph_nodes.upper
            loop
               destination_gn := destination_graph_nodes.item(i)
               check
                  destination_gn /= Current
               end
               Result := Result + destination_gn.run_time_set_add(rts)
               i := i + 1
            end
         else
            source_rts := source_lt.run_time_set
            if source_rts /= rts then
               Result := source_rts.add_set(rts)
            end
            if Result > 0 then
               from
                  i := destination_graph_nodes.lower
               until
                  i > destination_graph_nodes.upper
               loop
                  destination_gn := destination_graph_nodes.item(i)
                  check
                     destination_gn /= Current
                  end
                  Result := Result + destination_gn.run_time_set_add(source_rts)
                  if rts /= source_rts then
                     Result := Result + destination_gn.run_time_set_add(rts)
                     --|*** WHY THIS SECOND ONE ?? ***
                  end
                  i := i + 1
               end
            end
         end
      ensure
         Result >= 0
      end

feature {}
   make (st: like source_type)
      require
         not st.is_expanded
      do
         source_type := st
         create {HASHED_SET[GRAPH_NODE]} destination_graph_nodes.make
         hash_code := source_type.name.hash_code
      ensure
         source_type = st
      end

invariant
   destination_graph_nodes /= Void

end -- class GRAPH_NODE
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
