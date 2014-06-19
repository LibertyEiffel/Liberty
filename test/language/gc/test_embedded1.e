-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EMBEDDED1
   --
   -- Extra stuff for embedded system programming.
   --

insert
   MEMORY

create {}
   make

feature {ANY}
   make
      local
         ab, iloop: INTEGER; small_string: STRING
      do
         -- To run with the minimal amount of memory:
         set_low_memory_strategy
         --***     allocated_mem_display;
         assert(collector_counter = 0)
         collection_off
         full_collect
         assert(collector_counter = 0)
         collection_on
         full_collect
         assert(collector_counter = 1)
         ab := allocated_bytes
         from
            iloop := 50000
         until
            iloop <= 0
         loop
            small_string := "foo"
            small_string := small_string.twin
            iloop := iloop - 1
            --***       allocated_mem_display;
         end
         assert(ab <= allocated_bytes)
      end

feature {}
   allocated_bytes_memory: INTEGER

   allocated_mem_display
      do
         if allocated_bytes_memory /= allocated_bytes then
            allocated_bytes_memory := allocated_bytes
            io.put_string("allocated_bytes = ")
            io.put_integer(allocated_bytes_memory)
            io.put_string("%N")
         else
            io.put_string(" --- %N")
         end
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_EMBEDDED1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_EMBEDDED1
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
