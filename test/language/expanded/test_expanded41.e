-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXPANDED41

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {}
   make
      local
         a, b: AUX_EXPANDED41; ar1, ar2: FAST_ARRAY[AUX_EXPANDED41]
      do
         assert(a.id /= b.id)
         assert(a = b)
         a.set_value(42)
         assert(a.value = 42)
         assert(a /= b)
         b.set_value(42)
         assert(b.value = 42)
         assert(a = b)

         b.set_value(13)
         create ar1.make(0)
         ar1.add_last(a)
         ar1.add_last(b)

         assert(ar1.first.id /= a.id)
         assert(ar1.last.id /= b.id)
         assert(ar1.first = a)
         assert(ar1.last = b)

         ar2 := ar1.slice(ar1.lower, ar1.upper)
         assert(ar2.count = ar1.count) -- just a trivial copy that triggers `slice_copy`
         assert(ar2.first.id /= a.id)
         assert(ar2.last.id /= b.id)
         assert(ar2.first = ar1.first)
         assert(ar2.last = ar2.last)
         assert(ar2.first = a)
         assert(ar2.last = b)
      end

end -- class TEST_EXPANDED41
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
