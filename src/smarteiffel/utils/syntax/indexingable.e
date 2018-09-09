-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class INDEXINGABLE
   --
   -- Eiffel notes (old keyword is "indexing")
   --

insert
   GLOBALS

feature {ANY}
   index_list: INDEX_LIST
         -- For the indexing of the class.

feature {}
   pretty_index (indent_level: INTEGER; a_spec: STRING)
      do
         if index_list /= Void then
            index_list.pretty(indent_level, a_spec)
            if indent_level = 0 and then not pretty_printer.zen_mode then
               pretty_printer.set_indent_level(indent_level)
               pretty_printer.skip_one_line
            end
         end
         pretty_printer.set_indent_level(indent_level)
      ensure
         pretty_printer.indent_level = indent_level
      end

feature {EIFFEL_PARSER}
   add_index_clause (index_clause: INDEX_CLAUSE)
      require
         index_clause /= Void
      do
         if index_list = Void then
            create index_list.make(index_clause)
         else
            index_list.add_last(index_clause)
         end
      end

feature {INDEXINGABLE}
   set_index_list (a_index_list: like index_list)
      require
         brand_new: index_list = Void
      do
         index_list := a_index_list
      end

end -- class INDEXINGABLE
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
