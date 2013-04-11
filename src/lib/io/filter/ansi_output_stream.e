-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ANSI_OUTPUT_STREAM
   --
   -- An ANSI-aware encoder.
   --

inherit
   FILTER_OUTPUT_STREAM

create {ANY}
   connect_to

feature{ANY}
   set_foreground (color: INTEGER) is
      require
         color.in_range(0, 7) or else color = 9
      do
         put_color_sequence(30 + color)
      end

   set_background (color: INTEGER) is
      require
         color.in_range(0, 7) or else color = 9
      do
         put_color_sequence(40 + color)
      end

   reset is
      do
         put_sequence(0)
         is_bold := False
         is_italic := False
         is_underline := False
         is_inverse := False
         is_strikethrough := False
      ensure
         not is_bold
         not is_italic
         not is_underline
         not is_inverse
         not is_strikethrough
      end

   set_bold (bold: BOOLEAN) is
      require
         bold = not is_bold
      do
         is_bold := bold
      ensure
         is_bold = old bold
      end

   is_bold: BOOLEAN

   set_italic (italic: BOOLEAN) is
      require
         italic = not is_italic
      do
         is_italic := italic
      ensure
         is_italic = old italic
      end

   is_italic: BOOLEAN

   set_underline (underline: BOOLEAN) is
      require
         underline = not is_underline
      do
         is_underline := underline
      ensure
         is_underline = old underline
      end

   is_underline: BOOLEAN

   set_inverse (inverse: BOOLEAN) is
      require
         inverse = not is_inverse
      do
         is_inverse := inverse
      ensure
         is_inverse = inverse
      end

   is_inverse: BOOLEAN

   set_strikethrough (strike: BOOLEAN) is
      require
         strike = not is_strikethrough
      do
         is_strikethrough := strike
      ensure
         is_strikethrough = old strike
      end

   is_strikethrough: BOOLEAN

   black: INTEGER is 0
   red: INTEGER is 1
   green: INTEGER is 2
   yellow: INTEGER is 3
   blue: INTEGER is 4
   magenta: INTEGER is 5
   cyan: INTEGER is 6
   white: INTEGER is 7
   default_color: INTEGER is 9

feature {}
   local_can_disconnect: BOOLEAN is True

   put_color_sequence (seq: INTEGER) is
      do
         put_string("%/27/[0;")
         put_integer(seq)
         put_character('m')
         if is_bold then
            put_sequence(1)
         else
            put_sequence(22)
         end
         if is_italic then
            put_sequence(3)
         else
            put_sequence(23)
         end
         if is_underline then
            put_sequence(4)
         else
            put_sequence(24)
         end
         if is_inverse then
            put_sequence(7)
         else
            put_sequence(27)
         end
         if is_strikethrough then
            put_sequence(9)
         else
            put_sequence(29)
         end
      end

   put_sequence (seq: INTEGER) is
      do
         put_string("%/27/[")
         put_integer(seq)
         put_character('m')
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER) is
      do
         stream.filtered_put_character(c)
      end

   filtered_flush is
      do
         stream.filtered_flush
      end

end -- class ANSI_OUTPUT_STREAM
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
