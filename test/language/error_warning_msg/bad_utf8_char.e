-- This file is part of LibertyEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class BAD_UTF8_CHAR
   -- Non-ASCII UTF8 characters are encoded with more than 8 bits
   -- So UTF8 characters such as à, ü, €, Æ are all encoded with 2 or more
   -- 8-bit characters

create {}
   make

feature {}
   make
      local
         c: CHARACTER
      do
         c := 'à'
         c := '€'
         c := 'Æ'
      end

end -- class BAD_UNICODE_STRING1
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- LibertyEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- LibertyEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with LibertyEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2024: Paolo Redaelli
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://www.liberty-eiffel.org/
-- ------------------------------------------------------------------------------------------------------------------------------
