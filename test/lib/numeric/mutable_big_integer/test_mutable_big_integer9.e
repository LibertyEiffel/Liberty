-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER9
   --
   -- Test of `add' and `add_to', `subtract' and `subtract_to'.
   --

insert
   EIFFELTEST_TOOLS
   PLATFORM

create {}
   make

feature {ANY}
   make
      do
         check_sign(0, 0, "+")
         check_sign(0, 1, "+")
         check_sign(0, -1, "+")
         check_sign(1, 0, "+")
         check_sign(-1, 0, "+")
         check_sign(3, 2, "+")
         check_sign(3, -2, "+")
         check_sign(2, -3, "+")
         check_sign(-3, 2, "+")
         check_sign(-2, 3, "+")
         check_sign(2, -2, "+")
         check_sign(-2, 2, "+")
         check_sign(-3, -2, "+")
         check_sign(0, 0, "-")
         check_sign(0, 1, "-")
         check_sign(0, -1, "-")
         check_sign(1, 0, "-")
         check_sign(-1, 0, "-")
         check_sign(3, 2, "-")
         check_sign(2, 3, "-")
         check_sign(3, -2, "-")
         check_sign(-3, 2, "-")
         check_sign(-2, 3, "-")
         check_sign(-3, -2, "-")
         check_sign(-2, -3, "-")
         check_sign(Minimum_integer_64, Minimum_integer_64, "-")
         check_sign(Minimum_integer, Minimum_integer, "-")
      end

   check_sign (a, b: INTEGER_64; sign: STRING)
      local
         c: INTEGER_64; mbia, mbib, mbic: MUTABLE_BIG_INTEGER
      do
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         create mbic.from_integer(0)
         if sign.is_equal(once "+") then
            c := a + b
            check
               c = a + b
            end
            mbia.add_to(mbib, mbic)
            assert(mbia.to_integer_64 = a)
            assert(mbib.to_integer_64 = b)
            assert(mbic.to_integer_64 = c)
            mbia.add(mbib)
            assert(mbia.is_equal(mbic))
            assert(mbia.to_integer_64 = c)
            assert(mbib.to_integer_64 = b)
            if a > 0 and b > 0 then
               assert(not mbia.is_negative)
               assert(not mbib.is_negative)
            elseif a > 0 and b < 0 then
               if a >= -b then
                  assert(not mbia.is_negative)
               else
                  assert(mbia.is_negative)
               end
               assert(mbib.is_negative)
            elseif a < 0 and b > 0 then
               if -a > b then
                  assert(mbia.is_negative)
               else
                  assert(not mbia.is_negative)
               end
               assert(not mbib.is_negative)
            elseif a < 0 and b < 0 then
               assert(mbia.is_negative)
               assert(mbib.is_negative)
            end
         else
            c := a - b
            check
               c = a - b
            end
            mbia.subtract_to(mbib, mbic)
            assert(mbia.to_integer_64 = a)
            assert(mbib.to_integer_64 = b)
            assert(mbic.to_integer_64 = c)
            mbia.subtract(mbib)
            assert(mbia.is_equal(mbic))
            assert(mbia.to_integer_64 = c)
            assert(mbib.to_integer_64 = b)
            if a > 0 and b > 0 then
               if a >= b then
                  assert(not mbia.is_negative)
               else
                  assert(mbia.is_negative)
               end
               assert(not mbib.is_negative)
            elseif a > 0 and b < 0 then
               assert(not mbia.is_negative)
               assert(mbib.is_negative)
            elseif a < 0 and b > 0 then
               assert(mbia.is_negative)
               assert(not mbib.is_negative)
            elseif a < 0 and b < 0 then
               if a < b then
                  assert(mbia.is_negative)
               else
                  assert(not mbia.is_negative)
               end
               assert(mbib.is_negative)
            end
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER9
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
