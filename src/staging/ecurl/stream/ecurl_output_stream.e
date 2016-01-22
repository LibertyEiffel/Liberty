-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ECURL_OUTPUT_STREAM

inherit
   ECURL_STREAM
   OUTPUT_STREAM
      redefine
         put_abstract_string
      end

insert
   STRING_HANDLER

feature {ANY}
   can_put_character (c: CHARACTER): BOOLEAN
      do
         Result := True
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      do
         ecurl_buffer.extend(c)
      end

   filtered_flush
      do
         -- nothing
      end

feature {ABSTRACT_STRING}
   put_abstract_string (s: ABSTRACT_STRING)
      do
         ecurl_buffer.append(s)
      end

feature {}
   init_connect
      do
         if ecurl_buffer = Void then
            ecurl_buffer := ""
         end
         ecurl_buffer.clear_count
         state := State_init
         index := ecurl_buffer.lower
      end

   ecurl_callback (buffer: POINTER; size: INTEGER): INTEGER
      require
         is_performing
      local
         chars: NATIVE_ARRAY[CHARACTER]
      do
         Result := ecurl_buffer.count - index
         if Result > 0 then
            if Result > size then
               Result := size
            end
            chars := chars.from_pointer(buffer)
            ecurl_buffer.copy_slice_to_native(index, index + Result - 1, chars, 0)
            index := index + Result
         end
      end

   ecurl_buffer: STRING
   index: INTEGER

   state: INTEGER_8
   State_init: INTEGER_8 0
   State_performing: INTEGER_8 1

   is_performing: BOOLEAN
      do
         Result := state = State_performing
      end

end -- class ECURL_INPUT_STREAM
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
