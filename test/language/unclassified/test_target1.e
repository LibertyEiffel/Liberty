-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_TARGET1
   --
   -- The new relaxed syntax for calls on constants.
   --

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      do
         assert(True.to_string.is_equal("True"))
         assert(False.to_string.is_equal("False"))
         assert(1.5.to_string.is_equal("1.500000"))
         assert({REAL_64 1.5}.to_string.is_equal("1.500000"))
         assert(("12").to_integer = 12)
         assert(1.to_string.is_equal("1"))
         assert((-1).to_string.is_equal("-1"))
         assert(1.to_string.is_equal("1"))
         assert((-1).to_string.is_equal("-1"))
         assert(1.to_string.is_equal("1"))
         assert({INTEGER_8 -1}.to_string.is_equal("-1"))
         assert({INTEGER_16 1}.to_string.is_equal("1"))
         assert((-1.5).to_string.is_equal("-1.500000"))
         assert(1.5.to_string.is_equal("1.500000"))
         assert({ARRAY[INTEGER_8] 1, << 2 >> }.item(1) = 2)
      end

end -- class TEST_TARGET1
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
