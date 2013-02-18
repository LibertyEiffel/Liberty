-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_CONNECTION

inherit
   JOB

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         if wait_command then
            events.expect(stream.can_read)
         else
            events.expect(stream.can_write)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         inspect
            state
         when state_wait_command then
            Result := events.event_occurred(stream.can_read)
         else
            Result := events.event_occurred(stream.can_write)
         end
      end

   continue is
      do
         inspect
            state
         when state_wait_command then
            stream.read_line
            inspect
               stream.last_string
            when "disconnect" then
               stream.disconnect
               server.disconnect
            else
               path := stream.last_string
            end
            wait_command := False
         when state_working then
            stream.put_line(once "ack #(1)" # path)
            test_status := test_files_in_directory(path) -- TODO: split that and continue the job for each unit test
         else
            stream.put_string(once "done #(1) #(2)" # test_status.out # path)
         end
      end

   done: BOOLEAN is
      do
         Result := not stream.is_connected
      end

   restart is
      do
         check False end
      end

feature {}
   make (a_stream: like stream; a_server: like server) is
      require
         a_stream.is_connected
         a_server /= Void
      do
         stream := a_stream
         server := a_server
         state := state_wait_command
      ensure
         stream = a_stream
         server = a_server
      end

   stream: SOCKET_INPUT_OUTPUT_STREAM
   server: EIFFELTEST_SERVER_SOCKET
   path: STRING

   state: INTEGER
   test_status: INTEGER

   state_wait_command: INTEGER is 1
   state_working: INTEGER is 2
   state_done: INTEGER is 3

invariant
   stream /= Void
   server /= Void

end -- class EIFFELTEST_SERVER_CONNECTION
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2013: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
