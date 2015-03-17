-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MATHS

insert
   EIFFELTEST_TOOLS
   PLATFORM

create {}
   make

feature {}
   make
      local
         i_8: INTEGER_8; i_16: INTEGER_16; i_32: INTEGER_32; i_64: INTEGER_64; r_32, real_32: REAL_32
         r_64, real_64: REAL_64
      do
         r_32 := Maximum_integer_8.to_real_32
         assert(r_32 = 1.27e+2)
         r_64 := Maximum_integer_8.to_real_64
         assert(r_64 = 1.27e+2)
         r_32 := Maximum_integer_16.to_real_32
         assert(r_32 = 3.2767e+04)
         r_64 := Maximum_integer_16.to_real_64
         assert(r_64 = 3.2767e+04)
         assert(not Maximum_integer_32.fit_real_32)
         real_32 := Maximum_integer_32.force_to_real_32
         real_64 := Maximum_integer_32.to_real_64
         assert(real_32 /= real_64)
         assert(Minimum_integer_32.fit_real_32)
         i_32 := -16777216
         assert(i_32.fit_real_32)
         real_32 := i_32.to_real_32
         assert(real_32.force_to_integer_32 = i_32)
         real_64 := i_32
         assert(real_32 = real_64)
         i_32 := -16777217
         assert(not i_32.fit_real_32)
         i_32 := -16777218
         assert(i_32.fit_real_32)
         real_32 := i_32.to_real_32
         assert(real_32.force_to_integer_32 = i_32)
         real_64 := i_32
         assert(real_32 = real_64)
         i_32 := 16777216
         assert(i_32.fit_real_32)
         real_32 := i_32.to_real_32
         real_64 := i_32
         assert(real_32 = real_64)
         i_32 := 16777217
         assert(not i_32.fit_real_32)
         i_32 := 16777218
         assert(i_32.fit_real_32)
         real_32 := i_32.to_real_32
         real_64 := i_32
         assert(real_32 = real_64)
         assert(not Maximum_integer_64.fit_real_64)
         assert(Minimum_integer_64.fit_real_64)
         i_64 := 9007199254740992
         assert(i_64.fit_real_64)
         real_64 := i_64.to_real_64
         assert(real_64.force_to_integer_64 = i_64)
         i_64 := 9007199254740995
         assert(not i_64.fit_real_64)
         i_64 := 9007199254740994
         assert(i_64.fit_real_64)
         real_64 := i_64.to_real_64
         assert(real_64.force_to_integer_64 = i_64)
         i_64 := -9007199254740992
         assert(i_64.fit_real_64)
         real_64 := i_64.force_to_real_64
         assert(real_64.force_to_integer_64 = i_64)
         i_64 := -9007199254740993
         assert(not i_64.fit_real_64)
         i_64 := -9007199254740994
         assert(i_64.fit_real_64)
         real_64 := i_64.force_to_real_64
         assert(real_64.force_to_integer_64 = i_64)
         i_8 := 1
         r_64 := i_8.log
         assert(r_64 = 0.0)
         i_16 := 1
         r_64 := i_16.log
         assert(r_64 = 0.0)
         i_32 := 1
         r_64 := i_32.log
         assert(r_64 = 0.0)
         i_64 := 1
         r_64 := i_64.log
         assert(r_64 = 0.0)
         i_8 := 1
         r_64 := i_8.log10
         assert(r_64 = 0.0)
         i_16 := 1
         r_64 := i_16.log10
         assert(r_64 = 0.0)
         i_32 := 1
         r_64 := i_32.log10
         assert(r_64 = 0.0)
         i_64 := 1
         r_64 := i_64.log10
         assert(r_64 = 0.0)
         number := Maximum_integer_8.to_number
         assert(number @= Maximum_integer_8)
         number := Maximum_integer_16.to_number
         assert(number @= Maximum_integer_16)
         number := Maximum_integer_32.to_number
         assert(number @= Maximum_integer_32)
         number := Maximum_integer_64.to_number
         assert(number @= Maximum_integer_64)
      end

   number: NUMBER

end -- class TEST_MATHS
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
