-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INSPECT9

create {}
   make

feature {ANY}
   make
      local
         i, j: INTEGER
      do
         from
            i := words.lower
         until
            i > words.upper
         loop
            inspect
               words @ i
            when "foo" then
               assert_equal(words.item(i), "foo")
            when "bar" then
               assert_equal(words.item(i), "bar")
               from
                  j := words_2.lower
               until
                  j > words_2.upper
               loop
                  inspect
                     words_2 @ j
                  when "pic" then
                     assert_equal(words_2.item(j), "pic")
                  when "co" then
                     assert_equal(words_2.item(j), "co")
                  when "le" then
                     assert_equal(words_2.item(j), "le")
                  when "gram" then
                     assert_equal(words_2.item(j), "gram")
                  end
                  j := j + 1
               end
            when "first" then
               assert_equal(words.item(i), "first")
            when "second" then
               assert_equal(words.item(i), "second")
            when "am" then
               assert_equal(words.item(i), "am")
            when "stram" then
               assert_equal(words.item(i), "stram")
            when "gram" then
               assert_equal(words.item(i), "gram")
            end
            i := i + 1
         end
      end

   words: ARRAY[STRING]
      once
         Result := {ARRAY[STRING] 1, << "foo", "bar", "first", "second", "am", "stram", "gram" >> }
      end

   words_2: ARRAY[STRING]
      once
         Result := {ARRAY[STRING] 1, << "pic", "co", "le", "gram" >> }
      end

feature {}
   cpt: INTEGER

   assert_equal (given, expected: STRING)
      do
         cpt := cpt + 1
         if not given.is_equal(expected) then
            sedb_breakpoint
            std_output.put_string(once "TEST_INSPECT9: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string(once ": expected >")
            std_output.put_string(expected)
            std_output.put_string(once "<, but got >")
            std_output.put_string(given)
            std_output.put_string("<%N")
         end
      end

end -- class TEST_INSPECT9
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
