-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_CONNECTION

inherit
   JOB

insert
   LOGGING

create {WEB_JOB}
   make

feature {LOOP_ITEM}
   prepare (events: EVENTS_SET) is
      do
         events.expect(stream.event_can_read)
      end

   is_ready (events: EVENTS_SET): BOOLEAN is
      do
         Result := abort or else events.event_occurred(stream.event_can_read)
      end

   continue is
      local
         context: WEB_CONTEXT
      do
         if not abort then
            create context.make(stream)
            if not context.should_disconnect then
               application.reply(context)
               context.flush
            end
         end
         if context.should_disconnect then
            abort := True
            context.disconnect
         end
         if abort then
            done := True
         end
      rescue
         context.set_status(500)
         abort := True
         retry
      end

   done: BOOLEAN

   restart is
      do
         check False end
      end

feature {}
   make (a_application: like application; a_stream: like stream) is
      require
         a_application /= Void
         a_stream.is_connected
      do
         application := a_application
         stream := a_stream
         a_stream.when_disconnect(agent on_disconnect)
      end

   application: WEB_APPLICATION
   stream: SOCKET_INPUT_OUTPUT_STREAM

   on_disconnect is
      do
         abort := True
      end

   abort: BOOLEAN

invariant
   application /= Void
   stream /= Void
   done implies abort

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
