-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class AUX_JMJ5

feature {ANY}
   x, y: INTEGER

feature {ANY}
   set (nx, ny: like x)
      do
         x := nx
         y := ny
      ensure
         x = nx
         y = ny
      end

   next_towards (target: like Current): like Current
      do
         Result.set(target.x - 1, target.y - 1)
      end

   test
      local
         h1, h2, next, h3: like Current
      do
         h1.set(3, 3)
         h2.set(2, 6)
         next.set(1, 5)
         if h1.next_towards(h2) = next then
         else
            std_output.put_string("TEST_JMJ5: ERROR Test #1%N")
         end
         h3 := h1.next_towards(h2)
         if h3 = next then
         else
            std_output.put_string("TEST_JMJ5: ERROR Test #2%N")
         end
      end

end -- class AUX_JMJ5
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
