-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ITERATOR_ON_DICTIONARY_KEYS[V_, K_]
   -- Please do not use this class directly. Look at `ITERATOR'.

inherit
   ITERATOR[K_]

create {ANY}
   make

feature {}
   dictionary: DICTIONARY[V_, K_]
         -- The one to be traversed.

   item_index: INTEGER

feature {ANY}
   make (d: like dictionary)
      require
         d /= Void
      do
         dictionary := d
         start
      ensure
         dictionary = d
      end

   start
      do
         item_index := 1
         generation := iterable_generation
      end

   is_off: BOOLEAN
      do
         Result := item_index > dictionary.count
      end

   item: K_
      do
         Result := dictionary.key(item_index)
      end

   next
      do
         item_index := item_index + 1
      end

feature {ANY}
   iterable_generation: INTEGER
      do
         Result := dictionary.generation
      end

   generation: INTEGER

end -- class ITERATOR_ON_DICTIONARY_KEYS
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
