-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY03
   --
   -- To check that the simplify work is actually done (for -boost mode only).
   --
   -- Special test for precomputable once routines.
   --

inherit
   EIFFELTEST_TOOLS

create {}
   make

create {TEST_SIMPLIFY03}
   make_1, make_2, make_like_string

feature {}
   make
      do
         assert_counter.reset
         assert(assert_counter.item = 0)
         -- The generated C code is now a very simple sequence of assert calls  :-)
         if once_counter = Void then
            c_inline_c("*NoCcodeGenerated01")
         else
            assert(assert_counter.item = 1)
         end
         if once_counter /= Void then
            assert(assert_counter.item = 2)
         else
            c_inline_c("*NoCcodeGenerated02")
         end
         if once_string = Void then
            c_inline_c("*NoCcodeGenerated03")
         else
            assert(assert_counter.item = 3)
         end
         if once_string.lower = 0 then
            c_inline_c("*NoCcodeGenerated04")
         else
            assert(assert_counter.item = 4)
         end
         if once_make_1 = Void then
            c_inline_c("*NoCcodeGenerated05")
         else
            assert(assert_counter.item = 5)
         end
         if once_make_2 = Void then
            c_inline_c("*NoCcodeGenerated06")
         else
            assert(assert_counter.item = 6)
         end
         if once_make_like_string = Void then
            c_inline_c("*NoCcodeGenerated07")
         else
            assert(assert_counter.item = 7)
         end
         if once_make_tuple.count /= 2 then
            c_inline_c("*NoCcodeGenerated08")
         else
            assert(assert_counter.item = 8)
         end
      end

   once_make_1: TEST_SIMPLIFY03
      once
         create Result.make_1
      end

   once_make_2: TEST_SIMPLIFY03
      once
         create Result.make_2
      end

   once_make_like_string: TEST_SIMPLIFY03
      once
         create Result.make_like_string(0)
      end

   once_make_tuple: TUPLE[INTEGER_8, CHARACTER]
      once
         Result := [1, 'A']
      end

   make_1
      local
         i: INTEGER
      do
         i := i + 1
      end

   make_2
      local
         i: INTEGER
      do
         i := i + 1
         i := i - 2
      end

   capacity, count: INTEGER

   storage: NATIVE_ARRAY[CHARACTER]

   make_like_string (needed_capacity: INTEGER)
         -- Initialize the string to have at least `needed_capacity' characters of storage.
      require
         non_negative_size: needed_capacity >= 0
      do
         if needed_capacity > 0 then
            --            if capacity < needed_capacity then
            storage := (create {NATIVE_ARRAY[CHARACTER]}).calloc(needed_capacity)
            capacity := needed_capacity
            --            end
         end
         count := 0
      ensure
         needed_capacity <= capacity
         empty_string: count = 0
      end

   once_counter: COUNTER
      once
         create Result
      end

   once_string: STRING
      once
         Result := once ""
      end

end -- class TEST_SIMPLIFY03
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
