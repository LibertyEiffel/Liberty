-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ECURL_EASY_INPUT_STREAM

inherit
   ECURL_INPUT_STREAM
      redefine handle
      end

create {ECURL_EASY_HANDLE}
   connect_to

feature {ANY}
   can_perform: BOOLEAN
      do
         Result := state = State_init and then handle.can_perform
      end

   perform
      do
         state := State_performing
         ecurl_init_write_function(handle.handle, to_pointer)
         done(curl_easy_perform(handle.handle))
      end

   disconnect
      do
         handle.disconnect(Current)
         handle := Void
      end

feature {ECURL_EASY_HANDLE}
   multi_perform_done (error_code: INTEGER)
      do
         done(error_code)
      end

feature {}
   handle: ECURL_EASY_HANDLE

   done (err: INTEGER)
      do
         if err = Curle_ok then
            state := State_ready
            index := ecurl_buffer.lower
         else
            state := State_init
            if on_error /= Void then
               on_error.call([err, handle])
            end
         end
      end

end -- class ECURL_EASY_INPUT_STREAM
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
