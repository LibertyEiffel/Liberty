-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PACKRAT_NOT

inherit
   PACKRAT_LOOKAHEAD

create {ANY}
   make

feature {ANY}
   out_in_tagged_out_memory
      do
         tagged_out_memory.extend('!')
         primary.out_in_tagged_out_memory
      end

   accept (visitor: PACKRAT_VISITOR)
      do
         visitor.visit_not(Current)
      end

feature {}
   pack_parse (context: PACKRAT_PARSE_CONTEXT): TRISTATE
      local
         memo: PACKRAT_CONTEXT_MEMO
      do
         memo := context.memo
         if primary.parse(context) = no then
            Result := yes
         else
            Result := no
         end
         context.restore(memo)
      end

end -- class PACKRAT_NOT
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
