-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
deferred class HTTP_METHOD_HANDLER

feature {HTTP_CONNECTION}
   code: INTEGER
         -- the HTTP answer code

   method: STRING
         -- the method
      deferred
      end

   begin_answer
      do
         response_header.clear_count
         response_body.clear_count
         done := False
      end

   prepare_answer
      require
         not done
      deferred
      end

   answer (out_stream: OUTPUT_STREAM)
      require
         not done
         prepare_ok
      local
         i, n: INTEGER
      do
         default_body
         out_stream.put_string(once "HTTP/1.1 ")
         out_stream.put_integer(code)
         out_stream.put_character(' ')
         out_stream.put_string(reason)
         newline(out_stream)
         from
            i := response_header.lower
            n := response_header.upper
         until
            i > n
         loop
            out_stream.put_string(response_header.item(i))
            newline(out_stream)
            i := i + 1
         end
         newline(out_stream)
         out_stream.put_string(response_body)
         done := True
      end

   add_header (header: STRING)
      deferred
      end

   expect_body: BOOLEAN
      deferred
      end

   add_body (body: STRING)
      require
         expect_body
      deferred
      end

   prepare_ok: BOOLEAN
      deferred
      end

   done: BOOLEAN

   expect (events: EVENTS_SET)
      deferred
      end

   is_ready (events: EVENTS_SET): BOOLEAN
      deferred
      end

feature {}
   uri: STRING
         -- the source URI

   version: STRING
         -- the version

   response_header: FAST_ARRAY[STRING]
   response_body: STRING

   default_body
      local
         r: STRING
      do
         if code = 200 and then response_body = Void then
            r := reason
            response_body.append(once "<!DOCTYPE HTML PUBLIC %"-//IETF//DTD HTML 2.0//EN%">%R%N<html><head>%R%N<title>")
            code.append_in(response_body)
            response_body.extend(' ')
            response_body.append(r)
            response_body.append(once "</title>%R%N</head><body>%R%N<h1>")
            response_body.append(r)
            response_body.append(once "</h1>%R%N<p>")
            response_body.append(method)
            response_body.append(once " to ")
            response_body.append(uri)
            response_body.append(once ": ")
            response_body.append(r)
            response_body.append(once "</p>%R%N</body></html>%R%N")
         end
         set_content_length
      end

   set_content_length
      local
         l: STRING
      do
         l := once ""
         l.clear_count
         l.append(once "Content-Length: ")
         response_body.count.append_in(l)
         response_header.add_last(l)
      end

   reason: STRING
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

   newline (out_stream: OUTPUT_STREAM)
         -- output CRLF
      do
         out_stream.put_string(once "%R%N")
      end

invariant
   response_header /= Void
   response_body /= Void

end -- class HTTP_METHOD_HANDLER
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
