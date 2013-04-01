-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AC02
   -- From a bug report of Alex Cozzi

insert
   EIFFELTEST_TOOLS

creation {ANY}
   make

feature {ANY}
   Test_count: INTEGER is 10

   make is
      local
         c1: AUX_AC_COMPLEX; c2: AUX_AC_COMPLEX; c3: AUX_AC_COMPLEX; rnd_generator: PRESS_RANDOM_NUMBER_GENERATOR
         i: INTEGER
      do
         from
            create rnd_generator.make
            i := 0
         variant
            Test_count - i
         until
            i = Test_count
         loop
            c1 := random_complex(rnd_generator)
            c2 := random_complex(rnd_generator)
            c3 := random_complex(rnd_generator)
            test_plus(c1, c2, c3)
            test_times(c1, c2, c3)
            test_plus_and_times(c1, c2, c3)
            i := i + 1
         end
      end

   random_complex (rnd: RANDOM_NUMBER_GENERATOR): AUX_AC_COMPLEX is
      local
         re: REAL; im: REAL
      do
         rnd.next
         re := rnd.last_real
         rnd.next
         im := rnd.last_real
         Result.set_item(re, im)
      end

   test_plus (x, y, z: AUX_AC_COMPLEX) is
      local
         zero: AUX_AC_COMPLEX
      do
         zero := zero.zero
         assert(x + zero = x)
         assert(x + y = y + x)
         --         assert(((x + y) + z) = (x + (y + z)));
      end

   test_times (x, y, z: AUX_AC_COMPLEX) is
      local
         one: AUX_AC_COMPLEX
      do
         one := one.one
         assert(x * one = x)
         --         assert((x * y) = (y * x));
         --         assert(((x * y) * z) = (x * (y * z)));
      end

   test_plus_and_times (x, y, z: AUX_AC_COMPLEX) is
      do
         --         assert(((x + y) * z) = (x * z + y * z));
      end

end -- class TEST_AC02
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
