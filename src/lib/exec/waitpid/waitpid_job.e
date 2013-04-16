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

   set_action (a_tag: ABSTRACT_STRING; a_on_waitpid: PROCEDURE[TUPLE[INTEGER, INTEGER]]; a_on_timeout: PROCEDURE[TUPLE]) is
      require
         a_tag /= Void
      local
         action: WAITPID_ACTION
      do
         action.set(a_on_waitpid, a_on_timeout)
         actions.fast_put(action, a_tag.intern)
      ensure
         has_action(a_tag)
      end

   unset_action (a_tag: ABSTRACT_STRING) is
      require
         a_tag /= Void
      do
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
         if timeout >= 0 then
            timeout_event := t.timeout(timeout)
            events.expect(timeout_event)
         end
         events.expect(in.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         if timeout_event /= Void and then events.event_occurred(timeout_event) then
            Result := True
         else
            Result := events.event_occurred(in.event_can_read)
            timeout_event := Void
         end
      end

   continue is
      local
         i, pid, status: INTEGER
         s, buffer: STRING
      do
         if timeout_event /= Void then
            from
               i := actions.lower
            until
               i > actions.upper
            loop
               actions.item(i).fire_timeout
               i := i + 1
            end
         else
            in.read_line
            s := in.last_string
            buffer := once ""
            i := s.first_index_of(' ')
            buffer.copy_substring(s, s.lower, i - 1)
            pid := buffer.to_integer
            buffer.copy_substring(s, i + 1, s.upper)
            status := buffer.to_integer
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
