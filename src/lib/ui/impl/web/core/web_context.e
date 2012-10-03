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
   http_version: STRING
   head: BOOLEAN

   request_header (key: ABSTRACT_STRING): STRING is
      require
         key /= Void
      do
         Result := request_headers.fast_reference_at(key.intern)
      end

   set_head (a_head: like head) is
      do
         head := a_head
      ensure
         head = a_head
      end

feature {ANY} -- reply
   status: INTEGER

   status_reason: STRING is
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

   is_known_status (a_status: INTEGER): BOOLEAN is
      do
         inspect
            a_status
         when 100, 101, 200..206, 300..305, 307, 400..417, 500..505 then
            Result := True
         else
            check not Result end
         end
      end

   set_reply_header (key, value: ABSTRACT_STRING) is
      require
         key /= Void
         value /= Void
         not should_disconnect
      do
         reply_headers.fast_put(value.out, key.intern)
      end

   set_status (a_status: like status) is
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
   disconnect is
      require
         should_disconnect
      do
         stream.disconnect
         debug
            log.trace.put_line(once ">>>> disconnected.")
         end
      end

   flush is
      require
         not should_disconnect
      do
         if stream.is_connected then
            debug
               log.trace.put_line(once "--8<----------------------------------------------------------------")
               log.trace.put_string(once "#(1) #(2) #(3)%R%N" # http_version # status.out # status_reason)
            end
            stream.put_string(once "#(1) #(2) #(3)%R%N" # http_version # status.out # status_reason)

            should_disconnect := check_connection

            set_reply_header(once "Content-Length", reply_stream_.count.out)
            reply_headers.do_all(agent (v: STRING; k: FIXED_STRING) is
      do
         debug
         log.trace.put_string("#(1): #(2)%R%N" # k # v)
         end
         stream.put_string("#(1): #(2)%R%N" # k # v)
      end)

      debug
         log.trace.put_string(once "%R%N")
      end
   stream.put_string(once "%R%N")

      if head then
         debug
            log.trace.put_line(once ">>>> head only")
         end
      else
         reply_stream_.write_to(stream)
         debug
            reply_stream_.write_to(log.trace)
         end
      end

            stream.flush
            debug
               log.trace.put_line(once "---------------------------------------------------------------->8--")
            end
         end
      end

feature {}
   check_connection: BOOLEAN is
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
   decode_http_request: BOOLEAN is
      local
         request: FAST_ARRAY[STRING]
      do
         create request.with_capacity(3)
         stream.read_line
         debug
            log.trace.put_line(stream.last_string)
         end
         if not stream.last_string.is_empty then
            stream.last_string.split_in(request)
            http_method := request.item(0)
            http_path := request.item(1)
            http_version := request.item(2)
            Result := True
         end
      end

   decode_request_headers is
      local
         i: INTEGER; key: FIXED_STRING; value: STRING
      do
         from
            stream.read_line
         until
            stream.last_string.is_empty
         loop
            debug
               log.trace.put_line(stream.last_string)
            end

            i := stream.last_string.first_index_of(':')
            key := stream.last_string.substring(1, i - 1).intern
            value := stream.last_string.substring(i + 1, stream.last_string.upper)
            request_headers.add(value, key)

            stream.read_line
         end
      end

feature {}
   make (a_stream: like stream) is
      require
         a_stream.is_connected
      do
         stream := a_stream
         create request_headers.make
         debug
            log.trace.put_line(once "==8<================================================================")
         end
         if decode_http_request then
            decode_request_headers
            create reply_headers.make
            create reply_stream_.make
            create {WEB_OUTPUT_STREAM} reply_stream.connect_to(reply_stream_)
            status := 200
         else
            should_disconnect := True
         end
         debug
            log.trace.put_line(once "================================================================>8==")
         end
      end

   request_headers: HASHED_DICTIONARY[STRING, FIXED_STRING]

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
