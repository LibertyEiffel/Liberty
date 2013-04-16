-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_WAITPID

inherit
   JOB

insert
   SINGLETON

create {EIFFELTEST_SERVER}
   make

feature {ANY}
   stop is
      do
         done := True
      end

   set_timeout (a_timeout: like timeout) is
         -- Set a timeout if >= 0, unset otherwise
      do
         timeout := a_timeout
      ensure
         timeout = a_timeout
      end

   timeout: INTEGER

   set_action (a_on_waitpid: like on_waitpid; a_on_timeout: like on_timeout) is
      do
         on_waitpid := a_on_waitpid
         on_timeout := a_on_timeout
      ensure
         on_waitpid = a_on_waitpid
         on_timeout = a_on_timeout
      end

feature {LOOP_ITEM}
   timeout_event: EVENT_DESCRIPTOR

   prepare (events: EVENTS_SET) is
      local
         t: TIME_EVENTS
      do
         if timeout >= 0 then
            timeout_event := t.timeout(timeout)
            events.expect(timeout_event)
         end
         events.expect(in.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         if events.event_occurred(timeout_event) then
            Result := True
         else
            Result := events.event_occurred(in.event_can_read)
            timeout_event := Void
         end
      end

   continue is
      local
         s: STRING
         i, pid, status: INTEGER
      do
         if timeout_event = Void then
            -- no timeout, hence a child died
            in.read_line
            if on_waitpid /= Void then
               s := in.last_string
               i := s.index_of(' ')
               pid := s.substring(s.lower, i - 1).to_integer
               status := s.substring(i + 1, s.upper).to_integer
               on_waitpid.call([pid, status])
            end
         else
            -- timeout
            if on_timeout /= Void then
               on_timeout.call([])
            end
         end
      end

   done: BOOLEAN

   restart is
      do
         done := False
      end

feature {}
   make is
      do
         create in.make
      end

   in: WAITPID_INPUT

   on_waitpid: PROCEDURE[TUPLE[INTEGER, INTEGER]]
   on_timeout: PROCEDURE[TUPLE]

end -- class EIFFELTEST_WAITPID
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
