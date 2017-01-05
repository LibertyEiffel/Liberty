-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INDEX_LIST
   --
   -- For the indexing clause in the heading part of a class.
   --

inherit
   VISITABLE

insert
   GLOBALS

create {INDEXINGABLE}
   make

feature {ANY}
   pretty (indent_level: INTEGER; a_spec: STRING)
      local
         i: INTEGER; header: BOOLEAN; e: SAFE_EQUAL[STRING]
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            if e.test(a_spec, list.item(i).spec) then
               if not header then
                  pretty_printer.set_indent_level(indent_level)
                  pretty_printer.put_string(once "note")
                  header := True
               end
               list.item(i).pretty(indent_level)
            end
            i := i + 1
         end
      end

   accept (visitor: INDEX_LIST_VISITOR)
      do
         visitor.visit_index_list(Current)
      end

feature {INDEX_LIST_VISITOR}
   list: FAST_ARRAY[INDEX_CLAUSE]

feature {}
   make (first: INDEX_CLAUSE)
      require
         first /= Void
      do
         create list.with_capacity(4)
         list.add_last(first)
      ensure
         list.first = first
      end

feature {INDEXINGABLE}
   add_last (ic: INDEX_CLAUSE)
      require
         ic /= Void
      do
         list.add_last(ic)
      end

invariant
   list.lower = 1

   not list.is_empty

end -- class INDEX_LIST
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
