-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_JLP8_DOT[E -> NUMERIC]

inherit
   AUX_JLP8_SUM[E]
      rename make as make_sum,
         sum as dot
      redefine is_runnable
      end

insert
   AUX_JLP8_SUM[E]
      rename make as make_sum,
         sum as dot,
         is_runnable as sum_is_runnable
      end

feature {ANY}
   make (u, v: AUX_JLP8_PROVIDER[E])
      do
         create cross
         cross.attach(u, v)
         make_sum(cross)
      end

   is_runnable: BOOLEAN
      do
         Result := sum_is_runnable and cross.is_runnable
      end

   cross: AUX_JLP8_CROSS_MULT[E]

end -- class AUX_JLP8_DOT
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
