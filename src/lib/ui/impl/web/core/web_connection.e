-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_CONNECTION

inherit
   JOB

create {WEB_JOB}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         events.expect(stream.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := done or else events.event_occurred(stream.event_can_read)
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
   make (a_application: like application; a_conf: like conf; a_stream: like stream) is
      require
         a_application /= Void
         a_conf /= Void
         a_stream.is_connected
      do
         application := a_application
         conf := a_conf
         stream := a_stream
      end

   application: WEB_APPLICATION
   conf: WEB_CONFIGURATION
   stream: SOCKET_INPUT_OUTPUT_STREAM

invariant
   application /= Void
   conf /= Void
   stream /= Void

end -- class WEB_CONNECTION
--
-- Copyright (c) 2012 Cyril ADRIAN <cyril.adrian@gmail.com>.
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
