-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BASE64_INPUT_STREAM
   --
   -- A Base64 decoder. Plug it onto a Base64-encoded stream.
   --

inherit
   FILTER_INPUT_STREAM
      redefine can_unread_character, end_of_input
      end

create {ANY}
   connect_to

feature {ANY}
   can_unread_character: BOOLEAN
      do
         Result := flags.bit_test(can_unread_character_flag)
      end

   end_of_input: BOOLEAN
      do
         Result := end_of_base64 or else Precursor
      end

feature {}
   local_can_disconnect: BOOLEAN True

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      local
         c: INTEGER
      do
         if has_unread_character then
            set_has_unread_character(False)
            swap_unread_buffer
         else
            unread_buffer := filtered_last_character
            from
               stream.filtered_read_character
            until
               stream.end_of_input or else stream.filtered_last_character /= '%N'
            loop
               stream.filtered_read_character
            end
            if not stream.end_of_input then
               c := b2t(stream.filtered_last_character)
               inspect
                  state
               when 0 then
                  accu := c |<< 2
                  stream.filtered_read_character
                  if not stream.end_of_input then
                     c := b2t(stream.filtered_last_character)
                     accu := accu | (c |>> 4)
                     filtered_last_character := accu.to_character
                     accu := c & 15 |<< 4
                     state := 1
                  end
               when 1 then
                  accu := accu | (c |>> 2)
                  filtered_last_character := accu.to_character
                  accu := c & 3 |<< 6
                  state := 2
               when 2 then
                  accu := accu | c
                  filtered_last_character := accu.to_character
                  state := 0
               end
            end
         end
         set_can_unread_character(not end_of_input)
      end

   filtered_unread_character
      do
         set_has_unread_character(True)
         set_can_unread_character(False)
         swap_unread_buffer
      end

   filtered_last_character: CHARACTER

feature {}
   state: INTEGER

   accu: INTEGER

   unread_buffer: CHARACTER

   swap_unread_buffer
      local
         tmp_buffer: CHARACTER
      do
         tmp_buffer := unread_buffer
         unread_buffer := filtered_last_character
         filtered_last_character := tmp_buffer
      ensure
         unread_buffer = old filtered_last_character
         filtered_last_character = old unread_buffer
      end

   set_can_unread_character (value: BOOLEAN)
      do
         if value then
            flags := flags.bit_set(can_unread_character_flag)
         else
            flags := flags.bit_reset(can_unread_character_flag)
         end
      ensure
         can_unread_character = value
      end

   has_unread_character: BOOLEAN
      do
         Result := flags.bit_test(has_unread_character_flag)
      end

   set_has_unread_character (value: BOOLEAN)
      do
         if value then
            flags := flags.bit_set(has_unread_character_flag)
         else
            flags := flags.bit_reset(has_unread_character_flag)
         end
      ensure
         has_unread_character = value
      end

   end_of_base64: BOOLEAN
      do
         Result := flags.bit_test(end_of_base64_flag)
      end

   set_end_of_base64 (value: BOOLEAN)
      do
         if value then
            flags := flags.bit_set(end_of_base64_flag)
         else
            flags := flags.bit_reset(end_of_base64_flag)
         end
      ensure
         end_of_base64 = value
      end

   flags: INTEGER
   can_unread_character_flag: INTEGER_8 0
   has_unread_character_flag: INTEGER_8 1
   end_of_base64_flag:        INTEGER_8 2

feature {}
   alphabet: STRING "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

   b2t (c: CHARACTER): INTEGER
      require
         c = '=' or else alphabet.has(c)
      do
         inspect
            c
         when '=' then
            set_end_of_base64(True)
         when 'A' .. 'Z' then
            Result := c.code - 'A'.code
         when 'a' .. 'z' then
            Result := c.code - ('a'.code - 26)
         when '0' .. '9' then
            Result := c.code - ('0'.code - 52)
         when '+' then
            Result := 62
         when '/' then
            Result := 63
         end
      ensure
         Result >= 0 and then Result < 64
         c /= '=' implies alphabet.item(Result + 1) = c
         c = '=' implies Result = 0
      end

end -- class BASE64_INPUT_STREAM
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
