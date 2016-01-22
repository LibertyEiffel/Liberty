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
   PROCESS_WAIT
      undefine
         is_equal
      end

create {PROCESS_WAIT}
   make

feature {ANY}
   stop
      do
         done := True
      end

   arm (a_timeout: like timeout)
      require
         timeout >= -1
      do
         debug ("waitpid")
            std_error.put_line(once "waitpid arm: timeout=#(1)" # a_timeout.out)
         end
         timeout := a_timeout
         armed := True
         triggered := False
      ensure
         timeout = a_timeout
         armed
         not triggered
      end

   disarm
      require
         armed
      do
         armed := False
      ensure
         not armed
      end

   trigger (a_timeout: like timeout)
      require
         timeout >= -1
      do
         debug ("waitpid")
            std_error.put_line(once "waitpid trigger: timeout=#(1)" # a_timeout.out)
         end
         timeout := a_timeout
         triggered := True
         armed := False
      ensure
         timeout = a_timeout
         triggered
         not armed
      end

   timeout: INTEGER

   set_action (a_tag: ABSTRACT_STRING; a_on_waitpid: PROCEDURE[TUPLE[INTEGER, INTEGER]]; a_on_timeout: PROCEDURE[TUPLE])
      require
         a_tag /= Void
      local
         action: WAITPID_ACTION
      do
         debug ("waitpid")
            std_error.put_line(once "waitpid set action #(1)" # a_tag)
         end
         action.set(a_on_waitpid, a_on_timeout)
         actions.fast_put(action, a_tag.intern)
      ensure
         has_action(a_tag)
      end

   unset_action (a_tag: ABSTRACT_STRING)
      require
         a_tag /= Void
      do
         debug ("waitpid")
            std_error.put_line(once "waitpid unset action #(1)" # a_tag)
         end
         actions.fast_remove(a_tag.intern)
      ensure
         not has_action(a_tag)
      end

   has_action (a_tag: ABSTRACT_STRING): BOOLEAN
      do
         Result := actions.fast_has(a_tag.intern)
      end

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET)
      local
         t: TIME_EVENTS
      do
         debug ("waitpid")
            std_error.put_line(once "waitpid prepare: triggered=#(1) armed=#(2) running=#(3) -- timeout=#(4)" # triggered.out # armed.out # running.out # timeout.out)
         end
         if triggered or else armed or else running then
            running := True
            triggered := False
            if timeout >= 0 then
               timeout_event := t.timeout(timeout)
               events.expect(timeout_event)
            end
            events.expect(in.event_can_read)
         end
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      do
         if running then
            if timeout_event /= Void and then events.event_occurred(timeout_event) then
               Result := True
               debug ("waitpid")
                  std_error.put_line(once "waitpid is_ready (timeout)")
               end
            else
               Result := events.event_occurred(in.event_can_read)
               timeout_event := Void
               debug ("waitpid")
                  if Result then
                     std_error.put_line(once "waitpid is_ready (waitpid input)")
                  end
               end
            end
         end
      end

   continue
      local
         i, pid, status: INTEGER
      do
         check
            running
         end
         if timeout_event /= Void then
            debug ("waitpid")
               std_error.put_line(once "waitpid continue (timeout)")
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
                  std_error.put_line(once "waitpid continue (waitpid input)")
               end
            until
               not in.has_oob_info
            loop
               running := False
               pid := in.pid
               status := in.status
               debug ("waitpid")
                  std_error.put_line(once "waitpid continue (waitpid input: pid=#(1) status=#(2))" # pid.out # status.out)
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
            std_error.put_line(once "waitpid continue (done)")
         end
      end

   done: BOOLEAN

   restart
      do
         done := False
      end

feature {}
   make
      do
         create actions.make
      end

   timeout_event: EVENT_DESCRIPTOR
   actions: HASHED_DICTIONARY[WAITPID_ACTION, FIXED_STRING]
   triggered, armed, running: BOOLEAN

end -- WAITPID_JOB
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
