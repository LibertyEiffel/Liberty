-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER8
   --
   -- Testing features `shift_left' and `shift_right'.
   --

create {}
   make

feature {ANY}
   make
      local
         step: INTEGER
      do
         from
            step := 1
         until
            step >= 62
         loop
            shift_left_then_come_back(step)
            step := step + 1
         end
      end

   shift_left_then_come_back (step: INTEGER)
      require
         step.in_range(0, power_2_memory.upper - 1)
      local
         mbia: MUTABLE_BIG_INTEGER; i: INTEGER
      do
         create mbia.from_integer_64(1)
         i := 0
         -- Shifting left by `step' to reach the greatest `power_2_memory':
         from
         until
            i > 59 -- *** WE SHOULD BE ABLE TO GO TO power_2_memory.upper *** BUG
         loop
            assert(mbia.to_string.is_equal(power_2_memory.item(i).to_string))
            mbia.shift_left(step)
            i := i + step
         end
         -- Shifting right by `step' to come back to 0:
         from
         until
            i = 0
         loop
            i := i - step
            mbia.shift_right(step)
            assert(mbia.to_string.is_equal(power_2_memory.item(i).to_string))
         end
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER8 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

   power_2_memory: FAST_ARRAY[INTEGER_64]
         -- The associated power 2 value at the corresponding index.
         -- (Valid for range [2^0 .. 2^62].)
      local
         i: INTEGER; v: INTEGER_64
      once
         from
            create Result.with_capacity(64)
            i := 0
            v := 1
         until
            v < 0
         loop
            Result.add_last(v)
            i := i + 1
            v := v #* 2
         end
         check
            Result.upper = 62
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER8
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
