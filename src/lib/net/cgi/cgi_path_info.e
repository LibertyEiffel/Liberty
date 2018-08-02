-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
-- See the Copyright notice at the end of this file.
--
class CGI_PATH_INFO
   --
   -- PATH_INFO
   --

insert
   ANY
      redefine
         out_in_tagged_out_memory
      end

create {CGI}
   make

feature {ANY}
   out_in_tagged_out_memory
      local
         i: INTEGER
      do
         from
            i := segments_memory.lower
         until
            i > segments_memory.upper
         loop
            if i > segments_memory.lower then
               tagged_out_memory.extend('/')
            end
            tagged_out_memory.append(segments_memory.item(i))
            i := i + 1
         end
      end

feature {ANY}
   segments: TRAVERSABLE[FIXED_STRING]
      require
         error = Void
      do
         Result := segments_memory
      end

   error: STRING

feature {}
   make (t: STRING)
      require
         t.first = '/'
      local
         pos: INTEGER; p: STRING
      do
         create segments_memory.with_capacity(t.occurrences('/') - 1)
         from
            p := once ""
            p.clear_count
            pos := t.lower + 1
         until
            error /= Void or else not t.valid_index(pos)
         loop
            if t.item(pos) = '/' then
               segments_memory.add_last(p.intern)
               p.clear_count
            else
               p.extend(t.item(pos))
            end
            pos := pos + 1
         end
         segments_memory.add_last(p.intern)
      end

   segments_memory: FAST_ARRAY[FIXED_STRING]

end -- class CGI_PATH_INFO
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
