-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INSPECT8

create {}
   make

feature {ANY}
   make
      local
         i: INTEGER
      do
         from
            i := words.lower
         until
            i > words.upper
         loop
            inspect
               words @ i
            when 1 then
               assert_equal(words.item(i), 1)
            when 2 then
               assert_equal(words.item(i), 2)
            when 3 then
               assert_equal(words.item(i), 3)
            when 4 then
               assert_equal(words.item(i), 4)
            when 5 then
               assert_equal(words.item(i), 5)
            when 6 then
               assert_equal(words.item(i), 6)
            when 7 then
               assert_equal(words.item(i), 7)
            end
            i := i + 1
         end
      end

   words: ARRAY[INTEGER]
      once
         Result := {ARRAY[INTEGER] 1, << 1, 2, 3, 4, 5, 6, 7 >> }
      end

feature {}
   cpt: INTEGER

   assert_equal (given, expected: INTEGER)
      do
         cpt := cpt + 1
         if not given.is_equal(expected) then
            sedb_breakpoint
            std_output.put_string(once "TEST_INSPECT7: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string(once ": expected >")
            std_output.put_integer(expected)
            std_output.put_string(once "<, but got >")
            std_output.put_integer(given)
            std_output.put_string("<%N")
         end
      end

end -- class TEST_INSPECT8
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
