-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXPANDED33

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         list: LINKED_LIST[AUX_EXPANDED33]; it: ITERATOR[AUX_EXPANDED33]; x: AUX_EXPANDED33; y: AUX_EXPANDED33
         i: INTEGER
      do
         create list.make
         x.set(5)
         y.set(10)
         list.add_last(x)
         list.add_last(y)
         it := list.new_iterator
         it.start
         i := list.lower
         list.item(i).set(1)
         assert(list.item(i).item = 5) --original value not changed (expanded)
         it.item.set(1)
         assert(it.item.item = 5) --original value not changed (expanded)
         it.next
         i := i + 1
         list.item(i).set(1)
         assert(list.item(i).item = 10)
         it.item.set(1)
         assert(it.item.item = 10)
         it.next
         i := i + 1
         assert(x.item = 5)
         assert(y.item = 10)
      end

end -- class TEST_EXPANDED33
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
