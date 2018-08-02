-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_CONTEXT

insert
   LOGGING

create {WEB_CONNECTION}
   make

feature {ANY}
   should_disconnect: BOOLEAN

feature {ANY} -- request
   http_method: STRING
   http_path: STRING
   http_path_arguments: STRING
   http_version: STRING
   head: BOOLEAN
   body: STRING

   request_header (key: ABSTRACT_STRING): STRING
      require
         key /= Void
      do
         Result := request_headers.fast_reference_at(key.intern)
      end

   set_head (a_head: like head)
      do
         head := a_head
      ensure
         head = a_head
      end

   argument (key: ABSTRACT_STRING): STRING
      require
         key /= Void
      do
         if arguments = Void then
            decode_arguments
         end
         Result := arguments.fast_reference_at(key.intern)
      end

feature {ANY} -- reply
   status: INTEGER

   status_reason: STRING
      do
         inspect
            status
         when 100 then
            Result := once "Continue"
         when 101 then
            Result := once "Switching Protocols"
         when 200 then
            Result := once "OK"
         when 201 then
            Result := once "Created"
         when 202 then
            Result := once "Accepted"
         when 203 then
            Result := once "Non-Authoritative Information"
         when 204 then
            Result := once "No Content"
         when 205 then
            Result := once "Reset Content"
         when 206 then
            Result := once "Partial Content"
         when 300 then
            Result := once "Multiple Choices"
         when 301 then
            Result := once "Moved Permanently"
         when 302 then
            Result := once "Found"
         when 303 then
            Result := once "See Other"
         when 304 then
            Result := once "Not Modified"
         when 305 then
            Result := once "Use Proxy"
         when 307 then
            Result := once "Temporary Redirect"
         when 400 then
            Result := once "Bad Request"
         when 401 then
            Result := once "Unauthorized"
         when 402 then
            Result := once "Payment Required"
         when 403 then
            Result := once "Forbidden"
         when 404 then
            Result := once "Not Found"
         when 405 then
            Result := once "Method Not Allowed"
         when 406 then
            Result := once "Not Acceptable"
         when 407 then
            Result := once "Proxy Authentication Required"
         when 408 then
            Result := once "Request Time-out"
         when 409 then
            Result := once "Conflict"
         when 410 then
            Result := once "Gone"
         when 411 then
            Result := once "Length Required"
         when 412 then
            Result := once "Precondition Failed"
         when 413 then
            Result := once "Request Entity Too Large"
         when 414 then
            Result := once "Request-URI Too Large"
         when 415 then
            Result := once "Unsupported Media Type"
         when 416 then
            Result := once "Requested range not satisfiable"
         when 417 then
            Result := once "Expectation Failed"
         when 500 then
            Result := once "Internal Server Error"
         when 501 then
            Result := once "Not Implemented"
         when 502 then
            Result := once "Bad Gateway"
         when 503 then
            Result := once "Service Unavailable"
         when 504 then
            Result := once "Gateway Time-out"
         when 505 then
            Result := once "HTTP Version not supported"
         end
      end

   is_known_status (a_status: INTEGER): BOOLEAN
      do
         inspect
            a_status
         when 100, 101, 200..206, 300..305, 307, 400..417, 500..505 then
            Result := True
         else
            check not Result end
         end
      end

   set_reply_header (key, value: ABSTRACT_STRING)
      require
         key /= Void
         value /= Void
         not should_disconnect
      do
         reply_headers.fast_put(value.out, key.intern)
      end

   set_status (a_status: like status)
      require
         is_known_status(a_status)
         not should_disconnect
      do
         status := a_status
      ensure
         status = a_status
      end

   reply_stream: OUTPUT_STREAM

