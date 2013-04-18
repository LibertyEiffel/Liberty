-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WAITPID_JOB

inherit
   JOB
      undefine
         is_equal
      end

insert
   SINGLETON
   LOGGING
      undefine
         is_equal
      end
   PROCESS_WAIT
      undefine
         is_equal
      end

create {PROCESS_WAIT}
   make

feature {ANY}
   stop is
      do
         done := True
      end

   trigger (a_timeout: like timeout) is
      require
         timeout >= -1 -- where -1 means no timeout
      do
         debug ("waitpid")
            log.trace.put_line(once "waitpid trigger: timeout=#(1)" # a_timeout.out)
         end
         timeout := a_timeout
         triggered := True
      ensure
         timeout = a_timeout
         triggered
      end

   timeout: INTEGER

   set_action (a_tag: ABSTRACT_STRING; a_on_waitpid: PROCEDURE[TUPLE[INTEGER, INTEGER]]; a_on_timeout: PROCEDURE[TUPLE]) is
      require
         a_tag /= Void
      local
         action: WAITPID_ACTION
      do
         debug ("waitpid")
            log.trace.put_line(once "waitpid set action #(1)" # a_tag)
         end
         action.set(a_on_waitpid, a_on_timeout)
         actions.fast_put(action, a_tag.intern)
      ensure
         has_action(a_tag)
      end

   unset_action (a_tag: ABSTRACT_STRING) is
      require
         a_tag /= Void
      do
         debug ("waitpid")
            log.trace.put_line(once "waitpid unset action #(1)" # a_tag)
         end
         actions.fast_remove(a_tag.intern)
      ensure
         not has_action(a_tag)
      end

   has_action (a_tag: ABSTRACT_STRING): BOOLEAN is
      do
         Result := actions.fast_has(a_tag.intern)
      end

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      local
         t: TIME_EVENTS
      do
         debug ("waitpid")
            log.trace.put_line(once "waitpid prepare: triggered=#(1) -- timeout=#(2)" # triggered.out # timeout.out)
         end
         if triggered or running then
            running := True
            triggered := False
            if timeout >= 0 then
               timeout_event := t.timeout(timeout)
               events.expect(timeout_event)
            end
            events.expect(in.event_can_read)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         if running then
            if timeout_event /= Void and then events.event_occurred(timeout_event) then
               Result := True
               debug ("waitpid")
                  log.trace.put_line(once "waitpid is_ready (timeout)")
               end
            else
               Result := events.event_occurred(in.event_can_read)
               timeout_event := Void
               debug ("waitpid")
                  if Result then
                     log.trace.put_line(once "waitpid is_ready (waitpid input)")
                  end
               end
            end
         end
      end

   continue is
      local
         i, pid, status: INTEGER
      do
         check
            running
         end
         if timeout_event /= Void then
            debug ("waitpid")
               log.trace.put_line(once "waitpid continue (timeout)")
            end
            from
               i := actions.lower
            until
               i > actions.upper
            loop
               actions.item(i).fire_timeout
               i := i + 1
            end
            running := False
            timeout_event := Void
         else
            from
               in.read_character
               debug ("waitpid")
                  log.trace.put_line(once "waitpid continue (waitpid input)")
               end
            until
               not in.has_oob_info
            loop
               running := False
               pid := in.pid
               status := in.status
               debug ("waitpid")
                  log.trace.put_line(once "waitpid continue (waitpid input: pid=#(1) status=#(2))" # pid.out # status.out)
               end
               in.drop_oop_info
               from
                  i := actions.lower
               until
                  i > actions.upper
               loop
                  actions.item(i).fire_waitpid(pid, status)
                  i := i + 1
               end
            end
         end
         debug ("waitpid")
            log.trace.put_line(once "waitpid continue (done)")
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
         create actions.make
      end

   timeout_event: EVENT_DESCRIPTOR
   actions: HASHED_DICTIONARY[WAITPID_ACTION, FIXED_STRING]
   triggered, running: BOOLEAN

end -- WAITPID_JOB
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
