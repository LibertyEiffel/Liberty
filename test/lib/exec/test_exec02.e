-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXEC02

insert
   ARGUMENTS
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   command: STRING

   process: PROCESS

   make
      local
         pf: PROCESS_FACTORY
      do
         if argument_count = 1 then
            io.put_character('*')
         else
            command := argument(0).twin
            command.append(" arg")
            process := pf.create_process
            test_process
            test_process
            test_process
         end
      end

   test_process
      local
         stream: INPUT_STREAM; string: STRING
      do
         string := ""
         process.execute_command_line(command, True)
         assert(process.is_connected)
         stream := process.output
         from
            stream.read_character
         until
            stream.end_of_input
         loop
            string.extend(stream.last_character)
            stream.read_character
         end
         assert(string.is_equal(once "*"))
         process.wait
      end

end -- class TEST_EXEC02
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
