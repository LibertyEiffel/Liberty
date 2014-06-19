-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_ASSERTION

insert
   ASSERTION_CONSTANTS

create {ANY}
   make

feature {}
   trace: ARRAY[INTEGER]

   make (t: like trace)
      do
         trace := t
      end

feature {ANY}
   do_call
      require
         require_test
      local
         stop: BOOLEAN
      do
         from
         invariant
            loop_invariant_test
         variant
            variant_test
         until
            stop
         loop
            stop := True
         end
         check
            check_test
         end
         debug
            debug_test
         end
      ensure
         ensure_test
      end

feature {}
   require_test: BOOLEAN
      do
         trace.put(trace.item(require_index) + 1, require_index)
         Result := True
      end

   ensure_test: BOOLEAN
      do
         trace.put(trace.item(ensure_index) + 1, ensure_index)
         Result := True
      end

   class_invariant_test: BOOLEAN
      do
         trace.put(trace.item(class_invariant_index) + 1, class_invariant_index)
         Result := True
      end

   loop_invariant_test: BOOLEAN
      do
         trace.put(trace.item(loop_invariant_index) + 1, loop_invariant_index)
         Result := True
      end

   variant_test: INTEGER
      do
         trace.put(trace.item(variant_index) + 1, variant_index)
         Result := 1
      end

   check_test: BOOLEAN
      do
         trace.put(trace.item(check_index) + 1, check_index)
         Result := True
      end

   debug_test
      do
         trace.put(trace.item(debug_index) + 1, debug_index)
      end

invariant
   class_invariant_test

end -- class AUX_ASSERTION
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
