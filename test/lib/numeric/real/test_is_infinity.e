-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_IS_INFINITY
   --
   -- Of REAL_GENERAL.
   --

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         real_32: REAL_32; real_64: REAL_64; real_extended: REAL_EXTENDED
      do
         assert(not real_64.is_infinity)
         real_64 := unchecked_c_divide_64(1.0, 0.0)
         assert(real_64.is_infinity)
         assert(real_64 > 0)
         real_64 := unchecked_c_divide_64(-1.0, 0.0)
         assert(real_64.is_infinity)
         assert(real_64 < 0)
         assert(not real_32.is_infinity)
         real_32 := unchecked_c_divide_32({REAL_32 1.0}, {REAL_32 0.0})
         assert(real_32.is_infinity)
         assert(real_32 > 0)
         real_32 := unchecked_c_divide_32(-{REAL_32 1.0}, {REAL_32 0.0})
         assert(real_32.is_infinity)
         assert(real_32 < 0)
         assert(not real_extended.is_infinity)
         real_extended := unchecked_c_divide_ext({REAL_EXTENDED 1.0}, {REAL_EXTENDED 0.0})
         assert(real_extended.is_infinity)
         assert(real_extended > 0)
         real_extended := unchecked_c_divide_ext(-{REAL_EXTENDED 1.0}, {REAL_EXTENDED 0.0})
         assert(real_extended.is_infinity)
         assert(real_extended < 0)
      end

feature {}
   unchecked_c_divide_64(x, y: REAL_64): REAL_64
      external "C inline"
      alias "(($x) / ($y))"
      end
   
   unchecked_c_divide_32(x, y: REAL_32): REAL_32
      external "C inline"
      alias "(($x) / ($y))"
      end

   unchecked_c_divide_ext(x, y: REAL_EXTENDED): REAL_EXTENDED
      external "C inline"
      alias "(($x) / ($y))"
      end
   
end -- class TEST_IS_INFINITY
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
