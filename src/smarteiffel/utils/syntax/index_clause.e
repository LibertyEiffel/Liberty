-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INDEX_CLAUSE

inherit
   VISITABLE
insert
   GLOBALS

create {ANY}
   with_tag, without_tag

feature {ANY}
   spec: STRING

   pretty (indent_level: INTEGER)
      local
         i: INTEGER
      do
         pretty_printer.set_indent_level(indent_level + 1)
         if tag /= Void then
            pretty_printer.put_string(tag.to_string)
            pretty_printer.put_string(once ": ")
         end
         if list /= Void then
            from
               i := list.lower
            until
               i > list.upper
            loop
               if i > list.lower then
                  pretty_printer.put_string(once ",%N")
               end
               pretty_printer.set_indent_level(indent_level + 2)
               list.item(i).pretty(indent_level + 3)
               i := i + 1
            end
         end
         pretty_printer.set_indent_level(0)
      end

   accept (visitor: INDEX_CLAUSE_VISITOR)
      do
         visitor.visit_index_clause(Current)
      end

feature {INDEX_CLAUSE, INDEX_CLAUSE_VISITOR}
   tag: HASHED_STRING

   list: FAST_ARRAY[MANIFEST_STRING]

feature {}
   with_tag (i: like tag; s: like spec)
      require
         i /= Void
      do
         tag := i
         spec := s
      ensure
         tag = i
      end

   without_tag (index_value: MANIFEST_STRING; s: like spec)
      do
         spec := s
         add_last(index_value)
      end

feature {EIFFEL_PARSER, INDEX_CLAUSE_VISITOR}
   add_last (index_value: MANIFEST_STRING)
      require
         index_value /= Void
      do
         if list = Void then
            create list.with_capacity(4)
         end
         list.add_last(index_value)
      end

invariant
   tag /= Void or else list /= Void

end -- class INDEX_CLAUSE
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
