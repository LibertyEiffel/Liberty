-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REAL_CONSTANT04
   -- Test the normalisation in {REAL_CONSTANT}.make

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         ref: REAL
      do
         ref := 0.1
         assert(ref = 1e-1)
         assert(ref = 0.1)
         assert(ref = 1.0e-1)
         ref := 21.0
         assert(ref = 210000000000e-10)
         assert(ref = 21000000000E-9)
         assert(ref = 2100000000e-8)
         assert(ref = 210000000E-7)
         assert(ref = 21000000e-6)
         assert(ref = 2100000E-5)
         assert(ref = 210000e-4)
         assert(ref = 21000E-3)
         assert(ref = 2100e-2)
         assert(ref = 210E-01)
         assert(ref = 21)
         assert(ref = 21e0)
         assert(ref = 2.1E1)
         assert(ref = 0.21e2)
         assert(ref = 0.021E3)
         assert(ref = 0.0021e4)
         assert(ref = 0.00021E5)
         assert(ref = 0.000021e6)
         assert(ref = 0.0000021E7)
         assert(ref = 0.00000021e8)
         assert(ref = 0.000000021E9)
         assert(ref = 0.0000000021E10)
      end

end -- class TEST_REAL_CONSTANT04
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
