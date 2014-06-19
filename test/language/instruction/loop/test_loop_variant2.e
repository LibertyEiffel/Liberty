-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_LOOP_VARIANT2

create {}
   make

feature {ANY}
   make
      local
         i: INTEGER
      do
         from
            i := 0
         invariant
            do_loop_invariant(i)
         variant
            do_loop_variant(i)
         until
            i = 10
         loop
            i := i + 1
         end
         debug
            check
               invariant_counter = 11
               variant_counter = 10
            end
         end
      end

feature {}
   invariant_counter: INTEGER

   variant_counter: INTEGER

   do_loop_invariant (i: INTEGER): BOOLEAN
      do
         invariant_counter := invariant_counter + 1
         Result := True
      end

   do_loop_variant (i: INTEGER): INTEGER
      do
         variant_counter := variant_counter + 1
         Result := 50 - i
      end

end -- class TEST_LOOP_VARIANT2
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
