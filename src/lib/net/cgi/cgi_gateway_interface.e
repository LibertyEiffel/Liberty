-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
expanded class CGI_GATEWAY_INTERFACE
   --
   -- GATEWAY_INTERFACE
   --

feature {CGI_HANDLER}
   major, minor: INTEGER

feature {CGI}
   error: STRING

   set (t: STRING)
      require
         not t.is_empty
      local
         pos: INTEGER
      do
         if not t.has_prefix(once "CGI/") then
            set_error(t)
         else
            from
               pos := t.lower + 4
               if not t.valid_index(pos) or else t.item(pos) = '.' then
                  set_error(t)
               end
            until
               error /= Void or else not t.valid_index(pos) or else t.item(pos) = '.'
            loop
               if t.item(pos).is_digit then
                  major := major * 10 + t.item(pos).value
               else
                  set_error(t)
               end
               pos := pos + 1
            end
            if not t.valid_index(pos) then
               set_error(t)
            else
               from
                  pos := pos + 1
                  if not t.valid_index(pos) then
                     set_error(t)
                  end
               until
                  error /= Void or else not t.valid_index(pos)
               loop
                  if t.item(pos).is_digit then
                     minor := minor * 10 + t.item(pos).value
                  else
                     set_error(t)
                  end
                  pos := pos + 1
               end
            end
         end
      end

feature {}
   set_error (t: STRING)
      require
         t /= Void
      do
         error := "Invalid GATEWAY_INTERFACE: "
         error.append(t)
      end

end -- class CGI_GATEWAY_INTERFACE
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
