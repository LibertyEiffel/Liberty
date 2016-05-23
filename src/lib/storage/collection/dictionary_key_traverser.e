-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class DICTIONARY_KEY_TRAVERSER[V_, K_]
   -- This class allows you to view a MAP[V_, K_] as a TRAVERSABLE[K_].  Note that there is no need for
   -- a DICTIONARY_ITEM_TRAVERSER because MAP[V_, K_] is already a TRAVERSABLE[V_].

inherit
   TRAVERSABLE[K_]

create {ANY}
   from_dictionary

create {MAP}
   from_map

feature {}
   from_map (map_: like map)
      do
         map := map_
      end

feature {ANY}
   from_dictionary (map_: like map)
      obsolete "Use map.keys instead"
      do
         from_map(map)
      end

feature {ANY}
   lower: INTEGER
      do
         Result := map.lower
      end

   upper: INTEGER
      do
         Result := map.upper
      end

feature {ANY}
   count: INTEGER
      do
         Result := map.count
      end

   is_empty: BOOLEAN
      do
         Result := map.is_empty
      end

feature {ANY}
   item (i: INTEGER): K_
      do
         Result := map.key(i)
      end

   first: like item
      do
         Result := item(lower)
      end

   last: like item
      do
         Result := item(upper)
      end

feature {ANY}
   new_iterator: ITERATOR[K_]
      do
         Result := map.new_iterator_on_keys
      end

feature {}
   map: MAP[V_, K_]

end -- class DICTIONARY_KEY_TRAVERSER
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
