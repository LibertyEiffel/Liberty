-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER1
   --
   -- Testing from_integer/to_integer/is_integer/is_zero/negate
   --

insert
   ARGUMENTS
   PLATFORM
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         mbi1: MUTABLE_BIG_INTEGER; v: INTEGER
      do
         create mbi1.from_integer(0)
         assert(mbi1.is_integer_32)
         assert(mbi1.is_zero)
         assert(not mbi1.is_one)
         assert(mbi1.is_even)
         assert(not mbi1.is_odd)
         assert(mbi1.to_string.is_equal("0"))
         assert(not mbi1.is_negative)
         mbi1.negate
         assert(not mbi1.is_negative)
         create mbi1.from_integer(2)
         assert(mbi1.to_integer_32 = 2)
         assert(not mbi1.is_zero)
         assert(not mbi1.is_negative)
         mbi1.negate
         assert(mbi1.is_negative)
         create mbi1.from_integer(1)
         assert(mbi1.to_integer_32 = 1)
         assert(not mbi1.is_zero)
         assert(mbi1.is_one)
         assert(not mbi1.is_even)
         assert(mbi1.is_odd)
         create mbi1.from_integer(-1)
         assert(mbi1.to_integer_32 = -1)
         assert(not mbi1.is_zero)
         create mbi1.from_integer(-2)
         assert(mbi1.to_integer_32 = -2)
         assert(not mbi1.is_zero)
         assert(not mbi1.is_one)
         assert(mbi1.is_even)
         assert(not mbi1.is_odd)
         create mbi1.from_integer(Maximum_integer)
         assert(mbi1.to_integer_32 = Maximum_integer)
         assert(not mbi1.is_zero)
         create mbi1.from_integer(Minimum_integer)
         assert(mbi1.to_integer_32 = Minimum_integer)
         assert(not mbi1.is_zero)
         v := Minimum_integer + 1
         create mbi1.from_integer(v)
         assert(mbi1.to_integer_32 = v)
         assert(not mbi1.is_zero)
         v := Maximum_integer - 1
         create mbi1.from_integer(v)
         assert(mbi1.to_integer_32 = v)
         assert(not mbi1.is_zero)
         check_range(Minimum_integer, -2147483600)
         check_range(-128, 128)
         check_range(2147483600, Maximum_integer)
         create mbi1.from_integer_64(2147483648)
         assert(not mbi1.is_integer_32)
         create mbi1.from_integer_64(-2147483649)
         assert(not mbi1.is_integer_32)
      end

   check_range (min, max: INTEGER)
      require
         min < max
      local
         i, mem: INTEGER; mbi: MUTABLE_BIG_INTEGER
      do
         from
            i := min
         until
            i = max
         loop
            mem := i
            create mbi.from_integer(mem)
            assert(mem = mbi.to_integer_32)
            i := i + 1
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER1
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
