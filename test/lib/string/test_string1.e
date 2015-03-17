-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_STRING1

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         s, s2: STRING; i: INTEGER; words: ARRAY[STRING]
      do
         create s.make_filled(' ', 0)
         assert(s.count = 0)
         s.make_filled(' ', 1)
         assert(s.count = 1)
         assert(s.item(1) = ' ')
         s.put('a', 1)
         assert(s.count = 1)
         assert(s.item(1) = 'a')
         create s.make_filled(' ', 4)
         assert(s.count = 4)
         from
            i := 1
         until
            i > s.count
         loop
            assert(s.item(i) = ' ')
            i := i + 1
         end
         assert(("").is_equal(""))
         assert(not (" ").is_equal(""))
         create s.make_filled(' ', 3)
         s.put('a', 2)
         assert((" a ").is_equal(s))
         assert(s.is_equal(" a "))
         s := ""
         assert(s.count = 0)
         s.extend('x')
         assert(s.count = 1)
         assert(s.item(1) = 'x')
         s := "1"
         assert(s.count = 1)
         assert(s.item(1) = '1')
         s.extend('x')
         assert(s.count = 2)
         assert(s.item(1) = '1')
         assert(s.item(2) = 'x')
         assert(("1x").is_equal(s))
         create s.make_filled(' ', 3)
         s.put('h', 2)
         assert((" h ").is_equal(s))
         s.put(' ', 2)
         assert(not (" h ").is_equal(s))
         assert(s.is_equal("   "))
         s.make_filled(' ', 3)
         assert(s.is_equal("   "))
         create s.copy("ab")
         assert(s.count = 2)
         assert(("ab").is_equal(s))
         s.copy("cdef")
         assert(("cdef").is_equal(s))
         s.copy("a")
         assert(("a").is_equal(s))
         s := ""
         assert(s.count = 0)
         create s.copy(s)
         assert(s.count = 0)
         s.extend('a')
         assert(s.count = 1)
         assert(s.item(1) = 'a')
         s2 := "a"
         s := s2.twin
         assert(s.count = 1)
         assert(s2.count = 1)
         assert(s.item(1) = 'a')
         s2.put('b', 1)
         assert(s2.item(1) = 'b')
         assert(s.item(1) = 'a')
         s := "abc"
         s2 := s.twin
         assert(s.is_equal(s2))
         s.put('x', 2)
         assert(not s.is_equal(s2))
         create s.make_filled(' ', 0)
         assert(("").is_equal(s))
         create s.make_filled(' ', 2)
         assert(("  ").is_equal(s))
         s := "aaa"
         s.make_filled(' ', 2)
         assert(("  ").is_equal(s))
         s := ""
         assert(("").twin.is_equal(s))
         create s.make_filled(' ', 2)
         assert(("  ").is_equal(s))
         s := "aaa"
         s.make_filled(' ', 2)
         assert(("  ").is_equal(s))
         assert(("abc").is_equal("abc"))
         create s.copy("kiki")
         assert(s.is_equal("kiki"))
         s.copy(s)
         assert(s.is_equal("kiki"))
         s.copy("3")
         assert(s.is_equal("3"))
         create s.copy("kiki")
         s.clear_count
         assert(s.is_equal(""))
         s := "123456789"
         s.shrink(1, 7)
         assert(("1234567").is_equal(s))
         s.shrink(2, 7)
         assert(("234567").is_equal(s))
         assert((" +234 ").to_integer = 234)
         assert((" -67").to_integer = -67)
         assert((" +234 ").to_integer_64 = 234)
         assert((" -67").to_integer_64 = -67)
         assert(("+234.0").to_real = 234.0)
         assert(("+1234").to_real = 1234.0)
         assert((" +234.22").to_real <= 234.221)
         assert((" +234.22").to_real >= 234.219)
         assert((" -67.0 %N").to_real = -67)
         assert((".5").to_real = 0.5)
         assert(("0.5").to_real = 0.5)
         -- *** std_output.put_string("Min%N")
         -- THERE IS HERE A STRANGE BUG ONLY IN gcc -O3 ????
         -- D.Colnet 9 feb 2003
         -- ***
         -- *** std_output.put_string("Max%N")
         assert(str1.is_equal(str2))
         assert(str1 /= str2)
         create s.make(10)
         assert(s.count = 0)
         assert(s.capacity >= 10)
         words := ("un machin").split
         assert(words.count = 2)
         assert(words.is_equal({ARRAY[STRING] 1, << "un", "machin" >> }))
         words := ("   un machin  ").split
         assert(words.is_equal({ARRAY[STRING] 1, << "un", "machin" >> }))
         assert("   un machin ".split.is_equal({ARRAY[STRING] 1, << "un", "machin" >> }))
         assert(("   ").split = Void)
         assert(("%/32/").first = ' ')
         assert(("%/122/").first = 'z')
         assert(("%/123/").first = '{')
         assert(("%/92/").first = '%/92/')
         assert(("%/92/").first = '\')
         assert(("%/92/").first = '%H')
         assert(("\").first = '%H')
         assert((" -67 ").to_real = -67)
         assert((" -67  ").to_real = -67)
      end

   str1,str2: STRING "Ouupps ..."

end -- class TEST_STRING1
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
