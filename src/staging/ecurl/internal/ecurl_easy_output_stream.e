-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ECURL_EASY_OUTPUT_STREAM

inherit
   ECURL_OUTPUT_STREAM
      redefine handle
      end

create {ECURL_EASY_HANDLE}
   connect_to

feature{ANY}
   can_perform: BOOLEAN
      do
      end

   perform (on_error: PROCEDURE[TUPLE[INTEGER]])
      local
         err: INTEGER
      do
         ecurl_init_read_function(handle.handle, to_pointer)
         curl_easy_setopt_integer(handle.handle, Curlopt_infilesize_large, ecurl_buffer.count.to_integer_64)
         err := curl_easy_perform(handle.handle)
      end

feature {}
   handle: ECURL_EASY_HANDLE

end -- class ECURL_EASY_OUTPUT_STREAM
--
-- Copyright (c) 2009-2015 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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