feature {WEB_CONNECTION}
   disconnect
      require
         should_disconnect
      do
         stream.disconnect
         debug
            log.trace.put_line(once ">>>> disconnected.")
         end
      end

   flush
      require
         not should_disconnect
      do
         if stream.is_connected then
            debug
               log.info.put_line(once "--8<----------------------------------------------------------------")
               log.info.put_string(once "#(1) #(2) #(3)%R%N" # http_version # status.out # status_reason)
            end
            stream.put_string(once "#(1) #(2) #(3)%R%N" # http_version # status.out # status_reason)

            should_disconnect := check_connection

            set_reply_header(once "Content-Length", reply_stream_.count.out)
            reply_headers.for_each(agent (v: STRING; k: FIXED_STRING)
                                   do
                                      debug
                                         log.info.put_string("#(1): #(2)%R%N" # k # v)
                                      end
                                      stream.put_string("#(1): #(2)%R%N" # k # v)
                                   end)

            debug
               log.info.put_string(once "%R%N")
            end
            stream.put_string(once "%R%N")

            if head then
               debug
                  log.trace.put_line(once ">>>> head only")
               end
            else
               reply_stream_.write_to(stream)
               debug
                  reply_stream_.write_to(log.info)
               end
            end

            stream.flush
            debug
               log.info.put_line(once "---------------------------------------------------------------->8--")
            end
         end
      end

feature {}
   check_connection: BOOLEAN
      local
         connection: STRING
      do
         if http_version.is_equal(once "HTTP/1.1") then
            if head then
               Result := True -- because of the Content-Length
            elseif status >= 400 then
               Result := True -- is it pertinent?
            else
               connection := request_header(once "Connection")
               if connection /= Void and then connection.is_equal(once "close") then
                  Result := True -- asked by the client
               end
            end
            if Result then
               set_reply_header(once "Connection", once "close")
            end
         else
            Result := True -- HTTP/1.0 does not keep connections alive
         end
      end

feature {}
   decode_http_request: BOOLEAN
      local
         request: FAST_ARRAY[STRING]
         i: INTEGER; url: STRING
      do
         create request.with_capacity(3)
         stream.read_line
         debug
            log.info.put_line(stream.last_string)
         end
         if not stream.last_string.is_empty then
            stream.last_string.split_in(request)
            if not request.is_empty then
               http_method := request.item(0)
               debug
                  log.trace.put_line(once ">>>> method: #(1)" # http_method)
               end

               url := request.item(1)
               i := url.first_index_of('?')
               if url.valid_index(i) then
                  http_path := url.substring(url.lower, i - 1)
                  http_path_arguments := url.substring(i + 1, url.upper)
                  debug
                     log.trace.put_line(once ">>>> path: #(1)" # http_path)
                     log.trace.put_line(once ">>>> args: #(1)" # http_path_arguments)
                  end
               else
                  http_path := url
                  debug
                     log.trace.put_line(once ">>>> path: #(1)" # http_path)
                  end
               end

               http_version := request.item(2)
               debug
                  log.trace.put_line(once ">>>> version: #(1)" # http_version)
               end
               Result := True
            end
         end
      end

   decode_request_headers
      local
         i: INTEGER; key: FIXED_STRING; value: STRING
      do
         from
            stream.read_line
         until
            stream.last_string.is_empty
         loop
            debug
               log.info.put_line(stream.last_string)
            end

            i := stream.last_string.first_index_of(':')
            key := stream.last_string.substring(1, i - 1).intern
            value := stream.last_string.substring(i + 2, stream.last_string.upper) -- skip ':' and ' '
            request_headers.add(value, key)

            stream.read_line
         end
      end

   decode_body
      local
         content_length: STRING; length: INTEGER
      do
         content_length := request_header(once "Content-Length")
         if content_length /= Void then
            from
               length := content_length.to_integer
               body := ""
            until
               length = 0
            loop
               stream.read_character
               body.extend(stream.last_character)
               length := length - 1
            end
            debug
               log.info.put_new_line
               log.info.put_line(body)
            end
         end
      end

   decode_arguments
      require
         arguments = Void
      local
         content_type: STRING
      do
         create arguments.make
         if http_path_arguments /= Void then
            decode_arguments_for(http_path_arguments)
         end
         if body /= Void then
            content_type := request_header(once "Content-Type")
            log.trace.put_line(once ">>>> Content-Type: #(1)" # content_type)
            if content_type = Void then
               decode_arguments_for(body)
            else
               inspect
                  content_type
               when "application/x-www-form-urlencoded", "application/x-url-encoded" then
                  decode_arguments_for(body)
               when "multipart/form-data" then
                  -- RFC 2388
                  not_yet_implemented
               else
                  log.warning.put_line(once "Unknown Content-Type: #(1), ignoring body content" # content_type)
               end
            end
         end
      ensure
         arguments /= Void
      end

   decode_arguments_for (a_string: STRING)
      require
         a_string /= Void
         arguments /= Void
      local
         start_index, ampersand_index, equal_index: INTEGER
         key, value: STRING
      do
         from
            start_index := a_string.lower
            equal_index := a_string.first_index_of('=')
         until
            not a_string.valid_index(equal_index)
         loop
            ampersand_index := a_string.index_of('&', equal_index)
            if not a_string.valid_index(ampersand_index) then
               ampersand_index := a_string.upper + 1
            end

            key := decode_url_argument(a_string, start_index, equal_index - 1)
            value := decode_url_argument(a_string, equal_index + 1, ampersand_index - 1)
            debug
               log.trace.put_line(once ">>>> #(1): #(2)" # key # value)
            end
            arguments.add(value, key.intern)

            start_index := ampersand_index + 1
            equal_index := a_string.index_of('=', start_index)
         end
      end

   decode_url_argument (a_string: STRING; a_start_index, a_end_index: INTEGER): STRING
      require
         a_string.valid_index(a_start_index)
         a_string.valid_index(a_end_index)
         a_start_index < a_end_index
      local
         i, byte: INTEGER
      do
         Result := ""
         from
            i := a_start_index
         until
            i > a_end_index
         loop
            inspect
               a_string.item(i)
            when '+' then
               Result.extend(' ')
            when '%%' then
               byte := url_encoded_character(a_string.item(i + 1)) * 16
                  + url_encoded_character(a_string.item(i + 2))
               Result.extend(byte.to_character)
               i := i + 2
            else
               Result.extend(a_string.item(i))
            end
            i := i + 1
         end
      end

   url_encoded_character (a_character: CHARACTER): INTEGER
      do
         inspect
            a_character
         when '0'..'9' then
            Result := a_character.code - 48
         when 'A'..'F' then
            Result := a_character.code + 9 - 64
         when 'a'..'f' then
            Result := a_character.code + 9 - 96
         end
      end

feature {}
   make (a_stream: like stream)
      require
         a_stream.is_connected
      do
         stream := a_stream
         create request_headers.make
         debug
            log.info.put_line(once "==8<================================================================")
         end
         if decode_http_request then
            decode_request_headers
            decode_body
            create reply_headers.make
            create reply_stream_.make
            create {WEB_OUTPUT_STREAM} reply_stream.connect_to(reply_stream_)
            status := 200
         else
            should_disconnect := True
         end
         debug
            log.info.put_line(once "================================================================>8==")
         end
      end

   request_headers: HASHED_DICTIONARY[STRING, FIXED_STRING]
   arguments: HASHED_DICTIONARY[STRING, FIXED_STRING]

   reply_headers: HASHED_DICTIONARY[STRING, FIXED_STRING]
   reply_stream_: STRING_OUTPUT_STREAM

   stream: SOCKET_INPUT_OUTPUT_STREAM

invariant
   stream /= Void
   request_headers /= Void
   http_method /= Void
   http_path /= Void
   http_version /= Void

   reply_headers /= Void
   reply_stream_.is_connected

   is_known_status(status)

end -- class WEB_CONTEXT
--
-- Copyright (C) 2012-2018: Cyril ADRIAN <cyril.adrian@gmail.com>.
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
