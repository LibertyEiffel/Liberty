-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class HTTP_CLIENT_OUTPUT_STREAM
   --
   -- Some ideas and first draft of this class kindly provided by Serge Romanchenko [mailto:se@sir.nensi.net]
   --

inherit
   FILTER_OUTPUT_STREAM

create {HTTP_PROTOCOL}
   connect_to

feature {HTTP_PROTOCOL}
   put_request (nrl: NETWORK_RESOURCE_LOCATOR)
      do
         if request_headers = Void then
            create request_headers.make
         else
            request_headers.clear_count
         end
         set_method_get
         set_http_verion_1_1
         set_header(once "Host", nrl.host)
         set_header(once "User-Agent", once "HTTP_CLIENT_OUTPUT_STREAM")
         set_header(once "Connection", once "close")
         set_header(once "Accept", once "text/*")
         filtered_put_string(method)
         filtered_put_character(' ')
         filtered_put_string(nrl.path)
         if nrl.arguments /= Void then
            filtered_put_character('?')
            filtered_put_string(nrl.arguments)
         end
         filtered_put_character(' ')
         filtered_put_string(http_version)
         filtered_put_string(new_line)
         request_headers.for_each(agent add_header(?, ?))
         filtered_put_string(new_line)
         flush
      end

feature {}
   set_header (name, value: STRING)
      do
         request_headers.add(value, name)
      end

   set_method_get
      do
         method := once "GET"
      end

   set_method_post
      do
         method := once "POST"
      end

   set_http_verion_1_1
      do
         http_version := once "HTTP/1.1"
      end

   set_http_verion_1_0
      do
         http_version := once "HTTP/1.0"
      end

   add_header (value, key: STRING)
      do
         filtered_put_string(key)
         filtered_put_string(once ": ")
         filtered_put_string(value)
         filtered_put_string(new_line)
      end

   filtered_put_string (s: STRING)
      local
         i: INTEGER
      do
         from
            i := s.lower
         until
            i > s.upper
         loop
            stream.filtered_put_character(s.item(i))
            i := i + 1
         end
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         stream.filtered_put_character(c)
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {}
   local_can_disconnect: BOOLEAN True

   request_headers: HASHED_DICTIONARY[STRING, STRING]

   new_line: STRING "%R%N"

   method: STRING

   http_version: STRING

end -- class HTTP_CLIENT_OUTPUT_STREAM
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
