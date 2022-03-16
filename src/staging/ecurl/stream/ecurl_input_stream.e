-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ECURL_INPUT_STREAM

inherit
   ECURL_STREAM
   INPUT_STREAM

feature {ANY}
   can_read_character, can_read_line: BOOLEAN True

   can_unread_character: BOOLEAN
      do
         Result := is_ready and then ecurl_buffer.valid_index(index - 1)
      end

   valid_last_character: BOOLEAN
      do
         Result := is_ready and then ecurl_buffer.valid_index(index)
      end

   end_of_input: BOOLEAN
      do
         Result := not is_ready or else index > ecurl_buffer.upper
      end

feature {ANY} -- Options
   set_follow_location (enable: BOOLEAN)
      do
         curl_easy_setopt_boolean(handle.handle, Curlopt_followlocation, enable)
      end

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      do
         index := index + 1
      end

   filtered_unread_character
      do
         index := index - 1
      end

   filtered_last_character: CHARACTER
      do
         Result := ecurl_buffer.item(index)
      end

feature {}
   init_connect
      do
         if ecurl_buffer = Void then
            ecurl_buffer := ""
         end
         ecurl_buffer.clear_count
         state := State_init
      end

   ecurl_callback (buffer: POINTER; size: INTEGER)
      require
         is_performing
      local
         s: STRING
      do
         s := once ""
         s.from_external_sized(buffer, size)
         ecurl_buffer.append(s)
      end

   ecurl_buffer: STRING
   index: INTEGER

   state: INTEGER_8
   State_init: INTEGER_8 0
   State_performing: INTEGER_8 1
   State_ready: INTEGER_8 2

   is_performing: BOOLEAN
      do
         Result := state = State_performing
      end

   is_ready: BOOLEAN
      do
         Result := state = State_ready
      end

invariant
   ecurl_buffer /= Void

end -- class ECURL_INPUT_STREAM
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
