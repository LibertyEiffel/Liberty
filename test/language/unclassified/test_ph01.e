-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_PH01
   -- From: Philip Malin <psm@whitedove.melbourneit.com.au>

create {}
   make

feature {ANY}
   make
      local
         splay: AUX_PH01_SPLAY_DICTIONARY[INTEGER, INTEGER]; iterator: AUX_PH01_SPLAY_DICTIONARY_ITERATOR[INTEGER]
         rand: PRESS_RANDOM_NUMBER_GENERATOR; i: INTEGER; index: INTEGER
      do
         create splay.make
         create rand.make
         from
            i := 1
         until
            i > 10000
         loop
            rand.next
            index := rand.last_integer(10000)
            if not splay.has(index) then
               splay.put(i, index)
            end
            i := i + 1
         end
         from
            iterator := splay.new_iterator
         until
            iterator.is_off
         loop
            i := iterator.index
            i := splay.item(iterator.index)
            iterator.next
         end
      end

end -- class TEST_PH01
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
