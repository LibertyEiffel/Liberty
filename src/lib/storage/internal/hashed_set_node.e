-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class HASHED_SET_NODE[E_]
   --
   -- Auxiliary class to implement HASHED_SET.
   --

inherit
   ANY_HASHED_SET_NODE

create {ABSTRACT_HASHED_SET}
   make

feature {ABSTRACT_HASHED_SET}
   item: E_

   next: like Current
         -- The `next' one when some clash occurs.

   set_next (n: like next)
      do
         next := n
      ensure
         next = n
      end

   make (i: like item; n: like next)
      do
         item := i
         next := n
      ensure
         item = i
         next = n
      end

end -- class HASHED_SET_NODE
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
