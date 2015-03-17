-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class AUX_AGENT_GC6

feature {ANY}
   head, tail: AUX_AGENT_GC7

   clear
      do
         head := Void
         tail := Void
      end

   add (p: AUX_AGENT_GC3)
      local
         node: AUX_AGENT_GC7
      do
         create node.set_patient(p)
         if tail = Void then
            head := node
         else
            tail.set_next(node)
         end
         tail := node
      end

   remove (p: AUX_AGENT_GC3)
      local
         node, previous: AUX_AGENT_GC7
      do
         from
            node := head
         until
            node = Void or else node.patient = p
         loop
            previous := node
            node := node.next
         end
         if node /= Void then
            if previous /= Void then
               previous.set_next(node.next)
            else
               head := node.next
            end
            if tail = node then
               tail := previous
            end
         end
      end

   for_each (proc: ROUTINE[TUPLE[AUX_AGENT_GC3]])
      local
         node: AUX_AGENT_GC7
      do
         from
            node := head
         until
            node = Void
         loop
            proc.call([node.patient])
            node := node.next
         end
      end

   accumulate_totals: AUX_AGENT_GC5
      local
         node: AUX_AGENT_GC7
      do
         from
            node := head
         until
            node = Void
         loop
            Result.add(node.patient)
            node := node.next
         end
      end

end -- class AUX_AGENT_GC6
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
