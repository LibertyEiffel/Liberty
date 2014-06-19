-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FORCE_TO_INTEGER
   -- To test force_to_integer_64, force_to_integer_32 and force_to_integer_16.

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         integer_16: INTEGER_16; integer_32: INTEGER_32; integer_64: INTEGER_64; real_32: REAL_32; real_64: REAL_64
      do
         real_64 := 0.4
         integer_16 := real_64.force_to_integer_16
         assert(integer_16 = 0)
         assert(0.4.force_to_integer_16 = 0)
         real_32 := {REAL_32 0.4}
         integer_16 := real_32.force_to_integer_16
         assert(integer_16 = 0)
         assert({REAL_32 0.4}.force_to_integer_16 = 0)
         real_64 := 0.4
         integer_32 := real_64.force_to_integer_32
         assert(integer_32 = 0)
         assert(0.4.force_to_integer_32 = 0)
         real_32 := {REAL_32 0.4}
         integer_32 := real_32.force_to_integer_32
         assert(integer_32 = 0)
         assert({REAL_32 0.4}.force_to_integer_32 = 0)
         real_64 := 0.4
         integer_64 := real_64.force_to_integer_64
         assert(integer_64 = 0)
         assert(0.4.force_to_integer_64 = 0)
         real_32 := {REAL_32 0.4}
         integer_64 := real_32.force_to_integer_64
         assert(integer_64 = 0)
         assert({REAL_32 0.4}.force_to_integer_64 = 0)
         assert(0.51.force_to_integer_64 = 0)
         assert(0.51.force_to_integer_32 = 0)
         assert(0.51.force_to_integer_16 = 0)
         assert(1.49.force_to_integer_64 = 1)
         assert(1.49.force_to_integer_32 = 1)
         assert(1.49.force_to_integer_16 = 1)
         assert(1.51.force_to_integer_64 = 1)
         assert(1.51.force_to_integer_32 = 1)
         assert(1.51.force_to_integer_16 = 1)
         assert((-0.4).rounded.force_to_integer_32 = 0)
         assert((-0.51).rounded.force_to_integer_32 = -1)
         assert((-1.49).ceiling.force_to_integer_32 = -1)
         assert((-1.51).floor.force_to_integer_32 = -2)
         integer_64 := -9007199254740992
         assert(integer_64.fit_real_64)
         real_64 := integer_64.force_to_real_64
         assert(real_64.force_to_integer_64 = integer_64)
         integer_64 := -9007199254740993
         assert(not integer_64.fit_real_64)
         integer_64 := -9007199254740994
         assert(integer_64.fit_real_64)
         real_64 := integer_64.force_to_real_64
         assert(real_64.force_to_integer_64 = integer_64)
      end

end -- class TEST_FORCE_TO_INTEGER
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
