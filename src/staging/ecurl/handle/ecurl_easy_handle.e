-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ECURL_EASY_HANDLE

inherit
   ECURL_HANDLE

insert
   ECURL_PLUGIN
   DISPOSABLE
   RECYCLABLE

create {ANY}
   make

feature {ANY}
   in_use: BOOLEAN
      do
         Result := in_input_use or else in_output_use
      end

   in_input_use: BOOLEAN
      do
         Result := input_stream /= Void
      end

   in_output_use: BOOLEAN
      do
         Result := output_stream /= Void
      end

   input: ECURL_INPUT_STREAM
      require
         is_useable
         not in_output_use
      do
         Result := input_stream
         if Result = Void then
            if input_memory = Void then
               create input_memory.connect_to(Current)
            else
               input_memory.connect_to(Current)
            end
            Result := input_memory
            input_stream := Result
         else
            check
               Result.is_connected_to(Current)
            end
         end
      ensure
         Result /= Void
         in_input_use
      end

   output: ECURL_OUTPUT_STREAM
      require
         is_useable
         not in_input_use
      do
         Result := output_stream
         if Result = Void then
            if output_memory = Void then
               create output_memory.connect_to(Current)
            else
               output_memory.connect_to(Current)
            end
            Result := output_memory
            output_stream := Result
         else
            check
               Result.is_connected_to(Current)
            end
         end
      ensure
         Result /= Void
         in_output_use
      end

   is_useable: BOOLEAN
      do
         Result := handle.is_not_null
      end

feature {ECURL_STREAM}
   disconnect (a_stream: ECURL_STREAM)
      do
         if a_stream = input_stream then
            input_stream := Void
         elseif a_stream = output_stream then
            output_stream := Void
         else
            check False end
         end
      end

   can_perform: BOOLEAN
      do
         Result := not multi_attached
      end

feature {ECURL_HANDLER}
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
         if input_memory /= Void and then input_memory.is_connected then
            check input_memory.is_connected_to(Current) end
            input_memory.disconnect
         end
         if output_memory /= Void and then output_memory.is_connected then
            check output_memory.is_connected_to(Current) end
            output_memory.disconnect
         end
         curl_easy_cleanup(handle)
         handle := handle.default
         input_stream := Void
         output_stream := Void
      end

   handle: POINTER

feature {ECURL_MULTI_HANDLE}
   multi_attached: BOOLEAN
      do
         Result := multi_handle /= Void
      end

   multi_attach (a_handle: like multi_handle)
      require
         a_handle /= Void
         not multi_attached
      do
         multi_handle := a_handle
      ensure
         multi_attached
      end

   multi_detach
      require
         multi_attached
      do
         multi_handle := Void
      ensure
         not multi_attached
      end

   multi_perform_done (error_code: INTEGER)
      require
         multi_attached
      do
         if input_stream /= Void then
            input_memory.multi_perform_done(error_code)
         elseif output_stream /= Void then
            output_memory.multi_perform_done(error_code)
         end
      end

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

   input_stream: ECURL_INPUT_STREAM
   output_stream: ECURL_OUTPUT_STREAM

   input_memory: ECURL_EASY_INPUT_STREAM
   output_memory: ECURL_EASY_OUTPUT_STREAM

   multi_handle: ECURL_MULTI_HANDLE

end -- class ECURL_EASY_HANDLE
--
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
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
