-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_MUTABLE_BIG_INTEGER1
   -- Use `numbers*' first to make tests.
   -- `check_and_restore(numbers*)' test if `numbers*' is corrupted or
   -- not and restore it.
   -- Use `restore(numbers*)' to restore `numbers*'.

insert
   PLATFORM
   EIFFELTEST_TOOLS

feature {}
   numbers_check: FAST_ARRAY[MUTABLE_BIG_INTEGER]
      once
         Result := {FAST_ARRAY[MUTABLE_BIG_INTEGER] << create {MUTABLE_BIG_INTEGER}.from_integer(0), create {MUTABLE_BIG_INTEGER}.from_integer(1), create {MUTABLE_BIG_INTEGER}.from_integer(-1), create {MUTABLE_BIG_INTEGER}.from_integer(2), create {MUTABLE_BIG_INTEGER}.from_integer(-2), create {MUTABLE_BIG_INTEGER}.from_integer(3), create {MUTABLE_BIG_INTEGER}.from_integer(-3), create {MUTABLE_BIG_INTEGER}.from_integer(1000), create {MUTABLE_BIG_INTEGER}.from_integer(-1000), create {MUTABLE_BIG_INTEGER}.from_integer(1000000000), create {MUTABLE_BIG_INTEGER}.from_integer(-1000000000), create {MUTABLE_BIG_INTEGER}.from_integer(Maximum_integer), create {MUTABLE_BIG_INTEGER}.from_integer(-Maximum_integer), create {MUTABLE_BIG_INTEGER}.from_integer_64(-Minimum_integer.to_integer_64), create {MUTABLE_BIG_INTEGER}.from_integer(Minimum_integer), create {MUTABLE_BIG_INTEGER}.from_integer_64(Maximum_integer_64), create {MUTABLE_BIG_INTEGER}.from_integer_64(-Maximum_integer_64), create {MUTABLE_BIG_INTEGER}.from_string("9223372036854775808"), create {MUTABLE_BIG_INTEGER}.from_integer_64(Minimum_integer_64
         -- -Minimum_integer_64
         ), create {MUTABLE_BIG_INTEGER}.from_string("1000000000000000000"), create {MUTABLE_BIG_INTEGER}.from_string("-1000000000000000000"
         -- 10^18
         ), create {MUTABLE_BIG_INTEGER}.from_string("1000000000000000000000000000000" -- -10^18
         ), create {MUTABLE_BIG_INTEGER}.from_string("-1000000000000000000000000000000" -- 10^30
         ), create {MUTABLE_BIG_INTEGER}.from_string("100000000000000000000000000000000000000000000000000" -- -10^30
         ), create {MUTABLE_BIG_INTEGER}.from_string("-100000000000000000000000000000000000000000000000000" -- 10^50
         ), create {MUTABLE_BIG_INTEGER}.from_string("99999999999999999999999999999999999999999999999999" -- -10^50
         ), create {MUTABLE_BIG_INTEGER}.from_string("-99999999999999999999999999999999999999999999999999" -- 10^50 - 1
         ), create {MUTABLE_BIG_INTEGER}.from_string("100000000000000000000000000000000000000000000000001" -- -(10^50 - 1)
         ), create {MUTABLE_BIG_INTEGER}.from_string("-100000000000000000000000000000000000000000000000001" -- 10^50 + 1
         ) -- -(10^50 + 1)
          >> }
      end

feature {ANY}
   numbers1: FAST_ARRAY[MUTABLE_BIG_INTEGER]
         -- Give an independant copy of `numbers_check'.
      local
         i: INTEGER
      once
         create Result.with_capacity(numbers_check.capacity)
         from
            i := numbers_check.lower
         until
            i > numbers_check.upper
         loop
            Result.add_last(numbers_check.item(i).twin)
            i := i + 1
         end
      end

   numbers2: FAST_ARRAY[MUTABLE_BIG_INTEGER]
         -- Give another independant copy of `numbers_check'.
      local
         i: INTEGER
      once
         create Result.with_capacity(numbers_check.capacity)
         from
            i := numbers_check.lower
         until
            i > numbers_check.upper
         loop
            Result.add_last(numbers_check.item(i).twin)
         end
      end

   restore (n: FAST_ARRAY[MUTABLE_BIG_INTEGER])
         -- Restore `n' (which is `number1' or `number2'.
      require
         n = numbers1 or n = numbers2
      local
         i: INTEGER
      do
         from
            i := numbers_check.lower
         until
            i > numbers_check.upper
         loop
            if numbers_check.item(i).is_equal(n.item(i)) then
               if n.item(i) = Void then
                  n.put(numbers_check.item(i).twin, i)
               else
                  n.item(i).copy(numbers_check.item(i))
               end
            end
            i := i + 1
         end
      end

   verify (n: FAST_ARRAY[MUTABLE_BIG_INTEGER])
         -- Are the numbers original ? Restore the bad number.
      local
         i: INTEGER
      do
         from
            i := numbers_check.lower
         until
            i > numbers_check.upper
         loop
            assert(numbers_check.item(i).is_equal(n.item(i)))
            i := i + 1
         end
      end

   verify_and_restore (n: FAST_ARRAY[MUTABLE_BIG_INTEGER])
         -- Are the numbers original ? Restore the bad number.
      local
         i: INTEGER; b: BOOLEAN
      do
         from
            i := numbers_check.lower
         until
            i > numbers_check.upper
         loop
            b := numbers_check.item(i).is_equal(n.item(i))
            assert(b)
            if b then
               if n.item(i) = Void then
                  n.put(numbers_check.item(i).twin, i)
               else
                  n.item(i).copy(numbers_check.item(i))
               end
            end
            i := i + 1
         end
      end

end -- class AUX_MUTABLE_BIG_INTEGER1
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
