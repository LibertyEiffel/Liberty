-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class HTTP_CONNECTION
   --
   -- Handle one connection to the HTTP_SERVER. The real HTTP protocol is defined here.
   --

inherit
   CONNECTION
      redefine
         set_io, prepare, is_ready, done
      end

insert
   RECYCLABLE
   DISPOSABLE

feature {LOOP_ITEM} -- Loop Implementation

   prepare (a_events: EVENTS_SET)
         -- Premare the request to be processed by `a_events' and `method_handler'.
      local
         l_time_events: TIME_EVENTS
      do
         inspect
            answer_state
         when answer_state_read then
            a_events.expect(ios.event_can_read)
         when answer_state_prepare, answer_state_write then
            if method_handler = Void then
               a_events.expect(l_time_events.timeout(0))
            else
               method_handler.expect(a_events)
            end
         end
      end

   is_ready (a_events: EVENTS_SET): BOOLEAN
         -- `True' when the management of the request in `a_events' can be use
      do
         inspect
            answer_state
         when answer_state_read then
            Result := a_events.event_occurred(ios.event_can_read)
         when answer_state_prepare, answer_state_write then
            Result := method_handler = Void or else method_handler.is_ready(a_events)
         end
      end

   done: BOOLEAN
         -- `True' when the request management has been completed.
      do
         if ios.is_connected then
            inspect
               answer_state
            when answer_state_read then
               check not Result end
            when answer_state_prepare, answer_state_write then
               Result := method_handler = Void or else method_handler.done
            end
         else
            Result := True
         end
      end

   continue
         -- Manage the next step of the request.
      do
         inspect
            answer_state
         when answer_state_read then
            continue_read
         when answer_state_prepare then
            continue_prepare
         when answer_state_write then
            continue_write
         end
      end

   continue_read
         -- Read and manage the last character of the request
      local
         l_character: CHARACTER
         l_read: BOOLEAN
      do
         if read_buffer = Void then
            create read_buffer.make_empty
         end
         if ios.can_read_character then
            ios.read_character
            l_read := True
         end
         if not l_read or else ios.end_of_input or else (content_length > 0 and then content_count >= content_length) then
            if not read_buffer.is_empty then
               call_state
            end
            --| server.log(" -> answer_state_prepare")
            answer_state := answer_state_prepare
         else
            l_character := ios.last_character
            if state = state_body then
               content_count := content_count + 1
            end
            inspect
               l_character
            when '%R' then
               -- ignore
            when '%N' then
               call_state
            else
               read_buffer.extend(l_character)
            end
         end
      end

   continue_prepare
         -- Manage the answer preparation
      do
         if method_handler = Void then
            --| server.log(" -> answer_state_write")
            answer_state := answer_state_write
         else
            method_handler.prepare_answer
            if method_handler.prepare_ok then
               --| server.log(" -> answer_state_write")
               answer_state := answer_state_write
            end
         end
      end

   continue_write
         -- Manage writing the answer
      local
         l_log: STRING
      do
         if method_handler = Void then
            --| server.log(" -> answer_state_read")
            answer_state := answer_state_read
         else
            method_handler.answer(ios)
            if method_handler.done then
               l_log := once ""
               l_log.copy(request_line)
               l_log.extend(' ')
               method_handler.code.append_in(l_log)
               server.log(l_log)
               ios.disconnect
               --| server.log(" -> answer_state_read")
               answer_state := answer_state_read
            end
         end
      end

feature {} -- Implementation

   answer_state: INTEGER
         -- The state of a single answer

   answer_state_read: INTEGER 0
         -- The state of the answer is in the `read' state

   answer_state_prepare: INTEGER 1
         -- The state of the answer is in the `read' state

   answer_state_write: INTEGER 2
         -- The state of the answer is in the `write' state


   read_buffer: STRING
         -- The buffer that has been read

   content_length: INTEGER
         -- The length of the body content of the request

   content_count: INTEGER
         -- The number of bytes that has already been read.

feature {HTTP_SERVER} -- HTTP Server implementation

   set_server (a_server: like server)
         -- Assing `server' with the value of `a_server'
      do
         server := a_server
         --| server.log(" -> state_request_line")
         state := state_request_line
         --| server.log(" -> answer_state_read")
         answer_state := answer_state_read
         if method_handler /= Void then
            method_handler.begin_answer
         end
         content_length := 0
      end

feature {SERVER} -- Server implementation

   set_io (a_io: like ios)
         -- Assing `ios' with the value of `a_io'
      do
         Precursor(a_io)
         a_io.when_disconnect(agent handle_disconnect(?))
      end

