-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REAL

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         i: INTEGER; r: REAL
      do
         assert(1.0 = 1.0000)
         assert(0.0 = 0.00)
         assert(1.05 = 1.050)
         r := 1.6
         assert(r = r)
         assert(r = 1.6)
         assert(r >= 1.59)
         assert(r <= 1.61)
         assert(1.0 < 1.1)
         assert(1.0 <= 1.1)
         assert(0.0 < 0.5)
         assert(0.0 <= 0.5)
         assert(-0.5 < 0.0)
         assert(-0.5 <= 0.5)
         assert(-1.5 < 1.5)
         assert(-1.5 <= 1.5)
         assert(1.1 > 1.0)
         assert(1.1 > 1)
         assert(1.1 >= 1.0)
         assert(1.1 >= 1)
         assert(0.5 > 0.0)
         assert(0.5 > 0)
         assert(0.0 > -0.5)
         assert(0.5 >= -0.5)
         assert(1.5 > -1.5)
         assert(1.5 >= -1.5)
         assert(1.0 + 1.0 = 2.0)
         assert(1.5 = 1.5)
         assert(-1.5 = -1.5)
         r := 2
         assert(r = 2.0)
         i := 2
         r := i
         assert(r = 2)
         assert(r = 2.0)
         assert(3.5.floor = 3)
         assert(3.5.ceiling = 4)
         assert((-3.5).floor = -4)
         assert((-3.5).ceiling = -3)
         assert(0.6.floor = 0)
         assert(0.4.ceiling = 1)
         assert((-0.4).rounded.force_to_integer_32 = 0)
         assert((-0.51).rounded.force_to_integer_32 = -1)
         assert((-1.49).ceiling.force_to_integer_32 = -1)
         assert((-1.51).floor.force_to_integer_32 = -2)
         assert(0.4.rounded = 0)
         assert(0.51.rounded = 1)
         assert(1.49.rounded = 1)
         assert(1.51.rounded = 2)
         assert((-0.4).rounded = 0)
         assert((-0.51).rounded = -1)
         assert((-1.49).rounded = -1)
         assert((-1.51).rounded = -2)
         r := 1.51.to_string.to_real
         assert(r < 1.511)
         assert(r > 1.509)
         r := (-1.51).to_string.to_real
         assert(r > -1.52)
         assert(r < -1.50)
         assert(r.abs < 1.52)
         assert(r.abs > 1.50)
         assert((-r).abs < 1.52)
         assert((-r).abs > 1.50)
         assert(3.5.min(4.5) = 3.5)
         assert(4.5.min(3.5) = 3.5)
         assert(3.5.max(4.5) = 4.5)
         assert(4.5.max(3.5) = 4.5)
         assert((-3.5).min(-4.5) = -4.5)
         assert((-4.5).min(-3.5) = -4.5)
         assert((-3.5).max(-4.5) = -3.5)
         assert((-4.5).max(-3.5) = -3.5)
         r := 3.1 ^ 2
         assert(r > 9.6099989)
         assert(r < 9.6199999)
         assert(4.0.sqrt = 2.0)
      end

end -- class TEST_REAL
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
