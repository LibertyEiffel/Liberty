-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class CONNECTION
   --
   -- Handle one connection to the {SERVER}.
   --

inherit
   JOB

feature {SERVER} -- Server implementation

   set_io (a_io: SOCKET_INPUT_OUTPUT_STREAM)
         -- Assign `ios' witht the value of `a_io'
      require
         a_io.is_connected
      do
         ios := a_io
      ensure
         ios = a_io
      end

feature {LOOP_ITEM} -- Loop implementation

   prepare (a_events: EVENTS_SET)
         -- Launched before starting the to manage requests.
         -- Indicate in `a_events' the kind of request to manage.
      do
         a_events.expect(ios.event_can_read)
      end

   is_ready (a_events: EVENTS_SET): BOOLEAN
         -- True if `Current' is ready to manage requests using
         -- `a_events' to detect it.
      do
         Result := a_events.event_occurred(ios.event_can_read)
      end

   done: BOOLEAN
         -- `Current' has finished managing requests and answers.
      do
         Result := not ios.is_connected
      end

   restart
         -- Restart the connection.
         -- Require by Job. Should not be used.
      do
         -- cannot restart a connection
         --|*** (the postcondition will not be respected, how can I do otherwise? Philippe?)
      end

feature {} -- Implementation

   ios: SOCKET_INPUT_OUTPUT_STREAM
         -- Used to read (request) and write (answer)

end -- class CONNECTION
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
