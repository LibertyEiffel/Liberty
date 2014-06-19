-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SUBSTRING

create {}
   make

feature {ANY}
   make
      local
         s1, s2: STRING
      do
         s1 := "123"
         s2 := s1.substring(1, 1)
         assert(s2.count = 1)
         assert(("1").is_equal(s2))
         s2 := s1.substring(2, 2)
         assert(("2").is_equal(s2))
         s2 := s1.substring(3, 3)
         assert(("3").is_equal(s2))
         s2 := s1.substring(2, 3)
         assert(("23").is_equal(s2))
         s2 := s1.substring(1, 3)
         assert(("123").is_equal(s2))
         s2 := s1.substring(1, 2)
         assert(("12").is_equal(s2))
         s2 := s1.substring(1, 0)
         assert(("").is_equal(s2))
         s2 := s1.substring(2, 1)
         assert(("").is_equal(s2))
         s2 := s1.substring(3, 2)
         assert(("").is_equal(s2))
         s2 := s1.substring(4, 3)
         assert(("").is_equal(s2))
         s1 := "1"
         s2 := s1.substring(1, 1)
         assert(("1").is_equal(s2))
         s2 := s1.substring(1, 0)
         assert(("").is_equal(s2))
         s2 := s1.substring(2, 1)
         assert(("").is_equal(s2))
         s1 := ""
         s2 := s1.substring(1, 0)
         assert(("").is_equal(s2))

         s1 := "1234"
         s1.insert_string("XY", 3)
         assert(("12XY34").is_equal(s1))
         s1 := "1234567"
         s1.remove_first
         s1.insert_string("X", 4)
         assert(("234X567").is_equal(s1))
         s1 := "1234567"
         s1.remove_first
         s1.remove_first
         s1.remove_first
         s1.remove_first
         s1.insert_string("X", 2)
         assert(("5X67").is_equal(s1))
         s1 := "1234567"
         s1.remove_first
         s1.remove_first
         s1.insert_string("XYZ", 3)
         assert(("34XYZ567").is_equal(s1))

         assert(("1234567890" ^ ({INTEGER 4} |..| {INTEGER 6}))~"456")
      end

feature {}
   assert (bool: BOOLEAN)
      do
         cpt := cpt + 1
         if not bool then
            std_output.put_string("TEST_SUBSTRING: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_SUBSTRING
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
