-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class AUX_JLP8_OPERATOR[E]

feature {ANY}
   run is
      do
         before_run
         for_each
         after_run
      end

   make (p: AUX_JLP8_PROVIDER[E]) is
      do
         provider := p.twin
      end

   attach (p: AUX_JLP8_PROVIDER[E]) is
      do
         provider := p
      end

   is_runnable: BOOLEAN is
      do
         Result := provider /= Void and then provider.is_runnable
      end

   abort is
      do
         provider.abort
      end

   aborted: BOOLEAN is
      do
         Result := provider.aborted
      end

   before_run is
      do
      end

   after_run is
      do
      end

   item_action (elem: E) is
      deferred
      end

   provider: AUX_JLP8_PROVIDER[E]

   for_each is
      do
         from
            provider.start
         until
            provider.exhausted
         loop
            item_action(provider.item)
            provider.next
         end
      end

end -- class AUX_JLP8_OPERATOR
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
