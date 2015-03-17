-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DICTIONARY4

insert
   PLATFORM
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   str: STRING "qwertyuiop[]asdfghjkl;'zxcvbnm,./1234567890-="

   test (d: DICTIONARY[INTEGER, CHARACTER])
      local
         i: INTEGER; c: CHARACTER
      do
         from
            i := str.count
         until
            i = 0
         loop
            c := str.item(i)
            d.put(c.code, c)
            i := i - 1
         end
         assert(d.count = str.count)
         from
            i := Maximum_character_code
         until
            i < Minimum_character_code
         loop
            d.put(i, i.to_character)
            i := i - 1
         end
         assert(d.count = Maximum_character_code - Minimum_character_code + 1)
         from
            i := str.count
         until
            i = 0
         loop
            c := str.item(i)
            assert(d.fast_key_at(c.code) = c)
            assert(d.key_at(c.code) = c)
            i := i - 1
         end
         assert(d.count = Maximum_character_code - Minimum_character_code + 1)
         from
            i := str.count
         until
            i = 0
         loop
            c := str.item(i)
            assert(d.has(c))
            d.remove(c)
            assert(not d.has(c))
            i := i - 1
         end
         i := Maximum_character_code - Minimum_character_code + 1
         assert(d.count = i - str.count)
         from
            i := Maximum_character_code
         until
            i < Minimum_character_code
         loop
            if d.has(i.to_character) then
               c := d.key_at(i)
               assert(c.code = i)
            end
            i := i - 1
         end
      end

   make
      do
         test(create {ARRAY_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(12))
         test(create {HASHED_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(12))
         test(create {PYTHON_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(12))
      end

end -- class TEST_DICTIONARY4
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
