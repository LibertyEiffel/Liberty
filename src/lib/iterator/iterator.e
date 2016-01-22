-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ITERATOR[E_]
   --
   -- The iterator pattern at work: this abstract class defines a
   -- traversal interface for any kind of aggregates data structure.
   -- An iterator can be used when you need to do something on all
   -- elements in the data structure, but there is no order concept.
   --
   -- To create a new iterator, use `new_iterator' in the
   -- corresponding data structure.
   --
   -- See examples in directory SmartEiffel/tutorial/iterator.
   --

feature {ANY}
   frozen is_valid: BOOLEAN
      do
         Result := generation = iterable_generation
      end

   start
         -- Positions the iterator to the first object in the
         -- aggregate to be traversed.
      deferred
      ensure
         is_valid
      end

   is_off: BOOLEAN
         -- Returns True when there are no more objects in the
         -- sequence.
      require
         is_valid
      deferred
      ensure
         generation = old generation
         is_valid
      end

   item: E_
         -- Returns the object at the current position in the
         -- sequence.
      require
         is_valid
         not is_off
      deferred
      ensure
         generation = old generation
         is_valid
      end

   next
         -- Positions the iterator to the next object in the
         -- sequence.
      require
         is_valid
         not is_off
      deferred
      ensure
         generation = old generation
         is_valid
      end

feature {ANY} -- Check that the underlying traversable has not changed
   iterable_generation: INTEGER
      deferred
      end

   generation: INTEGER
      deferred
      end

feature {ANY} -- Agent-based features:
   for_each (action: PROCEDURE[TUPLE[E_]])
         -- Apply `action' to every item of `Current'.
         --
         -- See also `for_all', `exists', `aggregate'.
      do
         from
            start
         invariant
            is_valid
         until
            is_off
         loop
            action.call([item])
            next
         end
      end

   for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN
         -- Do all items satisfy `test'?
         --
         -- See also `for_each', `exists', `aggregate'.
      do
         from
            Result := True
            start
         invariant
            is_valid
         until
            not Result or else is_off
         loop
            Result := test.item([item])
            next
         end
      end

   exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN
         -- Does at least one item satisfy `test'?
         --
         -- See also `for_each', `for_all', `aggregate'.
      do
         from
            start
         invariant
            is_valid
         until
            Result or else is_off
         loop
            Result := test.item([item])
            next
         end
      end

   aggregate (action: FUNCTION[TUPLE[E_, E_], E_]; initial: E_): E_
         -- Aggregate all the elements starting from the initial value.
         --
         -- See also `for_each', `for_all', `exists'.
      do
         from
            Result := initial
            start
         invariant
            is_valid
         until
            is_off
         loop
            Result := action.item([Result, item])
            next
         end
      end

feature {} -- Invariant on `generation` dynamics
   generation_for_invariant: INTEGER

   generation_only_grows: BOOLEAN
      do
         Result := generation >= generation_for_invariant
         generation_for_invariant := generation
      end

invariant
   generation_only_grows

end -- class ITERATOR
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
