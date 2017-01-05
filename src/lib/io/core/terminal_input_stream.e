-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class TERMINAL_INPUT_STREAM
   --
   -- A "terminal" input stream is an input stream connected to a "real" character flow. There are many kinds of
   -- "real" data flows:
   --  + a file
   --  + a string
   --  + a virtual flow, such as a null-provider
   --  + . . .
   --

inherit
   INPUT_STREAM

feature {ANY}
   can_read_character, can_read_line, can_disconnect: BOOLEAN True

   valid_last_character: BOOLEAN
      do
         Result := can_unread_character
      end

end -- class TERMINAL_INPUT_STREAM
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
