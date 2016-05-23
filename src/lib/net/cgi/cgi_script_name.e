-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_SCRIPT_NAME
   --
   -- SCRIPT_NAME
   --

insert
   ANY
      redefine
         default_create
      end

feature {ANY}
   name: FIXED_STRING
   is_set: BOOLEAN

feature {CGI}
   error: STRING

   set (t: STRING)
      require
         not t.is_empty
      do
         if t.first = '/' then
            t.remove_first
            name := t.intern
            is_set := True
         else
            set_error(t)
         end
      ensure
         is_set
      end

feature {}
   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid SCRIPT_NAME: "
         error.append(t)
      end

   default_create
      do
         name := (once "").intern
      end

end -- class CGI_SCRIPT_NAME
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
