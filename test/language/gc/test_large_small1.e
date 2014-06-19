-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_LARGE_SMALL1
   -- This tests for the same bug as TEST_STRING3, but it also works with assertions turned off. The bug happens
   -- when creations and destructions of resizable objets that are slightly smaller than n*RSOC_SIZE (with n
   -- strictly greater than 1) are intermixed with creations of small resizable objects of the same type.
   --
   -- This test uses arrays of integeres rather than strings, to avoid interaction with the runtime.

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   range: INTEGER 10

   make
      local
         a1, a2: FAST_ARRAY[INTEGER]; m: MEMORY
      do
         m.set_low_memory_strategy
         create a1.make(16000)
         a1 := Void
         create a1.make(16000)
         create a2.make(100)
         a2.set_all_with(2)
         a1 := Void
         create a1.make(16000)
         a1.set_all_with(1)
         a1 := Void
         create a1.make(16000)
         a1.set_all_with(1)
         assert(a2.occurrences(2) = a2.count)
      end

end -- class TEST_LARGE_SMALL1
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
