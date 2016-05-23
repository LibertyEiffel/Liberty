-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class INDEXABLE[E_]
   --
   -- An `INDEXABLE[E_]' is a finite readable sequence of objects of type E_.
   --
   -- A good performance should always be obtained by sequentially accessing an `INDEXABLE' with increasing
   -- indexes (from `lower' to `upper'), as demonstrated in the following code snippet :
   --
   --  from
   --     i := a_indexable.lower
   --  until
   --     i > a_indexable.upper
   --  loop
   --     do_something_with(a_indexable.item(i))
   --     i := i + 1
   --  end
   --
   -- Other accessing methods (including random access and sequential access from `upper' to `lower') may or
   -- may not lead to acceptable performance, depending on the particular implementation of `INDEXABLE'.
   --

inherit
   HOARD[E_]
      redefine
         out_in_tagged_out_memory
      end

feature {ANY} -- Indexing:
   lower: INTEGER
         -- Minimum index.
         --
         -- See also `upper', `valid_index', `item'.
      deferred
      end

   upper: INTEGER
         -- Maximum index.
         --
         -- See also `lower', `valid_index', `item'.
      deferred
      end

   valid_index (i: INTEGER): BOOLEAN
         -- True when `i' is valid (i.e., inside actual bounds).
         --
         -- See also `lower', `upper', `item'.
      do
         Result := lower <= i and then i <= upper
      ensure
         definition: Result = (lower <= i and i <= upper)
      end

feature {ANY} -- Accessing:
   item (i: INTEGER): E_
         -- Item at the corresponding index `i'.
         --
         -- See also `lower', `upper', `valid_index'.
      require
         valid_index(i)
      deferred
      end

   first: like item
         -- The very `first' item.
         --
         -- See also `last', `item'.
      require
         not is_empty
      deferred
      ensure
         definition: Result = item(lower)
      end

   last: like item
         -- The `last' item.
         --
         -- See also `first', `item'.
      require
         not is_empty
      deferred
      ensure
         definition: Result = item(upper)
      end

feature {ANY} -- Agent-based features:
   for_each (action: PROCEDURE[TUPLE[E_]])
         -- Apply `action' to every item of `Current'.
         --
         -- See also `for_all', `exists', `aggregate'.
      local
         i: INTEGER
      do
         from
            i := lower
         until
            i > upper
         loop
            action.call([item(i)])
            i := i + 1
         end
      end

   for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN
         -- Do all items satisfy `test'?
         --
         -- See also `for_each', `exists', `aggregate'.
      local
         i: INTEGER
      do
         from
            Result := True
            i := lower
         until
            not Result or else i > upper
         loop
            Result := test.item([item(i)])
            i := i + 1
         end
      end

   exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN
         -- Does at least one item satisfy `test'?
         --
         -- See also `for_each', `for_all', `aggregate'.
      local
         i: INTEGER
      do
         from
            i := lower
         until
            Result or else i > upper
         loop
            Result := test.item([item(i)])
            i := i + 1
         end
      end

   aggregate (action: FUNCTION[TUPLE[E_, E_], E_]; initial: E_): E_
         -- Aggregate all the elements starting from the initial value.
         --
         -- See also `for_each', `for_all', `exists'.
      local
         i: INTEGER
      do
         from
            Result := initial
            i := lower
         until
            i > upper
         loop
            Result := action.item([Result, item(i)])
            i := i + 1
         end
      end

feature {ANY} -- Printing:
   out_in_tagged_out_memory
      local
         i: INTEGER; v: like item
      do
         tagged_out_memory.extend('{')
         tagged_out_memory.append(generating_type)
         tagged_out_memory.append(once ":[")
         from
            i := lower
         until
            i > upper
         loop
            v := item(i)
            if v = Void then
               tagged_out_memory.append(once "Void")
            else
               v.out_in_tagged_out_memory
            end
            if i < upper then
               tagged_out_memory.extend(' ')
            end
            i := i + 1
         end
         tagged_out_memory.append(once "]}")
      end

end -- class INDEXABLE
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
