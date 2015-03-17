-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_AGENT53_CONTAINER[G]

create {ANY}
   make

feature {ANY}
   list: FAST_ARRAY[G]

   make
      do
         create list.make(0)
      end

   stats_for (fct: FUNCTION[TUPLE[G], TUPLE[INTEGER, INTEGER]]): REAL
      local
         ti: TUPLE[INTEGER, INTEGER]; i, n1, n2: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper
         loop
            ti := fct.item([list.item(i)])
            n1 := n1 + ti.first
            n2 := n2 + ti.second
            i := i + 1
         end
         if n1 /= 0 then
            Result := n2 / n1 * 100
         end
      end

   exists (test: FUNCTION[TUPLE[G], BOOLEAN]): BOOLEAN
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            i > list.upper or else Result
         loop
            Result := test.item([list.item(i)])
            i := i + 1
         end
      end

end -- class AUX_AGENT53_CONTAINER
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
