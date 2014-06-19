-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_REAL_CONSTANT05
   --
   -- Various notation for REAL_*
   --

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         real_32: REAL_32; real_64: REAL_64; real: REAL; real_extended: REAL_EXTENDED; string: STRING
      do
         -- Testing REAL / REAL_64:
         assert(0.0 < 0.1)
         real := 10.0
         assert(real.to_string.is_equal("10.000000"))
         assert(real.to_string_format(1).is_equal("10.0"))
         real_64 := 1.0E1
         assert(real_64.to_string.is_equal("10.000000"))
         assert(real_64.to_string_format(0).is_equal("10"))
         assert(real = real_64)
         assert(10.0 = 1.0e1)
         -- Testing REAL_32:
         real_32 := {REAL_32 0.0}
         assert(real_32.to_string.is_equal("0.000000"))
         assert(real_32.to_string_format(8).is_equal("0.00000000"))
         assert(real_32 = 0.0)
         real_32 := {REAL_32 0.5}
         assert(real_32.to_string.is_equal("0.500000"))
         assert(real_32.to_string_format(1).is_equal("0.5"))
         assert(real_32 = 0.5)
         -- Testing REAL_EXTENDED:
         real_extended := {REAL_EXTENDED 3.5}
         assert(real_extended = 3.5)
         assert(real_extended.to_string.is_equal("3.500000"))
         assert(real_extended.to_string_format(6).is_equal("3.500000"))
         real_extended := 3.5
         assert(real_extended = {REAL_EXTENDED 35E-1})
         real_extended := 3.888
         assert(real_extended.to_string.is_equal("3.888000"))
         assert(real_extended.to_string_format(3).is_equal("3.888"))
         -- Finally, testing assignments:
         real_32 := {REAL_32 0.1}
         real_64 := real_32
         assert(real_64.to_string.is_equal("0.100000"))
         real_extended := real_64
         string := 155.5.to_string_scientific(4)
         assert(155.5.to_string_scientific(4).is_equal("1.5550e+02"))
         -- Testing manifest notation with '_' for reals
         real_64 := 5_000.0
         assert((real_64 - 5000.0).abs < 0.1)
      end

end -- class TEST_REAL_CONSTANT05
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
