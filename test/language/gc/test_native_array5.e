-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATIVE_ARRAY5

create {}
   make

feature {ANY}
   na1, na2, na3, na4, na5, na6, na7, na8, na9, na10, na11, na12: NATIVE_ARRAY[CHARACTER]

   na_max: INTEGER 9999

   make
      local
         i: INTEGER
      do
         from
            i := 1000
         until
            i = 0
         loop
            -- na1 :
            na1 := na1.calloc(na_max)
            assert(na1.all_default(na_max))
            na1.set_all_with('a', na_max)
            -- na2 :
            na2 := na2.calloc(na_max)
            assert(na2.all_default(na_max))
            na2.set_all_with('a', na_max)
            -- na3 :
            na3 := na3.calloc(na_max)
            assert(na3.all_default(na_max))
            na3.set_all_with('a', na_max)
            -- na4 :
            na4 := na4.calloc(na_max)
            assert(na4.all_default(na_max))
            na4.set_all_with('a', na_max)
            -- na5 :
            na5 := na5.calloc(na_max)
            assert(na5.all_default(na_max))
            na5.set_all_with('a', na_max)
            -- na6 :
            na6 := na6.calloc(na_max)
            assert(na6.all_default(na_max))
            na6.set_all_with('a', na_max)
            -- na7 :
            na7 := na7.calloc(na_max)
            assert(na7.all_default(na_max))
            na7.set_all_with('a', na_max)
            -- na8 :
            na8 := na8.calloc(na_max)
            assert(na8.all_default(na_max))
            na8.set_all_with('a', na_max)
            -- na9 :
            na9 := na9.calloc(na_max)
            assert(na9.all_default(na_max))
            na9.set_all_with('a', na_max)
            -- na10 :
            na10 := na10.calloc(na_max)
            assert(na10.all_default(na_max))
            na10.set_all_with('a', na_max)
            -- na11 :
            na11 := na11.calloc(na_max)
            assert(na11.all_default(na_max))
            na11.set_all_with('a', na_max)
            -- na12 :
            na12 := na12.calloc(na_max)
            assert(na12.all_default(na_max))
            na12.set_all_with('a', na_max)
            ---------------------------------------
            check_na(na1)
            check_na(na2)
            check_na(na3)
            check_na(na4)
            check_na(na5)
            check_na(na6)
            check_na(na7)
            check_na(na8)
            check_na(na9)
            check_na(na10)
            check_na(na11)
            check_na(na12)
            i := i - 1
         end
      end

   check_na (na: NATIVE_ARRAY[CHARACTER])
      local
         i: INTEGER
      do
         from
            i := na_max
         until
            i < 0
         loop
            assert(na.item(i) = 'a')
            i := i - 1
         end
      end

   assert (b: BOOLEAN)
      do
         if not b then
            std_output.put_string("Error in TEST_NATIVE_ARRAY5%N")
            crash
         else
            --       std_output.put_string("Yes%N");
         end
      end

end -- class TEST_NATIVE_ARRAY5
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
