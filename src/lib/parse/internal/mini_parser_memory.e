-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class MINI_PARSER_MEMORY
   --
   -- Stores MINI_PARSER_BUFFER positions, but may be useful to
   -- associate extra data (such as line, column)
   --

feature {ANY}
   memo (buffer: MINI_PARSER_BUFFER): INTEGER
         -- returns an identifier that uniquely identifies a buffer index.
      require
         buffer /= Void
      deferred
      ensure
         valid_memo(Result, buffer)
      end

   restore (a_memo: like memo; buffer: MINI_PARSER_BUFFER)
         -- restores the buffer index using the given memo
      require
         valid_memo(a_memo, buffer)
         buffer /= Void
      deferred
      end

   valid_memo (a_memo: like memo; buffer: MINI_PARSER_BUFFER): BOOLEAN
         -- True if the memo represents a valid index in the buffer
      deferred
      end

end -- class MINI_PARSER_MEMORY
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
