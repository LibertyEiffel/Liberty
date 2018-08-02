-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RENAME_PAIR
   --
   -- To store a rename pair inside some rename clause:
   --       "... rename ... as ... "
   --

inherit
   VISITABLE

insert
   GLOBALS

create {ANY}
   make

feature {ANY}
   old_name, new_name: FEATURE_NAME

   make (on:like old_name; nn: like new_name)
      require
         on /= Void
         nn /= Void
      local
         old_name_to_string: STRING
      do
         old_name := on
         new_name := nn
         old_name_to_string := old_name.to_string
         if old_name_to_string = new_name.to_string then
            error_handler.add_position(old_name.start_position)
            error_handler.add_position(new_name.start_position)
            error_handler.append(once "New name and old name must be different.")
            error_handler.print_as_fatal_error
         elseif old_name_to_string = as_c_inline_c then
            error_handler.add_position(on.start_position)
            error_handler.append(once "Cannot rename feature `c_inline_c' because this name is used as a keyword %
                                 %to handle the corresponding %"built_in%" feature of ANY.")
            error_handler.print_as_fatal_error
         elseif old_name_to_string = as_c_inline_h then
            error_handler.add_position(on.start_position)
            error_handler.append(once "Cannot rename feature `c_inline_h' because this name is used as a keyword %
                                 %to handle the corresponding %"built_in%" feature of ANY.")
            error_handler.print_as_fatal_error
         end
      ensure
         old_name = on
         new_name = nn
      end

   pretty (rank: INTEGER)
      do
         if rank > 1 then
            pretty_printer.set_indent_level(3)
         end
         old_name.declaration_pretty_print
         pretty_printer.keyword(once "as")
         new_name.declaration_pretty_print
      end

   accept (visitor: RENAME_PAIR_VISITOR)
      do
         visitor.visit_rename_pair(Current)
      end

end -- class RENAME_PAIR
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
