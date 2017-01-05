-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_ROPE
   -- Please do not use this class directly. Look at `ITERATOR'.

inherit
   ITERATOR[CHARACTER]

create {ANY}
   make

feature {}
   root: ROPE
         -- The beginning of the rope to be traversed.

   right_visited: BOOLEAN
         -- Has `right' been iterated onto?

   iter: ITERATOR[CHARACTER]
         -- Current position on `piece'.

feature {ANY}
   make (r: like root)
      require
         r /= Void
      do
         root := r
      ensure
         root = r
      end

   start
      do
         right_visited := False
         iter := root.left.new_iterator
         iter.start
      ensure then
         iter /= Void
      end

   is_off: BOOLEAN
      do
         Result := iter = Void
      end

   item: CHARACTER
      do
         Result := iter.item
      end

   next
      do
         iter.next
         if iter.is_off then -- switch to the next piece of rope
            if right_visited then
               iter := Void
            else
               right_visited := True
               iter := root.right.new_iterator
               iter.start
            end
         end
      end

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := root.generation
      end

   generation: INTEGER

end -- class ITERATOR_ON_ROPE
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
