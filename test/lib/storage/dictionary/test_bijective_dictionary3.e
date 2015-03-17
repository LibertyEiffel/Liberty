-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BIJECTIVE_DICTIONARY3

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         d1: HASHED_BIJECTIVE_DICTIONARY[INTEGER, INTEGER]; d2: BIJECTIVE_DICTIONARY_REVERSER[INTEGER, INTEGER]
      do
         create d1.make
         create d2.from_bijective_dictionary(d1)
         assert(d1.count = 0)
         d2.put(2, 1)
         assert(d1.count = 1)
         assert(d1.at(2) = 1)
         assert(d1.fast_at(2) = 1)
         assert(d1.has_value(1))
         assert(d1.fast_has_value(1))
         d2.put(4, 3)
         assert(d1.count = 2)
         assert(d1.at(4) = 3)
         assert(d1.fast_at(4) = 3)
         assert(d1.has_value(3))
         assert(d1.fast_has_value(3))
         d2.put(6, 1)
         assert(d1.count = 2)
         assert(d1.at(6) = 1)
         assert(d1.fast_at(6) = 1)
         assert(d1.has(6))
         assert(d1.fast_has(6))
         assert(not d1.has(2))
      end

end -- class TEST_BIJECTIVE_DICTIONARY3
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
