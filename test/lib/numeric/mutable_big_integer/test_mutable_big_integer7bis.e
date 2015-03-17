-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER7BIS
   --
   -- Testing feature `add' and `add_to'.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      do
         check_add(0, 0)
         check_add(1, 0)
         check_add(1, 1)
         check_add(2, 0)
         check_add(2, 1)
         check_add(3, 0)
         check_add(3, 1)
         check_add(3, 2)
         check_add(3, 3)
         check_add(Maximum_integer - 3, 0)
         check_add(Maximum_integer - 3, 1)
         check_add(Maximum_integer - 3, 2)
         check_add(Maximum_integer - 3, 3)
         check_add(Maximum_integer, 0)
         check_add(Maximum_integer, 1)
         check_add(Maximum_integer, 2)
         check_add(Maximum_integer, 3)
         check_add(Maximum_integer, Maximum_integer.to_integer_64)
         check_add(Maximum_integer, Maximum_integer.to_integer_64 + 1)
         check_add(Maximum_integer, Maximum_integer.to_integer_64 + 2)
         check_add(Maximum_integer, Maximum_integer.to_integer_64 + 3)
         check_add(Maximum_integer, Maximum_integer.to_integer_64 + 4)
         check_add_over64(Maximum_integer_64 - 3, 0)
         check_add_over64(Maximum_integer_64 - 3, 1)
         check_add_over64(Maximum_integer_64 - 3, 2)
         check_add_over64(Maximum_integer_64 - 3, 3)
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER7bis : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

   check_add (a, b: INTEGER_64)
      do
         check_add2(a, b)
         check_add2(b, a)
         check_add2(a, a)
         check_add2(b, b)
         check_add2(-a, b)
         check_add2(b, -a)
         check_add2(a, -b)
         check_add2(-b, a)
         check_add2(-a, -b)
         check_add2(-b, -a)
      end

   check_add_over64 (a, b: INTEGER_64)
      do
         check_add2(a, b)
         check_add2(b, a)
         --check_add2(a, a)
         --check_add2(b, b)
         check_add2(-a, b)
         check_add2(b, -a)
         check_add2(a, -b)
         check_add2(-b, a)
         check_add2(-a, -b)
         check_add2(-b, -a)
      end

   check_add2 (a, b: INTEGER_64)
      local
         c, v: INTEGER_64; mbia, mbib, mbic: MUTABLE_BIG_INTEGER
      do
         -- test add
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         mbia.add(mbib)
         c := a + b
         v := mbia.to_integer_64
         check
            v = c
         end
         assert(v = c)
         v := mbib.to_integer_64
         check
            v = b
         end
         assert(v = b)
         -- test add_to
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         create mbic.from_integer(0)
         mbia.add_to(mbib, mbic)
         c := a + b
         v := mbia.to_integer_64
         check
            v = a
         end
         assert(v = a)
         v := mbib.to_integer_64
         check
            v = b
         end
         assert(v = b)
         v := mbic.to_integer_64
         check
            v = c
         end
         assert(v = c)
      end

end -- class TEST_MUTABLE_BIG_INTEGER7BIS
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
