-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_AGENT_GC1

create {ANY}
   make_region, make_main

feature {ANY}
   districts: FAST_ARRAY[AUX_AGENT_GC1]

   hospital: AUX_AGENT_GC2

   Levels: INTEGER 5

   Districts: INTEGER 4

   make_main
      do
         make_region(Levels, 0, 42)
      end

   make_region (level, seed1, seed2: INTEGER)
      local
         staff: INTEGER; hr: AUX_AGENT_GC1; i: INTEGER
      do
         staff := {INTEGER_32 1} |<< (level - 1).to_integer_8
         if level = 1 then
            make(staff, seed1 * seed2, False)
         else
            make(staff, seed1 * seed2, level = Levels)
            from
            until
               i = Districts
            loop
               create hr.make_region(level - 1, 4 * seed1 + i + 1, seed2)
               districts.add_last(hr)
               i := i + 1
            end
         end
      end

   make (staff, seed: INTEGER; is_main: BOOLEAN)
      do
         create hospital.make(staff, seed, is_main)
         create districts.with_capacity(Districts)
      end

   next_time
      do
         districts.for_each(agent {AUX_AGENT_GC1}.next_time_and_transfer_to(hospital))
         hospital.triage_examination
      end

   next_time_and_transfer_to (destination: AUX_AGENT_GC2)
      do
         next_time
         hospital.transfers.for_each(agent destination.new_arrival(?))
      end

   accumulate_totals: AUX_AGENT_GC5
      local
         i: INTEGER
      do
         from
            Result := hospital.accumulate_totals
         until
            i > districts.upper
         loop
            Result := Result + districts.item(i).accumulate_totals
            i := i + 1
         end
      end

end -- class AUX_AGENT_GC1
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
