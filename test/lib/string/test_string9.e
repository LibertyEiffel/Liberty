-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_STRING9

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         str: STRING; i: INTEGER
      do
         str := "a%/0/b"
         i := str.count
         assert(i = 3)
         assert(str.item(2) = '%U')
         assert(("foo").substring_index("foo", 1) = 1)
         assert(("Afoo").substring_index("foo", 1) = 2)
         assert(("Afofoo").substring_index("foo", 1) = 4)
         assert(("Afofo").substring_index("foo", 1) = 0)
         assert(("Afofo").substring_index("", 1) = 1)
         assert(("Afofoofoo").substring_index("foo", 1) = 4)
         assert(not ("").is_real)
         assert(not ("").is_integer)
         assert(not ("").is_integer_64)
         assert(not (" ").is_real)
         assert(not (" ").is_integer)
         assert(not (" ").is_integer_64)
         assert(not ("+").is_real)
         assert(not ("+").is_integer)
         assert(not ("+").is_integer_64)
         assert(not ("-").is_real)
         assert(not ("-").is_integer)
         assert(not ("-").is_integer_64)
         assert(not ("1a").is_integer)
         assert(not ("1a").is_integer_64)
         assert(("1").is_integer)
         assert(("1").is_integer_64)
         assert(not (" + 32 1").is_integer)
         assert(not (" + 32 1").is_integer_64)
         assert(("%N-657%T").to_integer = -657)
         assert(("%N-657%T").to_integer_64 = -657)
         ("").replace_all('a', 'b')
         str := "ooo"
         str.replace_all('a', 'b')
         assert(str.is_equal("ooo"))
         str.replace_all('o', 'a')
         assert(str.is_equal("aaa"))
         str := "foo"
         str.extend_to_count(' ', 4)
         assert(("foo ").is_equal(str))
         str := "foo"
         str.precede_to_count(' ', 4)
         assert((" foo").is_equal(str))
         str := "foo"
         str.extend_to_count(' ', 3)
         assert(("foo").is_equal(str))
         str := "foo"
         str.precede_to_count(' ', 3)
         assert(("foo").is_equal(str))
         str := ""
         str.extend_to_count(' ', 0)
         assert(("").is_equal(str))
         str.precede_to_count(' ', 0)
         assert(("").is_equal(str))
         str := "foo"
         str.precede_to_count(' ', 2)
         assert(("foo").is_equal(str))
         str := "foo"
         str.precede_to_count(' ', 5)
         assert(("  foo").is_equal(str))
         str := ""
         str.extend_multiple('a', 0)
         assert(("").is_equal(str))
         str.extend_multiple('b', 1)
         assert(("b").is_equal(str))
         str.extend_multiple('a', 2)
         assert(("baa").is_equal(str))
         str := ""
         str.precede_multiple('a',-1)
         assert(str ~ "")
         str.precede_multiple('a', 0)
         assert(("").is_equal(str))
         str.precede_multiple('b', 1)
         assert(("b").is_equal(str))
         str.precede_multiple('a', 2)
         assert(("aab").is_equal(str))
         str := "a" + "bc"
         assert(("abc").is_equal(str))
         str := "" + "bc"
         assert(("bc").is_equal(str))
         str := "ab" + ""
         assert(("ab").is_equal(str))
         str := "" + ""
         assert(("").is_equal(str))
         str := "foo"
         str.prepend("bar")
         assert(("barfoo").is_equal(str))
      end

end -- class TEST_STRING9
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
