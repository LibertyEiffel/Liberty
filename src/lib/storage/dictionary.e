-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class DICTIONARY[V_, K_]
   --
   -- Associative memory. Values of type `V_' are stored using Keys of type `K_'.
   -- To make a comparison with the well known ARRAY class, with a DICTIONARY, index used are not only
   -- INTEGER, you can use for example a STRING to access to your information.
   --
   -- Well known implementations, see HASHED_DICTIONARY, AVL_DICTIONARY and ARRAY_DICTIONARY.
   --
   -- See also BIJECTIVE_DICTIONARY class.
   --

inherit
   MAP[V_, K_]

feature {ANY} -- Adding:
   put (v: V_; k: K_) assign at
         -- Change some existing entry or `add' the new one. If there is as yet no key `k' in the dictionary,
         -- enter it with item `v'. Otherwise overwrite the item associated with key `k'.
         -- As the `put' procedure actually uses `is_equal', you may consider to use `fast_put' for expanded
         -- objects as well while trying to get the very best performances.
         --
         -- See also `fast_put', `add'.
      require
         k /= Void
      deferred
      ensure
         v = at(k)
      end

   fast_put (v: V_; k: K_) assign fast_at
         -- Same job as `put', but uses basic `=' for comparison.
         -- If you are sure that `k' is not an existing entry, please consider using `add'
         -- to get very best performances.
         --
         -- See also `put', `add'.
      require
         k /= Void
      deferred
      ensure
         v = at(k)
      end

   add (v: V_; k: K_)
         -- To add a new entry `k' with its associated value `v'.
         -- Actually, this is equivalent to call `put', but it may run a little bit faster.
         --
         -- See also `put', `fast_put'.
      require
         not has(k)
      deferred
      ensure
         count = 1 + old count
         v = at(k)
      end

   set_item (v: V_; index: INTEGER)
      require
         valid_index(index)
      deferred
      ensure
         count = old count
         v = item(index)
      end

feature {ANY} -- Removing:
   remove (k: K_)
         -- Remove entry `k' (which may exist or not before this call).
         -- As the `remove' procedure actually uses `is_equal', you may consider to use `fast_remove' for expanded
         -- objects as well while trying to get the very best performances.
         --
         -- See also `fast_remove', `clear_count'.
      require
         k /= Void
      deferred
      ensure
         not has(k)
      end

   fast_remove (k: K_)
         -- Same job as `remove', but uses basic `=' for comparison.
         --
         -- See also `remove', `clear_count'.
      require
         k /= Void
      deferred
      ensure
         not fast_has(k)
      end

   clear_count
         -- Discard all items (`is_empty' is True after that call). The internal `capacity' is not changed
         -- by this call.
         --
         -- See also `clear_count_and_capacity', `remove'.
      deferred
      ensure
         is_empty: count = 0
         capacity = old capacity
      end

   clear_count_and_capacity
         -- Discard all items (`is_empty' is True after that call). The internal `capacity' may also be
         -- reduced after this call.
         --
         -- See also `clear_count', `remove'.
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

feature {ANY}
   copy (other: like Current)
         -- Reinitialize by copying all associations of `other'.
      local
         i: INTEGER
      do
         clear_count
         from
            i := 1
         until
            i > other.count
         loop
            put(other.item(i), other.key(i))
            i := i + 1
         end
      end

   new_iterator_on_items: ITERATOR[V_]
      do
         create {ITERATOR_ON_DICTIONARY_ITEMS[V_, K_]} Result.make(Current)
      ensure then
         Result /= Void
      end

feature {}
   make
         -- Creates an empty dictionary.
      deferred
      ensure
         is_empty
      end

feature {} -- Implement manifest generic creation:
   manifest_make (needed_capacity: INTEGER)
         -- Manifest creation of a dictionary.
      do
         make
      end

   manifest_put (index: INTEGER; v: V_; k: K_)
      require
         not has(k)
      do
         add(v, k)
      end

   manifest_semicolon_check: INTEGER 2
         -- Put semicolons between successive value-key pairs.

feature {}
   key_safe_equal (k1, k2: K_): BOOLEAN
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

end -- class DICTIONARY
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
