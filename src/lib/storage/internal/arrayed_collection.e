-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class ARRAYED_COLLECTION[E_]
   --
   -- Common root for ARRAY, FAST_ARRAY and RING_ARRAY.
   --

inherit
   COLLECTION[E_]

feature {ARRAYED_COLLECTION, ARRAYED_COLLECTION_HANDLER}
   storage: NATIVE_ARRAY[E_]
         -- Internal access to storage location.

   from_external (a_storage: POINTER; a_capacity: like capacity)
      require
         a_capacity > 0 implies a_storage.is_not_null
      do
         storage := storage.from_pointer(a_storage)
         capacity := a_capacity
      ensure
         storage.to_external = a_storage
         capacity = a_capacity
      end

feature {ANY}
   capacity: INTEGER
         -- Internal storage capacity in number of item.

   upper: INTEGER
         -- Upper index bound.

   subarray (min, max: INTEGER): like Current
         -- New collection consisting of items at indexes in [`min' .. `max'].
         -- Result has the same dynamic type as `Current'.
         -- See also `slice'.
      require
         lower <= min
         max <= upper
         min <= max + 1
      deferred
      ensure
         same_dynamic_type(Result)
         Result.count = max - min + 1
         Result.lower = min or Result.lower = 0
      end

feature {ANY} -- Implementation of deferred:
   first: like item
      do
         Result := storage.item(0)
      end

   last: like item
      do
         Result := item(upper)
      end

   add (element: like item; index: INTEGER)
      do
         if index = upper + 1 then
            add_last(element)
         else
            add_last(element)
            move(index, upper - 1, 1)
            put(element, index)
         end
      end

   remove_last
      do
         upper := upper - 1
      end

   remove_tail (n: INTEGER)
      do
         upper := upper - n
      end

   replace_all (old_value, new_value: like item)
      do
         storage.replace_all(old_value, new_value, count - 1)
      end

   fast_replace_all (old_value, new_value: like item)
      do
         storage.fast_replace_all(old_value, new_value, count - 1)
      end

   reverse
      local
         i, j: INTEGER
      do
         from
            i := lower
            j := upper
         until
            i >= j
         loop
            swap(i, j)
            i := i + 1
            j := j - 1
         end
      end

feature {ANY} -- Interfacing with C:
   to_external: POINTER
         -- Gives C access into the internal `storage' of the ARRAY.
         -- Result is pointing the element at index `lower'.
         --
         -- NOTE: do not free/realloc the Result. Resizing of the array
         --       can makes this pointer invalid.
      require
         not is_empty
      do
         Result := storage.to_pointer
      ensure
         Result.is_not_null
      end

feature {ARRAYED_COLLECTION}
   set_upper (new_upper: like upper)
      do
         upper := new_upper
      end

invariant
   capacity >= upper - lower + 1
   capacity > 0 implies storage.is_not_null

end -- class ARRAYED_COLLECTION
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
