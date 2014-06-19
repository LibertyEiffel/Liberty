-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT_GC

insert
   ARGUMENTS
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         i, n: INTEGER; region: AUX_AGENT_GC1; t: AUX_AGENT_GC5
      do
         --if argument_count = 1 and then argument(1).is_integer then
         --   n := argument(1).to_integer
         --end
         --n := n.max(10)
         n := 1000
         create region.make_main
         from
         until
            i = n
         loop
            region.next_time
            i := i + 1
         end
         t := region.accumulate_totals
         --         print("Patients: " + t.patients.out + "%N")
         --         print("Time:     " + t.time.out + "%N")
         --         print("Visits:   " + t.visits.out + "%N")
         --         print("%NTreatment Queue - Remaining Treatment Time%N")
         region.hospital.treatment.for_each(agent end_print(?))
         assert(True)
      end

   end_print (p: AUX_AGENT_GC3)
      do
         --         print(p.remaining_time.out + "%Tanonymous patient%N")
      end

end -- class TEST_AGENT_GC
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
