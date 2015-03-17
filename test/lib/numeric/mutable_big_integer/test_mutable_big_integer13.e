-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER13
   --
   -- Testing feature `multiply' and `multiply_to'.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      do
         check_multiply(1, 2)
         --
         check_multiply(0, 0)
         check_multiply(8, 0)
         check_multiply(0, 6)
         check_multiply(1, 6)
         check_multiply(2, 1)
         check_multiply(0, -8)
         check_multiply(-6, 0)
         check_multiply(1, -6)
         check_multiply(-1, 6)
         check_multiply(3, 2)
         check_multiply(3, 3)
         check_multiply(Maximum_integer, -1)
         check_multiply(-3, -2)
         check_multiply(-5, 9)
         check_multiply(Maximum_integer - 3, 0)
         check_multiply(Maximum_integer - 3, 1)
         check_multiply(Maximum_integer - 3, 2)
         check_multiply(Maximum_integer - 3, 3)
         check_multiply(Maximum_integer, 0)
         check_multiply(Maximum_integer, 1)
         check_multiply(Maximum_integer, 2)
         check_multiply(Maximum_integer, 3)
         check_multiply(Maximum_integer, Maximum_integer)
         check_multiply(Maximum_integer, Maximum_integer.to_integer_64)
         check_multiply(Maximum_integer, Maximum_integer.to_integer_64 + 1)
         check_multiply(Maximum_integer, Maximum_integer.to_integer_64 + 2)
         check_multiply(Maximum_integer, Maximum_integer.to_integer_64 + 3)
         check_multiply(Maximum_integer, Maximum_integer.to_integer_64 + 4)
         check_multiply(Maximum_integer_64 // 4, 0)
         check_multiply(Maximum_integer_64 // 4, 1)
         check_multiply(Maximum_integer_64 // 4, 2)
         check_multiply(Maximum_integer_64 // 4, 3)
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER13 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

   check_multiply (a, b: INTEGER_64)
      local
         c: INTEGER_64; mbia, mbib, mbic: MUTABLE_BIG_INTEGER
      do
         -- test multiply
         c := a * b
         --
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         mbia.multiply(mbib)
         assert(mbia.to_integer_64 = c)
         assert(mbib.to_integer_64 = b)
         -- Commutativity:
         c := b * a
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         mbib.multiply(mbia)
         assert(mbia.to_integer_64 = a)
         assert(mbib.to_integer_64 = c)
         -- test multiply_to
         c := a * b
         --
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         create mbic.from_integer_64(0)
         mbia.multiply_to(mbib, mbic)
         assert(mbia.to_integer_64 = a)
         assert(mbib.to_integer_64 = b)
         assert(mbic.to_integer_64 = c)
         -- Commutativity:
         c := b * a
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         create mbic.from_integer_64(a + b)
         mbib.multiply_to(mbia, mbic)
         assert(mbia.to_integer_64 = a)
         assert(mbib.to_integer_64 = b)
         assert(mbic.to_integer_64 = c)
      end

end -- class TEST_MUTABLE_BIG_INTEGER13
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
