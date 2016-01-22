-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class ARRAY[E_]
   --
   -- General purpose resizable ARRAYs as they are define in the Eiffel language definition.
   -- The `lower' bound can be any arbitrary value, even a negative one.
   --
   -- This implementation uses only one chunk of memory, the `storage' area which is a NATIVE_ARRAY. One must
   -- keep in mind that this internal `storage' area is always kept left align. Thus, you can expect good
   -- performances while using an ARRAY to modelize a stack behavior with `add_last' / `last' / `remove_last'.
   -- Conversely `add_first' and `remove_first' are likely to slow down your program if they are too often
   -- used. If the fact that `lower' is always stuck to 0 is not a problem for you, also consider FAST_ARRAY to
   -- get better performances.
   --

inherit
   COLLECTION[E_]
      redefine default_create
      end
   ARRAYED_COLLECTION[E_]
      redefine default_create
      end

insert
   NATIVE_ARRAY_COLLECTOR[E_]
      undefine default_create, out_in_tagged_out_memory
      redefine default_create
      end

create {ANY}
   default_create, make, with_capacity, from_collection, manifest_creation

feature {}
   default_create
      do
         make(0, -1)
      end

feature {ANY}
   lower: INTEGER
         -- Lower index bound.

feature {ANY} -- Creation and Modification:
   make (min_index, max_index: INTEGER)
         -- Prepare the array to hold values for indexes in range
         -- [`min_index' .. `max_index']. Set all values to default.
         -- When `max_index' = `min_index' - 1, the array `is_empty'.
      require
         valid_bounds: min_index <= max_index + 1
      do
         ensure_capacity_and_bounds(max_index - min_index + 1, min_index, max_index)
      ensure
         lower_set: lower = min_index
         upper_set: upper = max_index
         items_set: all_default
      end

   with_capacity (needed_capacity, low: INTEGER)
         -- Create an empty array with `capacity' initialized
         -- at least to `needed_capacity' and `lower' set to `low'.
      require
         needed_capacity >= 0
      do
         ensure_capacity_and_bounds(needed_capacity, low, low - 1)
      ensure
         is_empty
         needed_capacity <= capacity
         lower = low
      end

feature {}
   ensure_capacity_and_bounds (needed_capacity, low, up: INTEGER)
      require
         up >= low - 1
         needed_capacity >= up - low + 1
      local
         value: like item
      do
         if value = Void and then capacity > 0 then
            -- Be sure to release all objects. Useful only if the objects are references.
            clear_all
         end
         lower := low
         upper := up
         if needed_capacity > 0 then
            if capacity < needed_capacity then
               storage := storage.calloc(needed_capacity)
               capacity := needed_capacity
            elseif value /= Void and then up >= low then
               -- Ensure the postcondition. Useful only for expanded objects since references were purged above.
               clear_all
            end
         end
         next_generation
      ensure
         needed_capacity <= capacity
         lower = low
         upper = up
         all_default
      end

feature {ANY} -- Modification:
   resize (min_index, max_index: INTEGER)
         -- Resize to bounds `min_index' and `max_index'. Do not lose any
         -- item whose index is in both [`lower' .. `upper'] and
         -- [`min_index' .. `max_index']. New positions if any are
         -- initialized with the appropriate default value.
      require
         min_index <= max_index + 1
      local
         needed, offset, intersize: INTEGER
      do
         needed := max_index - min_index + 1
         if needed > 0 then
            if needed > capacity then
               if capacity = 0 then
                  storage := storage.calloc(needed)
                  capacity := needed
               else
                  storage := storage.realloc(capacity, needed)
                  capacity := needed
               end
            end
            offset := lower - min_index
            intersize := max_index.min(upper) - min_index.max(lower) + 1
            if intersize > 0 then
               if offset = 0 then
                  if intersize <= upper - lower then
                     storage.clear(intersize, upper - lower)
                  end
               elseif offset < 0 then
                  storage.move(-offset, intersize - offset - 1, offset)
                  storage.clear(intersize, upper - lower)
               else
                  storage.move(0, intersize - 1, offset)
                  storage.clear(0, offset - 1)
                  if intersize + offset <= upper - lower then
                     storage.clear(intersize + offset, upper - lower)
                  end
               end
            else
               storage.clear(0, upper - lower)
            end
         elseif upper >= lower then
            storage.clear(0, upper - lower)
         end
         lower := min_index
         upper := max_index
         next_generation
      ensure
         lower = min_index
         upper = max_index
      end

   reindex (new_lower: INTEGER)
         -- Change indexing to take in account the expected `new_lower'
         -- index. The `upper' index is translated accordingly.
      local
         i: INTEGER
      do
         i := new_lower - lower
         lower := lower + i
         upper := upper + i
         next_generation
      ensure
         lower = new_lower
         count = old count
      end

feature {ANY} -- Implementation of deferred:
   count: INTEGER
      do
         Result := upper - lower + 1
      end

   is_empty: BOOLEAN
      do
         Result := upper < lower
      end

   subarray (min, max: INTEGER): like Current
      do
         Result := slice(min, max)
         Result.reindex(min)
      ensure then
         Result.lower = min
      end

   item (i: INTEGER): E_
      do
         Result := storage.item(i - lower)
      end

   put (element: like item; i: INTEGER)
      do
         storage.put(element, i - lower)
         next_generation
      end

   force (element: like item; index: INTEGER)
      require else
         True
      do
         if upper < index then
            if index = upper + 1 then
               add_last(element)
            else
               resize(lower, index)
               put(element, index)
            end
         elseif index < lower then
            resize(index, upper)
            put(element, index)
         else
            put(element, index)
         end
      ensure then
         lower = index.min(old lower)
      end

   copy (other: like Current)
      local
         needed_capacity: INTEGER
      do
         lower := other.lower
         upper := other.upper
         needed_capacity := upper - lower + 1
         if capacity < needed_capacity then
            storage := storage.calloc(needed_capacity)
            capacity := needed_capacity
         end
         if needed_capacity > 0 then
            storage.copy_from(other.storage, needed_capacity - 1)
         end
         next_generation
      end

   set_all_with (v: like item)
      do
         storage.set_all_with(v, upper - lower)
         next_generation
      end

   remove_first
      do
         storage.remove_first(upper - lower)
         lower := lower + 1
         next_generation
      ensure then
         upper = old upper
      end

   remove_head (n: INTEGER)
      do
         storage.move(n, upper - lower, -n)
         lower := lower + n
         next_generation
      ensure then
         upper = old upper
      end

   remove (index: INTEGER)
      do
         storage.remove(index - lower, upper - lower)
         upper := upper - 1
         next_generation
      end

   clear_count, clear_count_and_capacity
      do
         upper := lower - 1
         next_generation
      ensure then
         capacity = old capacity
      end

   add_first (element: like item)
      do
         if upper < lower then
            add_last(element)
         else
            add_last(element)
            move(lower, upper - 1, 1)
            put(element, lower)
         end
      end

   add_last (element: like item)
      local
         new_capacity: INTEGER
      do
         if capacity < count + 1 then
            if capacity = 0 then
               new_capacity := 16
               storage := storage.calloc(new_capacity)
               capacity := new_capacity
            else
               new_capacity := capacity * 2
               storage := storage.realloc(capacity, new_capacity)
               capacity := new_capacity
            end
         end
         upper := upper + 1
         put(element, upper)
      end

   from_collection (model: TRAVERSABLE[like item])
      local
         i, up: INTEGER
      do
         from
            with_capacity(model.count, model.lower)
            i := model.lower
            up := model.upper
            upper := up
         until
            i > up
         loop
            put(model.item(i), i)
            i := i + 1
         end
      ensure then
         lower = model.lower
         upper = model.upper
      end

   all_default: BOOLEAN
      do
         Result := storage.all_default(upper - lower)
      end

   occurrences (element: like item): INTEGER
      do
         Result := storage.occurrences(element, upper - lower)
      end

   fast_occurrences (element: like item): INTEGER
      do
         Result := storage.fast_occurrences(element, upper - lower)
      end

   first_index_of (element: like item): INTEGER
      do
         if upper >= lower then
            Result := lower + storage.first_index_of(element, upper - lower)
         else
            Result := lower
         end
      end

   index_of (element: like item; start_index: INTEGER): INTEGER
      do
         if upper >= lower then
            Result := lower + storage.index_of(element, start_index - lower, upper - lower)
         else
            Result := lower
         end
      end

   reverse_index_of (element: like item; start_index: INTEGER): INTEGER
      do
         if upper >= lower then
            Result := lower + storage.reverse_index_of(element, start_index - lower)
         else
            Result := lower
         end
      end

   fast_first_index_of (element: like item): INTEGER
      do
         if upper >= lower then
            Result := lower + storage.fast_first_index_of(element, upper - lower)
         else
            Result := lower
         end
      end

   fast_index_of (element: like item; start_index: INTEGER): INTEGER
      do
         if upper >= lower then
            Result := lower + storage.fast_index_of(element, start_index - lower, upper - lower)
         else
            Result := lower
         end
      end

   fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER
      do
         if upper >= lower then
            Result := lower + storage.fast_reverse_index_of(element, start_index - lower)
         else
            Result := lower
         end
      end

   fast_is_equal (other: like Current): BOOLEAN
      do
         if Current = other then
            Result := True
         elseif lower = other.lower and then upper = other.upper then
            Result := storage.fast_memcmp(other.storage, count)
         end
      end

   is_equal (other: like Current): BOOLEAN
      do
         if Current = other then
            Result := True
         elseif lower = other.lower and then upper = other.upper then
            Result := storage.memcmp(other.storage, count)
         end
      end

   slice (min, max: INTEGER): like Current
      local
         null: POINTER
      do
         Result := standard_twin
         Result.set_upper(Result.lower - 1)
         Result.from_external(null, 0)

         if max >= min then
            -- Slice not empty
            Result.make(lower, lower + max - min)
            Result.storage.slice_copy(0, storage, min - lower, max - lower)
         else
            Result.with_capacity(0, lower)
         end
      end

   new_iterator: ITERATOR[E_]
      do
         create {ITERATOR_ON_TRAVERSABLE[E_]} Result.make(Current)
      end

feature {} -- Garbage collector tuning (very low-level):
   mark_native_arrays
         -- For performance reasons, the unused area of `storage' is always left as it is when
         -- some elements are removed. No time is lost to clean the released area with a Void
         -- or a 0 value. (Look for example the `remove_last' implementation.)
         -- Thus, the unused area of `storage' may contains references of actually unreachable
         -- objects. The following `mark_native_arrays' actually replace the
         -- default behavior (the call is automatic) in order to mark only reachable objects.
      local
         i: INTEGER
      do
         from
            i := count - 1
         until
            i < 0
         loop
            mark_item(storage, i)
            i := i - 1
         end
      end

feature {} -- Implement manifest generic creation (very low-level):
   manifest_make (needed_capacity: INTEGER; initial_lower: INTEGER)
         -- Manifest creation of an ARRAY[E_] with `lower' set to `initial_lower'.
      require
         needed_capacity > 0
      do
         make(initial_lower, initial_lower + needed_capacity - 1)
      end

   manifest_put (index: INTEGER; element: like item)
      do
         check
            index < capacity
         end
         storage.put(element, index)
      end

end -- class ARRAY
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
