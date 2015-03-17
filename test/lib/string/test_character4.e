-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_CHARACTER4

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      do
         assert('0'.is_decimal_digit)
         assert('0'.decimal_value = 0)
         assert('9'.is_decimal_digit)
         assert('9'.decimal_value = 9)
         assert('0'.is_binary_digit)
         assert('0'.binary_value = 0)
         assert('1'.is_binary_digit)
         assert('1'.binary_value = 1)
         assert('0'.is_octal_digit)
         assert('0'.octal_value = 0)
         assert('7'.is_octal_digit)
         assert('7'.octal_value = 7)
         assert('0'.is_hexadecimal_digit)
         assert('0'.hexadecimal_value = 0)
         assert('9'.is_hexadecimal_digit)
         assert('9'.hexadecimal_value = 9)
         assert('a'.is_hexadecimal_digit)
         assert('a'.hexadecimal_value = 10)
         assert('f'.is_hexadecimal_digit)
         assert('f'.hexadecimal_value = 15)
         assert('A'.is_hexadecimal_digit)
         assert('A'.hexadecimal_value = 10)
         assert('F'.is_hexadecimal_digit)
         assert('F'.hexadecimal_value = 15)
         assert(not 'Z'.is_decimal_digit)
         assert(not 'A'.is_binary_digit)
         assert(not '2'.is_binary_digit)
         assert(not '8'.is_octal_digit)
         assert(not 'a'.is_octal_digit)
         assert(not 'G'.is_hexadecimal_digit)
         assert(not '1'.is_alpha)
         assert(not ','.is_alpha)
         assert('a'.is_alpha)
         assert('z'.is_alpha)
         assert('A'.is_alpha)
         assert('Z'.is_alpha)
      end

end -- class TEST_CHARACTER4
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
