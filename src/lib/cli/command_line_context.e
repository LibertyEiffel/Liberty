-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class COMMAND_LINE_CONTEXT
--
-- Internal command-line parsing context.
--

insert
   HASHABLE
   COMPARABLE

feature {ANY}
   hash_code: INTEGER
      do
         if is_short then
            Result := short_index #+ (short_option_index #* 4096)
            if Result < 0 then
               Result := ~Result
            end
         else
            Result := index
         end
      end

   infix "<" (other: like Current): BOOLEAN
      do
         if index = other.index then
            Result := short_option_index < other.short_option_index
         else
            Result := index < other.index
         end
      end

feature {ANY}
   index: INTEGER
         -- set to the next argument to read

   short_index: INTEGER
         -- set to the next option parameter position when parsing a short parameters sequence

   short_option_index: INTEGER
         -- position of the short option in the short option sequence

   is_parsed: BOOLEAN
         -- True if the parsing may continue. False if a grave parsing error occurs (such as an option present
         -- but with invalid data)
      do
         Result := index > 0
      end

   is_short: BOOLEAN
      do
         Result := short_option_index > 1
      end

feature {COMMAND_LINE_ARGUMENTS}
   init
      do
         index := 1
         short_index := 2
         short_option_index := 1
      ensure
         index = 1
         is_parsed
      end

feature {COMMAND_LINE_ARGUMENT, CLARG_PARSER}
   set_short (a_short_index: like short_index; a_short_option_index: like short_option_index)
      require
         a_short_index > index
      do
         short_index := a_short_index
         short_option_index := a_short_option_index
      ensure
         short_index = a_short_index
         short_option_index = a_short_option_index
         is_short
      end

   set_index (a_index: like index)
      require
         a_index > 0
      do
         index := a_index
         short_index := a_index + 1
         short_option_index := 1
      ensure
         index = a_index
         not is_short
      end

invariant
   index > 0 implies short_index > index
   index > 0 implies short_option_index >= 1

end -- class COMMAND_LINE_CONTEXT
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
