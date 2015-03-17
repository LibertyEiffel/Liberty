-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_JMJ3TDT[E]

inherit
   AUX_JMJ3EP[E]

feature {ANY}
   make (target: like container)
      require
         non_void_target: target /= Void
      do
         container := target
      end

   start
      do
         start_i
         start_j
      end

   next
      do
         next_j
         if off_j then
            next_i
            start_j
         end
      end

   item: E
      do
         Result := container.item(i, j)
      end

   put (new: E)
      do
         container.put(new, i, j)
      end

   exhausted: BOOLEAN
      do
         Result := off_i
      end

feature {}
   container: AUX_JMJ3C2D[E]

   i, j: INTEGER

   start_i
      do
         i := container.lower1
      end

   start_j
      do
         j := container.lower2
      end

   next_i
      do
         i := i + 1
      end

   next_j
      do
         j := j + 1
      end

   off_i: BOOLEAN
      do
         Result := i > container.upper1
      end

   off_j: BOOLEAN
      do
         Result := j > container.upper2
      end

end -- class AUX_JMJ3TDT
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
