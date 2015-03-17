-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_JVM19

create {}
   make

feature {ANY}
   aa: RING_ARRAY[CHARACTER]

   make
      local
         cr: REFERENCE[CHARACTER]; a: ANY_REFERENCE
      do
         assert('a' = 'a')
         assert('a' < 'b')
         assert('a' <= 'b')
         assert('b' <= 'b')
         assert('a'.to_upper = 'A')
         assert('z'.to_upper = 'Z')
         assert('+'.to_upper = '+')
         assert('A'.to_lower = 'a')
         assert('Z'.to_lower = 'z')
         assert('+'.to_lower = '+')
         assert('0'.is_digit)
         assert('1'.is_digit)
         assert('2'.is_digit)
         assert('3'.is_digit)
         assert('4'.is_digit)
         assert('5'.is_digit)
         assert('6'.is_digit)
         assert('7'.is_digit)
         assert('8'.is_digit)
         assert('9'.is_digit)
         assert(not 'x'.is_digit)
         assert('0'.value = 0)
         assert('1'.value = 1)
         assert('2'.value = 2)
         assert('3'.value = 3)
         assert('4'.value = 4)
         assert('5'.value = 5)
         assert('6'.value = 6)
         assert('7'.value = 7)
         assert('8'.value = 8)
         assert('9'.value = 9)
         assert('a'.code = 97)
         assert('z'.code = 122)
         assert('A'.code = 65)
         assert('Z'.code = 90)
         create cr.set_item('x')
         assert(cr.item = 'x')
         a := create {REFERENCE[CHARACTER]}.set_item('x')
         create aa.make(1, 1)
         aa.put('a', 1)
         assert('a' = aa.item(1))
         assert('a'.is_equal(aa.item(1)))
         assert('a'.is_equal(aa.item(1)))
         assert(97 = aa.first.code)
         assert(97 = aa.item(1).code)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_JVM19: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_JVM19
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
