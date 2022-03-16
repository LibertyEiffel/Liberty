-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class QUOTED_PRINTABLE_INPUT_STREAM
   --
   -- A quoted-printable decoder. Plug it onto a quoted-printable-encoded stream.
   --

inherit
   FILTER_INPUT_STREAM

create {ANY}
   connect_to

feature {ANY}
   last_character_flag: BOOLEAN

feature {}
   local_can_disconnect: BOOLEAN True

feature {FILTER_INPUT_STREAM}
   filtered_read_character
      local
         c: CHARACTER
      do
         if last_character_flag then
            swap_last_character
            last_character_flag := False
         else
            stream.filtered_read_character
            if stream.valid_last_character then
               c := stream.filtered_last_character
               if c /= '=' or else stream.end_of_input or else not read_quoted_character then
                  filtered_last_character := c
               end
            end
         end
      end

   filtered_unread_character
      do
         swap_last_character
         last_character_flag := True
      end

   filtered_last_character: CHARACTER

feature {}
   read_quoted_character: BOOLEAN
      local
         s: STRING; i: INTEGER
      do
         s := once ""
         s.clear_count
         stream.filtered_read_character
         s.extend(stream.filtered_last_character)
         if stream.end_of_input then
            stream.filtered_unread_character
         else
            stream.filtered_read_character
            s.extend(stream.filtered_last_character)
            i := from_hexadecimal(s)
            filtered_last_character := i.to_character
            Result := True
         end
      end

   last_character_swap: CHARACTER

   swap_last_character
      local
         c: CHARACTER
      do
         c := filtered_last_character
         filtered_last_character := last_character_swap
         last_character_swap := c
      end

   from_hexadecimal (s: STRING): INTEGER
      local
         i, n: INTEGER; c: CHARACTER
      do
         from
            i := s.lower
         until
            i > s.upper
         loop
            c := s.item(i)
            inspect
               c
            when '0' .. '9' then
               n := c.code - '0'.code
            when 'a' .. 'f' then
               n := c.code - 'a'.code + 10
            when 'A' .. 'F' then
               n := c.code - 'A'.code + 10
            else
               i := s.upper
            end
            Result := Result * 16 + n
            i := i + 1
         end
      end

end -- class QUOTED_PRINTABLE_INPUT_STREAM
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
