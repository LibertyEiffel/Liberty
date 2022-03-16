-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class SPLIT_OUTPUT_STREAM
   --
   -- A stream split into lines. The default line length is 76
   --

inherit
   FILTER_OUTPUT_STREAM
      redefine
         connect_to
      end

create {ANY}
    connect_to

feature {ANY} -- creation
   Default_line_length: INTEGER 76
         -- This length is the default for Base64 (see http://www.faqs.org/rfcs/rfc2045)

   Default_line_separator: STRING "%R%N"

   line_length: INTEGER
         -- Length of a line

   line_separator: STRING
         -- What to put at the end of a line (e.g. Quoted-Printable would set "=%R%N" here)

   connect_to (a_stream: like stream)
      do
         Precursor(a_stream)
         set_line_length(Default_line_length)
         set_line_separator(Default_line_separator)
      end

   set_line_length (a_length: like line_length)
      require
         a_length > 0
      do
         line_length := a_length
      ensure
         line_length = a_length
      end

   set_line_separator (a_separator: like line_separator)
      require
         a_separator.count > 0
      do
         line_separator := a_separator
      ensure
         line_separator = a_separator
      end

feature {FILTER_OUTPUT_STREAM}
   filtered_put_character (c: CHARACTER)
      local
         i: INTEGER
      do
         stream.filtered_put_character(c)
         inspect
            c
         when '%R', '%N' then
            current_line_length := 0
         else
            current_line_length := current_line_length + 1
            if current_line_length >= line_length then
               from
                  i := line_separator.lower
               until
                  i > line_separator.upper
               loop
                  stream.filtered_put_character(line_separator.item(i))
                  i := i + 1
               end
               current_line_length := 0
            end
         end
      end

   filtered_flush
      do
         stream.filtered_flush
      end

feature {}
   current_line_length: INTEGER
         -- The length of the current line

   local_can_disconnect: BOOLEAN True

invariant
   line_length > 0

end -- SPLIT_OUTPUT_STREAM
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
