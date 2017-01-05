-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BIJECTIVE_DICTIONARY_REVERSER[V_, K_]
   -- Allows to view a BIJECTIVE_DICTIONARY[V_, K_] as a BIJECTIVE_DICTIONARY[K_, V_]

inherit
   BIJECTIVE_DICTIONARY[V_, K_]

create {ANY}
   from_bijective_dictionary

feature {ANY}
   from_bijective_dictionary (bijective_dictionary_: like bijective_dictionary)
      do
         bijective_dictionary := bijective_dictionary_
      end

   count: INTEGER
      do
         Result := bijective_dictionary.count
      end

   has (k: K_): BOOLEAN
      do
         Result := bijective_dictionary.has_value(k)
      end

   at (k: K_): V_
      do
         Result := bijective_dictionary.key_at(k)
      end

   reference_at (k: K_): V_
      do
         if has(k) then
            Result := at(k)
         end
      end

   fast_has (k: K_): BOOLEAN
      do
         Result := bijective_dictionary.fast_has_value(k)
      end

   fast_at (k: K_): V_
      do
         Result := bijective_dictionary.fast_key_at(k)
      end

   fast_reference_at (k: K_): V_
      do
         if fast_has(k) then
            Result := fast_at(k)
         end
      end

   has_value (v: V_): BOOLEAN
      do
         Result := bijective_dictionary.has(v)
      end

   key_at (v: V_): K_
      do
         Result := bijective_dictionary.at(v)
      end

   fast_has_value (v: V_): BOOLEAN
      do
         Result := bijective_dictionary.fast_has(v)
      end

   fast_key_at (v: V_): K_
      do
         Result := bijective_dictionary.fast_at(v)
      end

   put (v: V_; k: K_)
      do
         remove(k)
         add(v, k)
      end

   add (v: V_; k: K_)
      do
         bijective_dictionary.add(k, v)
         next_generation
      end

   remove (k: K_)
      local
         v: V_
      do
         if has(k) then
            v := at(k)
            bijective_dictionary.remove(v)
         end
         next_generation
      end

   clear_count
      do
         bijective_dictionary.clear_count
         next_generation
      end

   clear_count_and_capacity
      do
         bijective_dictionary.clear_count_and_capacity
         next_generation
      end

   capacity: INTEGER
      do
         Result := bijective_dictionary.capacity
      end

   item (index: INTEGER): V_
      do
         Result := bijective_dictionary.key(index)
      end

   key (index: INTEGER): K_
      do
         Result := bijective_dictionary.item(index)
      end

   copy (other: like Current)
      do
         bijective_dictionary := other.bijective_dictionary
      end

   internal_key (k: K_): K_
      do
         Result := key_at(at(k))
      end

feature {BIJECTIVE_DICTIONARY}
   bijective_dictionary: BIJECTIVE_DICTIONARY[K_, V_]

end -- class BIJECTIVE_DICTIONARY_REVERSER
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
