-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_CHARACTER2

insert
   EIFFELTEST_TOOLS
   
create {}
   make

feature {ANY}
   make
      local
         str: STRING; c: CHARACTER; i, j: INTEGER
      do
         str := 0.to_character.to_hexadecimal
         assert(("00").is_equal(str))
         str := 1.to_character.to_hexadecimal
         assert(("01").is_equal(str))
         str := 254.to_character.to_hexadecimal
         assert(("FE").is_equal(str))
         str := 255.to_character.to_hexadecimal
         assert(("FF").is_equal(str))
         i := 0
         c := i.to_character
         assert(c.code = 0)
         i := 1
         c := i.to_character
         assert(c.code = 1)
         i := 127
         c := i.to_character
         assert(c.code = 127)
         i := 128
         c := i.to_character
         assert(c.code = 128)
         i := 254
         c := i.to_character
         assert(c.code = 254)
         i := 255
         c := i.to_character
         assert(c.code = 255)
         from
            c := c.default
            assert(c = '%U')
            i := 0
         until
            i >= 255
         loop
            assert(i = c.code)
            c := c.next
            i := i + 1
         end
         from
            c := c.default
            assert(c = '%U')
            i := 0
         until
            i >= 255
         loop
            j := c.to_integer_8
            if i <= 127 then
               assert(i = c.to_integer_8)
            else
               assert(i - 256 = c.to_integer_8)
            end
            c := c.next
            i := i + 1
         end
      end

end -- class TEST_CHARACTER2
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
