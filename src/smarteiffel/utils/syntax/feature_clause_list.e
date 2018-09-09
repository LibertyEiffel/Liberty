-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class FEATURE_CLAUSE_LIST

inherit
   VISITABLE
insert
   GLOBALS

create {CLASS_TEXT}
   make

feature {ANY}
   count: INTEGER
         -- Number of items in `Current'.
      do
         Result := list.count
      ensure
         Result > 0
      end

   pretty
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            pretty_printer.set_indent_level(0)
            if not pretty_printer.zen_mode then
               pretty_printer.skip_one_line
            end
            list.item(i).pretty
            i := i + 1
         end
      ensure
         pretty_printer.indent_level = 0
      end

feature {CLASS_CHECKER, SHORT_PRINTER}
   for_short (ctn: CLASS_NAME; parent, context_type: TYPE; client: TYPE_MARK)
      require
         ctn = parent.class_text.name
         Current = parent.class_text.feature_clause_list
      local
         i: INTEGER; fc: FEATURE_CLAUSE
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            fc := list.item(i)
            fc.for_short(ctn, parent, context_type, client)
            i := i + 1
         end
      end

feature {CLASS_TEXT}
   get_started (fd: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME])
      require
         fd /= Void
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            list.item(i).add_into(fd)
            i := i + 1
         end
      end

   add_last (fc: FEATURE_CLAUSE)
      require
         fc /= Void
      do
         list.add_last(fc)
      end

feature {ANY}
   accept (visitor: FEATURE_CLAUSE_LIST_VISITOR)
      do
         visitor.visit_feature_clause_list(Current)
      end

feature {FEATURE_CLAUSE_LIST_VISITOR}
   list: FAST_ARRAY[FEATURE_CLAUSE]

feature {}
   make (first: FEATURE_CLAUSE)
      require
         first /= Void
      do
         create list.with_capacity(12)
         list.add_last(first)
      ensure
         list.first = first
      end

invariant
   not list.is_empty

end -- class FEATURE_CLAUSE_LIST
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
