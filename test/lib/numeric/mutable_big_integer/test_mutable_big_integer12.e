-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER12
   --
   -- Testing `shift_left' and `shift_right' as well.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         mbi: MUTABLE_BIG_INTEGER
      do
         -- Checking `int64_nb_bit_set' first:
         assert(int64_nb_bit_set(1) = 1)
         assert(int64_nb_bit_set(-1) = 64)
         assert(int64_nb_bit_set(Minimum_integer_64) = 1)
         assert(int64_nb_bit_set(Maximum_integer_64) = 63)
         assert(int64_nb_bit_set(0) = 0)
         -- Checking `mbi_nb_bit_set' first:
         create mbi.from_integer_64(1)
         assert(mbi_nb_bit_set(mbi) = 1)
         create mbi.from_integer_64(0)
         assert(mbi_nb_bit_set(mbi) = 0)
         create mbi.from_integer_64(-1)
         assert(mbi_nb_bit_set(mbi) = 1)
         create mbi.from_integer_64(Maximum_integer_64)
         assert(mbi_nb_bit_set(mbi) = 63)
         check_with(1, 1, 1024)
         check_with(2, 1, 1024)
         check_with(3, 1, 1024)
         check_with(4, 1, 1024)
         check_with(0, 1, 1024)
         check_with(-1, 1, 1024)
         check_with(-2, 1, 1024)
         check_with(-3, 1, 1024)
         check_with(-4, 1, 1024)
         check_with(0x00000000FFFFFFFF, 1, 1024)
         check_with(0x00000000FFFFFFFE, 1, 1024)
         check_with(0x00000000FFFFFFFD, 1, 1024)
         check_with(0xFFFFFFFFFFFFFFFE, 1, 1024)
         check_with(Maximum_integer, 1, 1024)
         check_with(Maximum_integer_64, 1, 1024)
         check_with(Minimum_integer, 1, 1024)
         check_with(Minimum_integer_64, 1, 1024)
      end

   check_with (value: INTEGER_64; mini, maxi: INTEGER)
      require
         mini >= 1
         maxi > mini
      local
         s, nbb1, nbb2: INTEGER; mbi1, mbi2: MUTABLE_BIG_INTEGER
      do
         create mbi1.from_integer_64(value)
         nbb1 := mbi_nb_bit_set(mbi1)
         if value >= 0 then
            assert(nbb1 = int64_nb_bit_set(value))
         end
         from
            s := mini
         until
            s > maxi
         loop
            create mbi2.from_integer_64(value)
            -- A `shift_left' first not to looze bits:
            mbi2.shift_left(s)
            nbb2 := mbi_nb_bit_set(mbi2)
            assert(nbb1 = nbb2)
            -- Shifting right back of `s' must yield the same number of bits:
            mbi2.shift_right(s)
            nbb2 := mbi_nb_bit_set(mbi2)
            assert(nbb1 = nbb2)
            assert(mbi1.is_equal(mbi2))
            assert(mbi2.to_integer_64 = value)
            s := s + 1
         end
      end

   base: MUTABLE_BIG_INTEGER
      once
         create Result.from_integer_64(Maximum_integer.to_integer_64 + 1)
      end

   mbi_nb_bit_set (mbi: MUTABLE_BIG_INTEGER): INTEGER
      local
         i: INTEGER; mbi_bis, mbi_rem: MUTABLE_BIG_INTEGER
      do
         from
            create mbi_bis.copy(mbi)
            if mbi_bis.is_negative then
               mbi_bis.negate
            end
            create mbi_rem.from_integer(0)
         until
            mbi_bis.is_zero
         loop
            mbi_bis.divide_with_remainder_to(base, mbi_rem)
            Result := Result + int64_nb_bit_set(mbi_rem.to_integer_64)
            i := i + 1
         end
      end

   int64_nb_bit_set (v: INTEGER_64): INTEGER
      local
         i: INTEGER_8
      do
         from
            i := 0
         until
            i > 63
         loop
            if v.bit_test(i) then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   int32_nb_bit_set (v: INTEGER_32): INTEGER
      local
         i: INTEGER_8
      do
         from
            i := 0
         until
            i > 31
         loop
            if v.bit_test(i) then
               Result := Result + 1
            end
            i := i + 1
         end
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER12 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER12
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
