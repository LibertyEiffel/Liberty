-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class HTTP_METHOD_HANDLER
   --
   -- Used ton handle an HTTP request.
   --

feature {HTTP_CONNECTION} -- Implementation

   code: INTEGER
         -- the HTTP answer code

   method: STRING
         -- the request method (GET, POST, etc.)
      deferred
      end

   begin_answer
         -- Launched before the answer preparation
      do
         response_header.clear_count
         response_body.clear_count
         done := False
      end

   prepare_answer
         -- Prepare the answer of the request
      require
         not done
      deferred
      end

   answer (a_out_stream: OUTPUT_STREAM)
         -- Send the request answer to the `a_out_stream'
      require
         not done
         prepare_ok
      local
         l_index, l_count: INTEGER
      do
         default_body
         a_out_stream.put_string(once "HTTP/1.1 ")
         a_out_stream.put_integer(code)
         a_out_stream.put_character(' ')
         a_out_stream.put_string(reason)
         newline(a_out_stream)
         from
            l_index := response_header.lower
            l_count := response_header.upper
         until
            l_index > l_count
         loop
            a_out_stream.put_string(response_header.item(l_index))
            newline(a_out_stream)
            l_index := l_index + 1
         end
         newline(a_out_stream)
         a_out_stream.put_string(response_body)
         done := True
      end

   add_header (a_header: STRING)
         -- A request `a_header' is added
      deferred
      end

   expect_body: BOOLEAN
         -- True if the request must have a body.
      deferred
      end

   add_body (a_body: STRING)
         -- A request `a_body' is added.
      require
         expect_body
      deferred
      end

   prepare_ok: BOOLEAN
         -- True if `prepare_answer' has been completed correctly
      deferred
      end

   done: BOOLEAN
         -- True when the answer has been send

   expect (a_events: EVENTS_SET)
      deferred
      end

   is_ready (a_events: EVENTS_SET): BOOLEAN
         -- `Current' ca be used to manage a request.
      deferred
      end

feature {}
   uri: STRING
         -- the source URI

   version: STRING
         -- the http version (1.0, 1.1, etc.)

   response_header: FAST_ARRAY[STRING]
         -- Every headers of the request

   response_body: STRING
         -- The complete body of the request

   default_body
         -- A defaut answer's body
      local
         l_reason: STRING
      do
         if code = 200 and then response_body = Void then
            l_reason := reason
            response_body.append(once "<!DOCTYPE HTML PUBLIC %"-//IETF//DTD HTML 2.0//EN%">%R%N<html><head>%R%N<title>")
            code.append_in(response_body)
            response_body.extend(' ')
            response_body.append(l_reason)
            response_body.append(once "</title>%R%N</head><body>%R%N<h1>")
            response_body.append(l_reason)
            response_body.append(once "</h1>%R%N<p>")
            response_body.append(method)
            response_body.append(once " to ")
            response_body.append(uri)
            response_body.append(once ": ")
            response_body.append(l_reason)
            response_body.append(once "</p>%R%N</body></html>%R%N")
         end
         set_content_length
      end

   set_content_length
         -- Set the lenght of the answer's body
      local
         l_lenght: STRING
      do
         l_lenght := once ""
         l_lenght.clear_count
         l_lenght.append(once "Content-Length: ")
         response_body.count.append_in(l_lenght)
         response_header.add_last(l_lenght)
      end

   reason: STRING
         -- A text representation of the answer `code'
      do
         inspect
            code
         when 100 then
            Result := "Continue"
         when 101 then
            Result := "Switching Protocols"
         when 200 then
            Result := "OK"
         when 201 then
            Result := "Created"
         when 202 then
            Result := "Accepted"
         when 203 then
            Result := "Non-Authoritative Information"
         when 204 then
            Result := "No Content"
         when 205 then
            Result := "Reset Content"
         when 206 then
            Result := "Partial Content"
         when 300 then
            Result := "Multiple Choices"
         when 301 then
            Result := "Moved Permanently"
         when 302 then
            Result := "Found"
         when 303 then
            Result := "See Other"
         when 304 then
            Result := "Not Modified"
         when 305 then
            Result := "Use Proxy"
         when 307 then
            Result := "Temporary Redirect"
         when 400 then
            Result := "Bad Request"
         when 401 then
            Result := "Unauthorized"
         when 402 then
            Result := "Payment Required"
         when 403 then
            Result := "Forbidden"
         when 404 then
            Result := "Not Found"
         when 405 then
            Result := "Method Not Allowed"
         when 406 then
            Result := "Not Acceptable"
         when 407 then
            Result := "Proxy Authentication Required"
         when 408 then
            Result := "Request Time-out"
         when 409 then
            Result := "Conflict"
         when 410 then
            Result := "Gone"
         when 411 then
            Result := "Length Required"
         when 412 then
            Result := "Precondition Failed"
         when 413 then
            Result := "Request Entity Too Large"
         when 414 then
            Result := "Request-URI Too Large"
         when 415 then
            Result := "Unsupported Media Type"
         when 416 then
            Result := "Requested range not satisfiable"
         when 417 then
            Result := "Expectation Failed"
         when 500 then
            Result := "Internal Server Error"
         when 501 then
            Result := "Not Implemented"
         when 502 then
            Result := "Bad Gateway"
         when 503 then
            Result := "Service Unavailable"
         when 504 then
            Result := "Gateway Time-out"
         when 505 then
            Result := "HTTP Version not supported"
         else
            Result := "<unknown code>"
         end
      end

   newline (a_out_stream: OUTPUT_STREAM)
         -- output CRLF
      do
         a_out_stream.put_string(once "%R%N")
      end

invariant
   response_header /= Void
   response_body /= Void

end -- class HTTP_METHOD_HANDLER
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
