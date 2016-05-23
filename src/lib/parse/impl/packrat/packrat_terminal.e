-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_TERMINAL

inherit
   PARSE_TERMINAL[PACKRAT_PARSE_CONTEXT]
      redefine
         out_in_tagged_out_memory
      end
   PACKRAT_ATOM
      redefine
         out_in_tagged_out_memory
      end

create {ANY}
   make

feature {ANY}
   out_in_tagged_out_memory
      do
         if name = Void then
            tagged_out_memory.append(once "<terminal>")
         else
            name.out_in_tagged_out_memory
         end
      end

   accept (visitor: PACKRAT_VISITOR)
      do
         visitor.visit_terminal(Current)
      end

   pretty_print_on (stream: OUTPUT_STREAM)
      do
         -- nothing
      end

end -- class PACKRAT_TERMINAL
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
