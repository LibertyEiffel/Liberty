-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_SOCKET

inherit
   JOB

insert
   EIFFELTEST_NETWORK
   LOGGING

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      do
         log.trace.put_line(once "Server #(1): prepare server socket" # port.out)
         events.expect(server.event_connection)
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         Result := events.event_occurred(server.event_connection)
         log.trace.put_line(once "Server #(1): is_ready server socket: #(2)" # port.out # Result.out)
      end

   continue
      local
         stream: SOCKET_INPUT_OUTPUT_STREAM
      do
         log.info.put_line(once "Server #(1): new connection" # port.out)
         stream := server.new_stream(True)
         on_connect.call([create {EIFFELTEST_SERVER_CONNECTION}.make(port, stream, Current, on_connect)])
      end

   done: BOOLEAN
      do
         Result := server = Void or else not server.can_connect
         log.trace.put_line(once "Server #(1): server socket done: #(2)" # port.out # Result.out)
      end

   restart
      do
         server := access.server
         if server = Void then
            log.error.put_line(once "Server *not* started on port #(1) (could not create server socket)" # port.out)
            die_with_code(exit_failure_code)
         end
      end

feature {ANY}
   disconnect
      do
         log.info.put_line(once "Server #(1): disconnected, shutting down" # port.out)
         server.shutdown
         on_disconnect.call([])
      end

feature {}
   make (a_port: INTEGER; a_on_connect: like on_connect; a_on_disconnect: like on_disconnect)
      require
         a_on_disconnect /= Void
      do
         port := a_port
         on_connect := a_on_connect
         on_disconnect := a_on_disconnect
         restart
      ensure
         port = a_port
         on_connect = a_on_connect
         on_disconnect = a_on_disconnect
      end

   server: SOCKET_SERVER

   on_connect: PROCEDURE[TUPLE[JOB]]
   on_disconnect: PROCEDURE[TUPLE]

invariant
   done or else server /= Void
   on_connect /= Void
   on_disconnect /= Void

end -- class EIFFELTEST_SERVER_SOCKET
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
-- Copyright (C) 2013-2017: Cyril ADRIAN <cyril.adrian@gmail.com>
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
