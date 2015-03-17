-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COLLECTION_SORTER6
   --Author: Philippe Ribet
   --Strong sorter testing.
   --
   -- Note: specific "lt" definition
   --

insert
   ABSTRACT_SORTER[INTEGER]
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         c: COLLECTION[INTEGER]
      do
         create {ARRAY[INTEGER]} c.with_capacity(5, 1)
         sort(c)
         print_collection(c)
         assert(index_of(c, 5) = 1)
         assert(not has(c, 5))
         test(c)
         add(c, 1)
         assert(index_of(c, -2) = 1)
         assert(index_of(c, 5) = 1)
         assert(index_of(c, 1) = 1)
         assert(not has(c, -2))
         assert(not has(c, 5))
         assert(has(c, 1))
         test(c)
         c := {ARRAY[INTEGER] 1, << 1.to_integer_32, 5, 3, 2, 4 >> }
         sort(c)
         test(c)
         add(c, 6)
         test(c)
         add(c, 2)
         assert(index_of(c, 2) = 4)
         assert(c.item(2) = 2)
         assert(c.item(3) = 3)
         assert(c.item(4) = 2)
         assert(is_sorted(c))
      end

   by_first_char: BOOLEAN

   lt (x, y: INTEGER): BOOLEAN
      do
         Result := x #// 2 < y #// 2
      end

feature {}
   print_collection (c: COLLECTION[INTEGER])
      local
         i: INTEGER
      do
         from
            i := c.lower
         until
            i > c.upper
         loop
            io.put_integer(c.item(i))
            io.put_character(' ')
            i := i + 1
         end
      end

   test (c: COLLECTION[INTEGER])
      local
         i: INTEGER
      do
         from
            i := c.lower
         until
            i > c.upper
         loop
            assert(has(c, i))
            assert(index_of(c, i) = i)
            i := i + 1
         end
      end

end -- class TEST_COLLECTION_SORTER6
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
