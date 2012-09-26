-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class WEB_CONTEXT

create {WEB_CONNECTION}
   make

feature {ANY}
   http_verb: STRING
   http_path: STRING
   http_version: STRING

   header (key: ABSTRACT_STRING): STRING is
      do
         Result := headers.fast_reference_at(key.intern)
      end

   stream: SOCKET_INPUT_OUTPUT_STREAM

feature {}
   decode_http_request is
      local
         request: FAST_ARRAY[STRING]
      do
         create request.with_capacity(3)
         stream.read_line
         stream.last_string.split_in(request)
         http_verb := request.item(0)
         http_path := request.item(1)
         http_version := request.item(2)
      end

   decode_headers is
      local
         i: INTEGER; key: FIXED_STRING; value: STRING
      do
         from
            stream.read_line
         until
            stream.last_string.is_empty
         loop
            i := stream.last_string.first_index_of(':')
            key := stream.last_string.substring(1, i - 1).intern
            value := stream.last_string.substring(i + 1, stream.last_string.upper)
            headers.add(value, key)

            stream.read_line
         end
      end

feature {}
   make (a_stream: like stream) is
      require
         a_stream.is_connected
      do
         stream := a_stream
         create headers.make
         decode_http_request
         decode_headers
      end

   headers: HASHED_DICTIONARY[STRING, FIXED_STRING]

invariant
   stream /= Void
   headers /= Void
   http_verb /= Void
   http_path /= Void
   http_version /= Void

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
