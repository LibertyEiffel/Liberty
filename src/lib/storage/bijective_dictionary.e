-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class BIJECTIVE_DICTIONARY[V_, K_]
   --
   -- Bijective associative memory. As for ordinary DICTIONARY, Values of type `V_' are stored using Keys
   -- of type `K_', but, in a BIJECTIVE_DICTIONARY, given one value of type `V_', you can retrieve the unique
   -- corresponding key of type `K_'. In other words, with a BIJECTIVE_DICTIONARY, one key of type `K_' gives
   -- you access to one value of type `V_' which can be used to retrieve back the same unique original key.
   --
   -- At time being, the only one available implementation is the HASHED_BIJECTIVE_DICTIONARY class.
   --
   -- See also DICTIONARY class if you do not have a unique value for each key. By the way, also note that
   -- the interface of DICTIONARY is similar to the interface of BIJECTIVE_DICTIONARY in order to allow you to
   -- move from one to the other.
   --


inherit
   MAP[V_, K_]
      undefine
         key_at, fast_key_at
      redefine
         occurrences, fast_occurrences
      end

feature {ANY} -- Basic access:
   has_value (v: V_): BOOLEAN
         -- Is there a value `v'?
      require
         v /= Void
      deferred
      ensure
         Result implies has(key_at(v))
         Result = (occurrences(v) = 1)
      end

   fast_has_value (v: V_): BOOLEAN
         -- Is there a value `v'?
      require
         v /= Void
      deferred
      ensure
         Result implies fast_has(fast_key_at(v))
         Result = (fast_occurrences(v) = 1)
      end

feature {ANY} -- Looking and searching some value:
   occurrences (v: V_): INTEGER
      do
         Result := Precursor(v)
      ensure then
         Result.in_range(0, 1)
      end

   fast_occurrences (v: V_): INTEGER
      do
         Result := Precursor(v)
      ensure then
         Result.in_range(0, 1)
      end

feature {ANY}
   put (v: V_; k: K_) assign at
         -- Change some existing entry or `add' the new one. If there
         -- as yet no key `k' in the dictionary, enter it with item `v'.
         -- Otherwise overwrite the item associated with key `k'.
      require
         bijection_guard_key: has(k) implies key_at(at(k)).is_equal(k)
         bijection_guard_value: has_value(v) implies key_at(v).is_equal(k)
      deferred
      ensure
         value_updated: v = fast_at(k)
         key_updated: k = fast_key_at(v)
      end

   add (v: V_; k: K_)
         -- To add a new entry `k' with its associated value `v'. Actually, this is equivalent to call
         -- `put', but may run a little bit faster.
      require
         not has(k)
         not has_value(v)
      deferred
      ensure
         count = 1 + old count
         v = fast_at(k)
         k = fast_key_at(v)
      end

feature {ANY} -- Removing:
   remove (k: K_)
         -- Remove entry `k' (which may exist or not before this call).
      require
         k /= Void
      deferred
      ensure
         not has(k)
      end

   clear_count
         -- Discard all items (`is_empty' is True after that call). The internal `capacity' is not changed
         -- by this call. See also `clear_count_and_capacity' to select the most appropriate.
      deferred
      ensure
         is_empty: count = 0
         capacity = old capacity
      end

   clear_count_and_capacity
         -- Discard all items (`is_empty' is True after that call). The internal `capacity' may also be
         -- reduced after this call. See also `clear_count' to select the most appropriate.
      deferred
      ensure
         is_empty: count = 0
         capacity <= old capacity
      end

   capacity: INTEGER
         -- Approximation of the actual internal storage `capacity'. The `capacity' will grow automatically
         -- when needed (i.e. `capacity' is not a limit for the number of values stored). Also note that
         -- the `capacity' value may not be always accurate depending of the implementation (anyway, this
         -- `capacity' value is at least equals to `count').
      deferred
      end

feature {ANY} -- To provide iterating facilities:
   new_iterator_on_items: ITERATOR[V_]
      do
         create {ITERATOR_ON_BIJECTIVE_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
      end

   new_iterator_on_keys: ITERATOR[K_]
      do
         create {ITERATOR_ON_BIJECTIVE_DICTIONARY_KEYS[V_, K_]} Result.make(Current)
      end

   new_iterator: ITERATOR[TUPLE[V_, K_]]
      do
         create {ITERATOR_ON_BIJECTIVE_DICTIONARY[V_, K_]} Result.make(Current)
      end

feature {ANY} -- Other features:
   internal_key (k: K_): K_
         -- Retrieve the internal key object which correspond to the existing
         -- entry `k' (the one memorized into the `Current' dictionary).
      deferred
      ensure then
         internal_key(Result) = Result
         at(k) = fast_at(Result)
      end

feature {}
   frozen key_safe_equal (k1, k2: K_): BOOLEAN
         -- Because keys are never Void, we do not rely on the SAFE_EQUAL class.
      require
         k1 /= Void
         k2 /= Void
      do
         if k1 = k2 then
            Result := True
         elseif k1.same_dynamic_type(k2) then
            Result := k1.is_equal(k2)
         end
      end

   frozen val_safe_equal (v1, v2: V_): BOOLEAN
         -- Because values are never Void, we do not rely on the SAFE_EQUAL class.
      require
         v1 /= Void
         v2 /= Void
      do
         if v1 = v2 then
            Result := True
         elseif v1.same_dynamic_type(v2) then
            Result := v1.is_equal(v2)
         end
      end

feature {} -- Implement manifest generic creation:
   manifest_put (index: INTEGER; v: V_; k: K_)
      require
         v /= Void
         k /= Void
         not has(k)
      do
         add(v, k)
      end

   manifest_semicolon_check: INTEGER 2
         -- Put semicolons between successive value-key pairs.

end -- class BIJECTIVE_DICTIONARY
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
