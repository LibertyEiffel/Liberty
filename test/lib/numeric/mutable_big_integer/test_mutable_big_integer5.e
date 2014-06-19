-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER5
   --
   -- Testing comparison.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      do
         check_compare(1, 2)
         --
         check_compare(0, 0)
         check_compare(1, 0)
         check_compare(1, 1)
         check_compare(2, 0)
         check_compare(2, 1)
         check_compare(3, 0)
         check_compare(3, 1)
         check_compare(3, 2)
         check_compare(3, 3)
         check_compare(Maximum_integer - 3, 0)
         check_compare(Maximum_integer - 3, 1)
         check_compare(Maximum_integer - 3, 2)
         check_compare(Maximum_integer - 3, 3)
         check_compare(Maximum_integer, 0)
         check_compare(Maximum_integer, 1)
         check_compare(Maximum_integer, 2)
         check_compare(Maximum_integer, 3)
         check_compare(Maximum_integer, Maximum_integer.to_integer_64)
         check_compare(Maximum_integer, Maximum_integer.to_integer_64 + 1)
         check_compare(Maximum_integer, Maximum_integer.to_integer_64 + 2)
         check_compare(Maximum_integer, Maximum_integer.to_integer_64 + 3)
         check_compare(Maximum_integer, Maximum_integer.to_integer_64 + 4)
         check_compare(Maximum_integer_64 - 3, 0)
         check_compare(Maximum_integer_64 - 3, 1)
         check_compare(Maximum_integer_64 - 3, 2)
         check_compare(Maximum_integer_64 - 3, 3)
         check_compare(Maximum_integer_64, 1)
         check_compare(Maximum_integer_64, Maximum_integer_64)
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER5 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

   check_compare (a, b: INTEGER_64)
      local
         c, d: INTEGER_64; mbia, mbib: MUTABLE_BIG_INTEGER
      do
         --
         create mbia.from_integer_64(a)
         create mbib.from_integer_64(b)
         if a < b then
            assert(mbia < mbib)
            assert(mbia <= mbib)
            assert(mbib > mbia)
            assert(mbib >= mbia)
            assert(not mbia.is_equal(mbib))
         elseif b < a then
            assert(mbib < mbia)
            assert(mbib <= mbia)
            assert(mbia > mbib)
            assert(mbia >= mbib)
            assert(not mbia.is_equal(mbib))
         else
            assert(not (mbib < mbia))
            assert(mbib >= mbia)
            assert(not (mbia > mbib))
            assert(mbia <= mbib)
            assert(mbia.is_equal(mbib))
         end
         --
         c := -a
         d := b
         create mbia.from_integer_64(c)
         create mbib.from_integer_64(d)
         if c < d then
            assert(mbia < mbib)
            assert(mbia <= mbib)
            assert(mbib > mbia)
            assert(mbib >= mbia)
            assert(not mbia.is_equal(mbib))
         elseif d < c then
            assert(mbib < mbia)
            assert(mbib <= mbia)
            assert(mbia > mbib)
            assert(mbia >= mbib)
            assert(not mbia.is_equal(mbib))
         else
            assert(not (mbib < mbia))
            assert(mbib >= mbia)
            assert(not (mbia > mbib))
            assert(mbia <= mbib)
            assert(mbia.is_equal(mbib))
         end
         --
         c := a
         d := -b
         create mbia.from_integer_64(c)
         create mbib.from_integer_64(d)
         if c < d then
            assert(mbia < mbib)
            assert(mbia <= mbib)
            assert(mbib > mbia)
            assert(mbib >= mbia)
            assert(not mbia.is_equal(mbib))
         elseif d < c then
            assert(mbib < mbia)
            assert(mbib <= mbia)
            assert(mbia > mbib)
            assert(mbia >= mbib)
            assert(not mbia.is_equal(mbib))
         else
            assert(not (mbib < mbia))
            assert(mbib >= mbia)
            assert(not (mbia > mbib))
            assert(mbia <= mbib)
            assert(mbia.is_equal(mbib))
         end
         --
         c := -a
         d := -b
         create mbia.from_integer_64(c)
         create mbib.from_integer_64(d)
         if c < d then
            assert(mbia < mbib)
            assert(mbia <= mbib)
            assert(mbib > mbia)
            assert(mbib >= mbia)
            assert(not mbia.is_equal(mbib))
         elseif d < c then
            assert(mbib < mbia)
            assert(mbib <= mbia)
            assert(mbia > mbib)
            assert(mbia >= mbib)
            assert(not mbia.is_equal(mbib))
         else
            assert(not (mbib < mbia))
            assert(mbib >= mbia)
            assert(not (mbia > mbib))
            assert(mbia <= mbib)
            assert(mbia.is_equal(mbib))
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER5
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
