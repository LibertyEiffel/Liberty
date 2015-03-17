-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER2
   --
   -- Testing from_integer_64/to_integer_64/is_integer_64/is_zero
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         mbi1: MUTABLE_BIG_INTEGER; v: INTEGER_64
      do
         mbi1 := create {MUTABLE_BIG_INTEGER}.from_integer_64(0)
         create mbi1.from_integer_64(0)
         assert(mbi1.is_integer_64)
         assert(mbi1.is_zero)
         assert(mbi1.to_string.is_equal("0"))
         create mbi1.from_integer_64(2)
         assert(mbi1.to_integer_64 = 2)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(1)
         assert(mbi1.to_integer_64 = 1)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(-1)
         assert(mbi1.to_integer_64 = -1)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(-2)
         assert(mbi1.to_integer_64 = -2)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(Maximum_integer_64)
         assert(mbi1.to_integer_64 = Maximum_integer_64)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(Minimum_integer_64)
         assert(mbi1.to_integer_64 = Minimum_integer_64)
         assert(not mbi1.is_zero)
         v := Minimum_integer_64 + 1
         create mbi1.from_integer_64(v)
         assert(mbi1.to_integer_64 = v)
         assert(not mbi1.is_zero)
         v := Maximum_integer_64 - 1
         create mbi1.from_integer_64(v)
         assert(mbi1.to_integer_64 = v)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(Maximum_integer)
         assert(mbi1.to_integer_64 = Maximum_integer)
         assert(not mbi1.is_zero)
         create mbi1.from_integer_64(Minimum_integer)
         assert(mbi1.to_integer_64 = Minimum_integer)
         assert(not mbi1.is_zero)
         v := Minimum_integer + 1
         create mbi1.from_integer_64(v)
         assert(mbi1.to_integer_64 = v)
         assert(not mbi1.is_zero)
         v := Maximum_integer - 1
         create mbi1.from_integer_64(v)
         assert(mbi1.to_integer_64 = v)
         assert(not mbi1.is_zero)
         check_range(Minimum_integer_64, -9223372036854775800)
         check_range(-2147483680, -2147483600)
         check_range(-128, 128)
         check_range(2147483600, 2147483680)
         check_range(9223372036854775800, Maximum_integer_64)
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER2 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

   check_range (min, max: INTEGER_64)
      require
         min < max
      local
         i, mem: INTEGER_64; mbi: MUTABLE_BIG_INTEGER
      do
         from
            i := min
         until
            i = max
         loop
            mem := i
            create mbi.from_integer_64(mem)
            assert(mem = mbi.to_integer_64)
            i := i + 1
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER2
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
