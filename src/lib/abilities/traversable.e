-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class TRAVERSABLE[E_]
   -- A `TRAVERSABLE[E_]' is a finite readable sequence of objects of type E_.
   -- For instance, `COLLECTION's and `STRING's are `TRAVERSABLE'.
   --
   -- A good performance should always be obtained by sequentially accessing a `TRAVERSABLE' with increasing
   -- indexes (from `lower' to `upper'), as demonstrated in the following code snippet :
   --
   --  from
   --     i := a_traversable.lower
   --  until
   --     i > a_traversable.upper
   --  loop
   --     do_something_with(a_traversable.item(i))
   --     i := i + 1
   --  end
   --
   -- Other accessing methods (including random access and sequential access from `upper' to `lower') may or
   -- may not lead to acceptable performance, depending on the particular implementation of `TRAVERSABLE'.

inherit
   ITERABLE[E_]
      undefine -- because INDEXABLE features are more performant
         for_each, for_all, exists, aggregate,
         out_in_tagged_out_memory
      end
   INDEXABLE[E_]

feature {ANY}
   enumerate: ENUMERATE[E_]
      local
         items: TRAVERSABLE[E_]
      do
         if items ?:= Current then
            items ::= Current
            create Result.make(items)
         end
      end

end -- class TRAVERSABLE
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
