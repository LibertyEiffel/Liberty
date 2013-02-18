-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER_RUN_TESTS

inherit
   JOB

create {ANY}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         events.expect(stream.event_can_write)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := events.event_occurred(stream.event_can_write)
      end

   continue is
      do
      end

   done: BOOLEAN

   restart is
      do
         check False end
      end

feature {}
   load_tests is
      do
      end

feature {}
   make (a_path: like path; a_stream: like stream; a_server: like server) is
      require
         a_path /= Void
         a_stream.is_connected
         a_server /= Void
      do
         path := a_path
         stream := a_stream
         server := a_server
         load_tests
      ensure
         path = a_path
         stream = a_stream
         server = a_server
      end

   stream: SOCKET_INPUT_OUTPUT_STREAM
   server: EIFFELTEST_SERVER_SOCKET
   path: STRING

invariant
   path /= Void
   stream /= Void
   server /= Void

end -- class EIFFELTEST_SERVER_RUN_TESTS
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
