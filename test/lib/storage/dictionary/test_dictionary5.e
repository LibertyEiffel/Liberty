-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DICTIONARY5

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   str: STRING "qwertyuiop[]asdfghjkl;'zxcvbnm,./1234567890-="

   test1 (d: DICTIONARY[INTEGER, CHARACTER])
      local
         i: INTEGER; c: CHARACTER
      do
         assert(d.count = 0)
         from
            i := str.count
         until
            i = 0
         loop
            assert(d.count = str.count - i)
            c := str.item(i)
            assert(not d.has(c))
            d.put(c.code, c)
            assert(d.has(c))
            i := i - 1
         end
      end

   test2 (d: DICTIONARY[INTEGER, CHARACTER])
      local
         i: INTEGER; c: CHARACTER
      do
         from
            i := str.count
         until
            i = 0
         loop
            assert(d.count = str.count - i)
            c := str.item(i)
            if d.has(c) then
               crash
            else
               d.put(c.code, c)
               assert(d.has(c))
            end
            i := i - 1
         end
         assert(d.count = str.count)
         from
            i := str.count
         until
            i = 0
         loop
            assert(d.count = i)
            c := str.item(i)
            assert(d.has(c))
            d.remove(c)
            i := i - 1
         end
         assert(d.is_empty)
      end

   make
      do
         timed(
            agent
               do
                  test1(create {ARRAY_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(1))
                  test2(create {ARRAY_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(1))
               end
         )

         timed(
            agent
               do
                  test1(create {HASHED_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(1))
                  test2(create {HASHED_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(1))
               end
         )

         timed(
            agent
               do
                  test1(create {PYTHON_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(1))
                  test2(create {PYTHON_DICTIONARY[INTEGER, CHARACTER]}.with_capacity(1))
               end
         )
      end

end -- class TEST_DICTIONARY5
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
