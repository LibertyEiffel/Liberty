-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ITERABLE[E_]
   --
   -- An `ITERABLE[E_]' is a (potentially infinite) readable sequence of objects of type E_ that can be
   -- accessed through an ITERATOR[E]
   --

inherit
   HOARD[E_]

feature {ANY} -- Other features:
   new_iterator: ITERATOR[E_] is
      deferred
      ensure
         Result /= Void
         Result.generation = generation
      end

   frozen get_new_iterator: like new_iterator is
      obsolete "Please use new_iterator instead. This SmartEiffel historic feature is badly named."
      do
         Result := new_iterator
      end

feature {ANY} -- Agent-based features:
   do_all (action: ROUTINE[TUPLE[E_]]) is
         -- Apply `action' to every item of `Current'.
         --
         -- See also `for_all', `exists', `aggregate'.
      do
         new_iterator.do_all(action)
      end

   for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
         -- Do all items satisfy `test'?
         --
         -- See also `do_all', `exists', `aggregate'.
      do
         Result := new_iterator.for_all(test)
      end

   exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
         -- Does at least one item satisfy `test'?
         --
         -- See also `do_all', `for_all', `aggregate'.
      do
         Result := new_iterator.exists(test)
      end

   aggregate (action: FUNCTION[TUPLE[E_, E_], E_]; initial: E_): E_ is
         -- Aggregate all the elements starting from the initial value.
         --
         -- See also `do_all', `for_all', `exists'.
      do
         Result := new_iterator.aggregate(action, initial)
      end

feature {ITERATOR}
   generation: INTEGER

feature {}
   frozen next_generation is
      do
         generation := generation + 1
      ensure
         generation > old generation
      end

end -- class ITERABLE
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
