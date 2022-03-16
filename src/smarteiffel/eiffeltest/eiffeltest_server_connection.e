-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_CONNECTION

inherit
   JOB

insert
   LOGGING

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      do
         log.trace.put_line(once "Server #(1): prepare connection" # port.out)
         events.expect(stream.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         Result := events.event_occurred(stream.event_can_read)
         log.trace.put_line(once "Server #(1): is_ready connection: #(2)" # port.out # Result.out)
      end

   continue
      do
         log.trace.put_line(once "Server #(1): reading new command" # port.out)
         stream.read_line
         log.info.put_line(once "Server #(1): received command: #(2)" # port.out # stream.last_string)
         inspect
            stream.last_string
         when "disconnect" then
            stream.disconnect
            server.disconnect
         else
            path := stream.last_string.twin
            on_connect.call([create {EIFFELTEST_SERVER_RUN_TESTS}.make(port, path, stream, server)])
         end
      end

   done: BOOLEAN
      do
         Result := path /= Void
         log.trace.put_line(once "Server #(1): connection done: #(2)" # port.out # Result.out)
      end

   restart
      do
         check False end
      end

feature {}
   make (a_port: like port; a_stream: like stream; a_server: like server; a_on_connect: like on_connect)
      require
         a_stream.is_connected
         a_server /= Void
      do
         port := a_port
         stream := a_stream
         server := a_server
         on_connect := a_on_connect
      ensure
         port = a_port
         stream = a_stream
         server = a_server
         on_connect = a_on_connect
      end

   port: INTEGER
   stream: SOCKET_INPUT_OUTPUT_STREAM
   server: EIFFELTEST_SERVER_SOCKET
   path: STRING

   on_connect: PROCEDURE[TUPLE[JOB]]

invariant
   stream /= Void
   server /= Void
   on_connect /= Void

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
-- Copyright (C) 2013-2022: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://www.gnu.org/software/liberty-eiffel/
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
