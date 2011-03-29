-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ZIP[V_, K_]
   --
   -- Makes a dictionary of two independent collections.
   --

inherit
   MAP[V_, K_]

create {ANY}
   make

feature {ANY}
   count: INTEGER is
      do
         Result := keys.count
      end

   copy (other: like Current) is
      do
         make(other.items, other.keys)
      end

   has (k: K_): BOOLEAN is
      do
         Result := keys.valid_index(keys.first_index_of(k))
      end

   at (k: K_): V_ is
      local
         index: INTEGER
      do
         index := keys.first_index_of(k)
         Result := items.item(index - keys.lower + items.lower)
      end

   reference_at (k: K_): V_ is
      do
         Result := at(k)
      end

   fast_has (k: K_): BOOLEAN is
      do
         Result := keys.valid_index(keys.fast_first_index_of(k))
      end

   fast_at (k: K_): V_ is
      local
         index: INTEGER
      do
         index := keys.fast_first_index_of(k)
         Result := items.item(index - keys.lower + items.lower)
      end

   fast_reference_at (k: K_): V_ is
      do
         Result := fast_at(k)
      end

   item (index: INTEGER): V_ is
      do
         Result := items.item(index + items.lower)
      end

   key (index: INTEGER): K_ is
      do
         Result := keys.item(index + keys.lower)
      end

   new_iterator_on_items: ITERATOR[V_] is
      do
         Result := items.new_iterator
      end

   new_iterator_on_keys: ITERATOR[K_] is
      do
         Result := keys.new_iterator
      end

feature {ANY} -- Other features:
   internal_key (k: K_): K_ is
      local
         index: INTEGER
      do
         index := keys.first_index_of(k)
         Result := keys.item(index)
      end

feature {ANY}
   make (a_items: like items; a_keys: like keys) is
      require
         a_items.count = a_keys.count
      do
         items := a_items
         keys := a_keys
      ensure
         items = a_items
         keys = a_keys
      end

feature {ZIP}
   items: TRAVERSABLE[V_]
   keys: TRAVERSABLE[K_]

invariant
   items.count = keys.count

end -- class ZIP
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
