-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_AGENT_GC2

create {ANY}
   make

feature {ANY}
   alea: AUX_AGENT_GC4

   discharged: AUX_AGENT_GC5

   is_main: BOOLEAN

   staff: INTEGER

   triage, examination, treatment, transfers: AUX_AGENT_GC6

   make (staf, seed: INTEGER; main: BOOLEAN)
      do
         alea.set_seed(seed)
         staff := staf
         is_main := main
      end

   triage_examination
      do
         transfers.clear
         treatment.for_each(agent discharge_one_patient(?))
         examination.for_each(agent treat_or_transfert_one_patient(?))
         triage.for_each(agent triage_one_patient(?))
         if alea.test(0.7) then
            new_arrival(create {AUX_AGENT_GC3})
         end
      end

   new_arrival (p: AUX_AGENT_GC3)
      do
         p.enter_hospital
         if staff <= 0 then
            triage.add(p)
         else
            staff := staff - 1
            examination.add(p)
            p.wait(3)
         end
      end

   discharge_one_patient (p: AUX_AGENT_GC3)
      do
         p.next_time
         if p.finished then
            staff := staff + 1
            treatment.remove(p)
            discharged.add(p)
         end
      end

   treat_or_transfert_one_patient (p: AUX_AGENT_GC3)
      do
         p.next_time
         if p.finished then
            examination.remove(p)
            if alea.test(0.1) or else is_main then
               treatment.add(p)
               p.wait(10)
            else
               staff := staff + 1
               transfers.add(p)
            end
         end
      end

   triage_one_patient (p: AUX_AGENT_GC3)
      do
         if staff <= 0 then
            p.incr_hospital_time
         else
            staff := staff - 1
            triage.remove(p)
            examination.add(p)
            p.wait(3)
         end
      end

   accumulate_totals: AUX_AGENT_GC5
      do
         Result := discharged + triage.accumulate_totals + examination.accumulate_totals + treatment.accumulate_totals
      end

end -- class AUX_AGENT_GC2
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