feature {} -- Implementation

   server: HTTP_SERVER
         -- The server used to manage http connections

   handle_disconnect (a_io: like ios)
         -- Disconnect `a_io'
      require
         a_io = ios
         done
      do
         disconnected := True
         server.connection_done(Current)
      end

   get_method_handler (a_method, a_uri, a_version: STRING): HTTP_METHOD_HANDLER
         -- Retreive the method handeler of used to manage a request of type `a_method'
         -- addressed with `a_uri' using http `a_version'
      require
         a_method.as_upper.is_equal(a_method)
      deferred
      ensure
         Result.method.is_equal(a_method) or else ({HTTP_NO_METHOD_HANDLER} ?:= Result)
      end

   disconnected: BOOLEAN
         -- `Current' is disconnected.

feature {} -- The HTTP protocol (see RFC 2616)

   state: INTEGER
         -- The present connection state.

   state_request_line: INTEGER 0
         -- The present `state' is in the manage request line connection state.

   state_header: INTEGER 1
         -- The present `state' is in the manage header connection state.

   state_body: INTEGER 2
         -- The present `state' is in the manage body connection state.

   method_handler: HTTP_METHOD_HANDLER
         -- The handler used to manage the requests.

   request_line: STRING
         -- A single line of the request.

   call_state
         -- Manage `read_buffer' depending the present `state'
      require
         answer_state = answer_state_read
      do
         inspect
            state
         when state_request_line then
            a_request_line(read_buffer)
         when state_header then
            a_header(read_buffer)
         when state_body then
            a_body(read_buffer)
         end
         read_buffer.clear_count
      end

   a_request_line (a_line: STRING)
         -- Manage the resquest `a_line'
      require
         answer_state = answer_state_read
      local
         i, j: INTEGER
         l_method, l_uri, l_version: STRING
      do
         i := a_line.first_index_of(' ')
         j := a_line.index_of(' ', i + 1)
         l_method := once ""
         l_method.copy_substring(a_line, 1, i - 1)
         l_method.to_upper
         l_uri := once ""
         if j = 0 then
            l_uri.copy_substring(a_line, i + 1, a_line.count)
            l_version := once "HTTP/1.0"
         else
            l_uri.copy_substring(a_line, i + 1, j - 1)
            l_version := once ""
            l_version.copy_substring(a_line, j + 1, a_line.count)
         end
         request_line.copy(l_method)
         request_line.extend(' ')
         request_line.append(l_uri)
         --| server.log(" -> state_header")
         state := state_header
         method_handler := get_method_handler(l_method, l_uri, l_version)
         if method_handler /= Void then
            method_handler.begin_answer
         end
      end

   a_header (a_line: STRING)
         -- Manage the header `a_line' and add it to the `method_handler' headers.
      do
         if a_line.is_empty then
            if method_handler /= Void and then method_handler.expect_body then
               --| server.log(" -> state_body")
               state := state_body
            else
               --| server.log(" -> answer_state_prepare")
               answer_state := answer_state_prepare
            end
         else
            parse_header(a_line)
            inspect
               header_key.as_lower
            when "content-length" then
               if header_value.is_integer then
                  content_length := header_value.to_integer
               end
            else
               -- ignored
            end
            if method_handler /= Void then
               method_handler.add_header(a_line.twin)
            else
               -- ignored
            end
         end
      end

   header_key: STRING
         -- An header key generated by `parse_value'

   header_value: STRING
         -- An header value generated by `parse_value'

   parse_header (a_line: STRING)
         -- Split the header `a_line' as key/value.
         -- Assing `header_key' and `header_value'
      local
         i: INTEGER
      do
         if header_key = Void then
            check
               header_value = Void
            end
            create header_key.make_empty
            create header_value.make_empty
         else
            header_key.clear_count
            header_value.clear_count
         end
         i := a_line.first_index_of(':')
         if a_line.valid_index(i) then
            header_key.copy_substring(a_line, 1, i - 1)
            from
               i := i + 1
            until
               i > a_line.upper or else not a_line.item(i).is_separator
            loop
               i := i + 1
            end
            header_value.copy_substring(a_line, i, a_line.upper)
         end
      end

   a_body (a_line: STRING)
         -- Add the `a_line' in the `method_handler'
      do
         if a_line.is_empty and then content_length = 0 then
            --| server.log(" -> answer_state_prepare")
            answer_state := answer_state_prepare
         else
            method_handler.add_body(a_line.twin)
         end
      end

feature {RECYCLING_POOL} -- Recycler Implementation
   recycle
         -- At collection, recycle `ios'
      do
         if not disconnected then
            handle_disconnect(ios)
         end
      end

feature {} -- Collection Implementation
   dispose
         -- At collection, disconnect `ios'
      do
         if not disconnected then
            handle_disconnect(ios)
         end
      end

invariant
   request_line /= Void

end -- class HTTP_CONNECTION
--
-- Copyright (C) 2009-2021: by all the people cited in the AUTHORS file.
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
