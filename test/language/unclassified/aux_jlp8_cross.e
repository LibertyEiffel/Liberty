-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class AUX_JLP8_CROSS[E, F, G]

inherit
   AUX_JLP8_PROVIDER[G]
      redefine is_runnable
      end

feature {ANY}
   attach (p1: AUX_JLP8_PROVIDER[E]; p2: AUX_JLP8_PROVIDER[F])
      do
         prov1 := p1
         prov2 := p2
      end

   start
      do
         prov1.start
         prov2.start
      end

   next
      do
         prov1.next
         prov2.next
      end

   item: G
      do
         Result := cross_operation(prov1.item, prov2.item)
      end

   exhausted: BOOLEAN
      do
         Result := prov1.exhausted or prov2.exhausted
      end

   abort
      do
         prov1.abort
         prov2.abort
      end

   aborted: BOOLEAN
      do
         Result := prov1.aborted or prov2.aborted
      end

   is_runnable: BOOLEAN
      do
         Result := prov1 /= Void and prov2 /= Void
      end

   cross_operation (e: E; f: F): G
      deferred
      end

   prov1: AUX_JLP8_PROVIDER[E]

   prov2: AUX_JLP8_PROVIDER[F]

end -- class AUX_JLP8_CROSS
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
