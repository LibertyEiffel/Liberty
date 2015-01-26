-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DICTIONARY6

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   str: STRING "qwertyuiop[]asdfghjkl;'zxcvbnm,./1234567890-="

   test (d1, d2_: DICTIONARY[INTEGER, CHARACTER])
      local
         i: INTEGER; c: CHARACTER; d2: like d2_
      do
         from
            i := str.count
         until
            i = 0
         loop
            c := str.item(i)
            d1.put(c.code, c)
            i := i - 1
         end
         d2 := d1
         assert(d1.is_equal(d2))
         d2 := d1.twin
         assert(d1.is_equal(d2))
         d2 := d1.twin
         assert(d1.is_equal(d2))
         d2 := d2_
         from
            i := 1
         until
            i > str.count
         loop
            c := str.item(i)
            d2.put(c.code, c)
            i := i + 1
         end
         assert(d1.is_equal(d2))
         assert(d1.is_equal(d2))
         d1.clear_count
         assert(d1.count = 0)
         assert(not d1.has('a'))
         assert(not d1.is_equal(d2))
         d2.clear_count
         assert(d1.is_equal(d2))
      end

   make
      do
         test(create {ARRAY_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(2), create {ARRAY_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(2))
         test(create {HASHED_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(2), create {HASHED_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(2))
         test(create {PYTHON_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(2), create {PYTHON_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(2))
      end

end -- class TEST_DICTIONARY6
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
