-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ASSERTION_LOOP1
   -- To be run only in "-loop_check" mode.

insert
   EIFFELTEST_TOOLS
   ASSERTION_CONSTANTS

create {}
   main

feature {ANY}
   main
      local
         trace: ARRAY[INTEGER]; aux: AUX_ASSERTION
      do
         create trace.make(require_index, debug_index)
         assert(trace.count = 7) -- assert #  1
         assert(trace.occurrences(0) = 7) -- assert #  2
         create aux.make(trace)
         assert(trace.item(require_index) = 0) -- assert #  3
         assert(trace.item(ensure_index) = 0) -- assert #  4
         assert(trace.item(class_invariant_index).in_range(1, 2)) -- assert #  5
         assert(trace.item(loop_invariant_index) = 0) -- assert #  6
         assert(trace.item(variant_index) = 0) -- assert #  7
         assert(trace.item(check_index) = 0) -- assert #  8
         assert(trace.item(debug_index) = 0) -- assert #  9
         aux.do_call
         assert(trace.item(require_index) = 1) -- assert # 10
         assert(trace.item(ensure_index) = 1) -- assert # 11
         assert(trace.item(class_invariant_index).in_range(3, 4)) -- assert # 12
         assert(trace.item(loop_invariant_index) = 2) -- assert # 13
         assert(trace.item(variant_index) = 1) -- assert # 14
         assert(trace.item(check_index) = 0) -- assert # 15
         assert(trace.item(debug_index) = 0) -- assert # 16
      end

end -- class TEST_ASSERTION_LOOP1
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
