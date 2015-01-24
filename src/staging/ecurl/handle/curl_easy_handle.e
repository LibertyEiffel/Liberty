-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class CURL_EASY_HANDLE

inherit
   CURL_HANDLE

insert
   CURL_PLUGIN
   DISPOSABLE
   RECYCLABLE

create {CURL_HANDLER}
   make

feature {ANY}
   in_use: BOOLEAN
      do
         Result := input_stream /= Void or else output_stream /= Void
      end

   input: CURL_INPUT_STREAM
      require
         is_useable
         not in_use
      do
         Result := input_stream
         if Result = Void then
            if input_memory = Void then
               create input_memory.connect_to(Current)
            else
               input_memory.connect_to(Current)
            end
            Result := input_memory
         else
            check
               Result.is_connected_to(Current)
            end
         end
      ensure
         Result /= Void
         in_use
      end

   output: CURL_OUTPUT_STREAM
      require
         is_useable
         not in_use
      do
         Result := output_stream
         if Result = Void then
            if output_memory = Void then
               create output_memory.connect_to(Current)
            else
               output_memory.connect_to(Current)
            end
            Result := output_memory
         else
            check
               Result.is_connected_to(Current)
            end
         end
      ensure
         Result /= Void
         in_use
      end

feature {CURL_HANDLER}
   is_useable: BOOLEAN
      do
         Result := handle.is_not_null
      end

   make
         -- Initialize the cUrl handle.
      require
         not is_useable
      do
         handle := curl_easy_init
      end

   cleanup
         -- Destroys the cUrl handle
      require
         is_useable
      do
         curl_easy_cleanup(handle)
      end

   handle: POINTER

feature {RECYCLING_POOL}
   recycle
      do
         if is_useable then
            check
               please_cleanup: False
            end
            cleanup
         end
      end

feature {}
   dispose
      do
         recycle
      end

   input_stream, input_memory: CURL_EASY_INPUT_STREAM
   output_stream, output_memory: CURL_EASY_OUTPUT_STREAM

end -- class CURL_EASY_HANDLE
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
