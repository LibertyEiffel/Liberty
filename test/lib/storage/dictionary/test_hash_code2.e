-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_HASH_CODE2

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         d: DICTIONARY[INTEGER, CHARACTER]
      do
         create {HASHED_DICTIONARY[INTEGER, CHARACTER]} d.make
         assert(not d.has('b'))
         d.put(6, 'b')
         assert(d.has('b'))
         assert(d.at('b') = 6)
         for_time
      end

   for_time
      local
         d: DICTIONARY[INTEGER, TIME]; t1, t2: TIME
      do
         create {HASHED_DICTIONARY[INTEGER, TIME]} d.make
         t1.update
         assert(not d.has(t1))
         d.put(1, t1)
         assert(d.has(t1))
         assert(d.at(t1) = 1)
         from
            t2.update
         until
            t1.second /= t2.second
         loop
            t2.update
         end
         assert(not d.has(t2))
         d.put(2, t2)
         assert(d.has(t2))
         assert(d.at(t2) = 2)
         assert(d.at(t1) = 1)
      end

end -- class TEST_HASH_CODE2
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
