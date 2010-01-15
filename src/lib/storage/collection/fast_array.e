-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class FAST_ARRAY[E_]
	--
	-- General purpose resizable FAST_ARRAYs. The only difference with ARRAY is the fact that the `lower' bound
	-- is actually frozen to 0. The `item' access is likely to be more efficient as well as loop going from
	-- `upper' to `lower' just because `lower' is 0. Keep in mind that even if the `lower' is frozen to 0
	-- it is really better to use the `lower' attribute, and not 0 directly, just because you may decide in the
	-- future to use another COLLECTION implementation.
	--
	-- Like ARRAY, the FAST_ARRAY implementation uses only one chunk of memory, the `storage' area which is a
	-- NATIVE_ARRAY. One must keep in mind that this internal `storage' area is always kept left align. Thus,
	-- you can expect good performances while using a FAST_ARRAY to modelize a stack behavior with `add_last' /
	-- `last' / `remove_last'. Conversely `add_first' and `remove_first' are likely to slow down your program if
	-- they are too often used. If the fact that `lower' is stuck to 0 do matter, also consider ARRAY.
	--

inherit
	COLLECTION[E_]

insert
	ARRAYED_COLLECTION[E_]
	NATIVE_ARRAY_COLLECTOR[E_]
		undefine out_in_tagged_out_memory
		end

creation {ANY}
	make, with_capacity, from_collection, manifest_creation

feature {ANY}
	lower: INTEGER is 0
			-- Frozen lower bound.

feature {ANY} -- Creation and modification:
	make (new_count: INTEGER) is
			-- Make array with range [0 .. `new_count' - 1].
			-- When `new_count' = 0 the array is empty.
		require
			new_count >= 0
		do
			if new_count > capacity then
				-- The new one is bigger:
				storage := storage.calloc(new_count)
				capacity := new_count
			elseif capacity > 0 then
				-- storage is big enough and just need to be cleared:
				upper := upper.max(new_count - 1)
				if upper >= 0 then
					storage.clear_all(upper)
				end
			end
			upper := new_count - 1
		ensure
			count = new_count
			capacity >= old capacity
			all_default
		end

	with_capacity (needed_capacity: INTEGER) is
			-- Create an empty array with at least `needed_capacity'.
		require
			needed_capacity >= 0
		do
			if capacity < needed_capacity then
				storage := storage.calloc(needed_capacity)
				capacity := needed_capacity
			elseif capacity > needed_capacity then
				storage.clear(0, upper)
			end
			upper := -1
		ensure
			capacity >= needed_capacity
			is_empty
		end

feature {ANY} -- Modification:
	resize (new_count: INTEGER) is
			-- Resize the array. When `new_count' is greater than `count', new positions are initialized 
			-- with appropriate default values.
		require
			new_count >= 0
		local
			new_capacity, old_count: INTEGER
		do
			old_count := count
			if new_count > old_count then
				if capacity = 0 then
					storage := storage.calloc(new_count)
					capacity := new_count
				elseif capacity < new_count then
					storage.clear(old_count, capacity - 1)
					from
						new_capacity := capacity * 2
					until
						new_capacity >= new_count
					loop
						new_capacity := new_capacity * 2
					end
					storage := storage.realloc(capacity, new_capacity)
					capacity := new_capacity
				else
					storage.clear(old_count, new_count - 1)
				end
			end
			upper := new_count - 1
		ensure
			count = new_count
			capacity >= old capacity
		end

feature {ANY} -- Implementation of deferred:
	is_empty: BOOLEAN is
		do
			Result := upper < 0
		end

	item (i: INTEGER): E_ is
		do
			Result := storage.item(i)
		end

	put (element: E_; i: INTEGER) is
		do
			storage.put(element, i)
		end

	add_first (element: like item) is
		do
			add_last(element)
			if upper = 0 then
			elseif upper = 1 then
				swap(0, 1)
			else
				move(0, upper - 1, 1)
				storage.put(element, 0)
			end
		end

	add_last (element: like item) is
		local
			new_capacity: INTEGER
		do
			if upper + 1 <= capacity - 1 then
				upper := upper + 1
			elseif capacity = 0 then
				storage := storage.calloc(2)
				capacity := 2
				upper := 0
			else
				new_capacity := capacity * 2
				storage := storage.realloc(capacity, new_capacity)
				capacity := new_capacity
				upper := upper + 1
			end
			storage.put(element, upper)
		end

	count: INTEGER is
		do
			Result := upper + 1
		end

	clear_count, clear_count_and_capacity is
		do
			upper := -1
		ensure then
			capacity = old capacity
		end

	copy (other: like Current) is
			-- Copy `other' onto Current.
		local
			other_upper, new_capacity: INTEGER
		do
			--*** Why is the end cleared? remove_last, remove_tail, remove_first does not clear anything
			other_upper := other.upper
			if other_upper >= 0 then
				new_capacity := other_upper + 1
				if capacity < new_capacity then
					storage := storage.calloc(new_capacity)
					capacity := new_capacity
				elseif new_capacity < capacity then
					storage.clear(new_capacity, capacity - 1)
				end
				storage.copy_from(other.storage, other_upper)
			elseif capacity > 0 then
				storage.clear_all(capacity - 1)
			end
			upper := other_upper
		end

	set_all_with (v: like item) is
		do
			storage.set_all_with(v, upper)
		end

	from_collection (model: TRAVERSABLE[like item]) is
		local
			i1, i2, up: INTEGER
		do
			from
				with_capacity(model.count)
				upper := model.count - 1
				i1 := 0
				i2 := model.lower
				up := model.upper
			until
				i2 > up
			loop
				storage.put(model.item(i2), i1)
				i1 := i1 + 1
				i2 := i2 + 1
			end
		end

	is_equal (other: like Current): BOOLEAN is
		do
			if Current = other then
				Result := True
			elseif upper = other.upper then
				Result := storage.fast_memcmp(other.storage, upper + 1)
			end
		end

	is_equal_map (other: like Current): BOOLEAN is
		do
			if Current = other then
				Result := True
			elseif upper = other.upper then
				Result := storage.memcmp(other.storage, upper + 1)
			end
		end

	all_default: BOOLEAN is
		do
			Result := storage.all_default(upper)
		end

	occurrences (element: like item): INTEGER is
		do
			Result := storage.occurrences(element, upper)
		end

	fast_occurrences (element: E_): INTEGER is
		do
			Result := storage.fast_occurrences(element, upper)
		end

	first_index_of (element: like item): INTEGER is
		do
			if upper >= 0 then
				Result := storage.first_index_of(element, upper)
			else
				check
					Result = 0
				end
			end
		end

	index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			if upper >= 0 then
				Result := storage.index_of(element, start_index, upper)
			else
				check
					Result = 0
				end
			end
		end

	reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			Result := storage.reverse_index_of(element, start_index)
		end

	fast_first_index_of (element: like item): INTEGER is
		do
			if upper >= 0 then
				Result := storage.fast_index_of(element, lower, upper)
			else
				check
					Result = 0
				end
			end
		end

	fast_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			if upper >= 0 then
				Result := storage.fast_index_of(element, start_index, upper)
			else
				check
					Result = 0
				end
			end
		end

	fast_reverse_index_of (element: like item; start_index: INTEGER): INTEGER is
		do
			Result := storage.fast_reverse_index_of(element, start_index)
		end

	subarray, slice (min, max: INTEGER): like Current is
		do
			create Result.make(max - min + 1)
			Result.storage.slice_copy(0, storage, min, max)
		end

	force (element: E_; index: INTEGER) is
		do
			if index <= upper then
				storage.put(element, index)
			elseif index = upper + 1 then
				add_last(element)
			else
				resize(index + 1)
				storage.put(element, index)
			end
		end

	remove_first is
		local
			void_storage: like storage
		do
			if upper = 0 then
				storage := void_storage
				capacity := 0
				upper := -1
			else
				storage.remove_first(upper)
				upper := upper - 1
			end
		ensure then
			lower = old lower
		end

	remove_head (n: INTEGER) is
		do
			storage.move(n, upper, -n)
			upper := upper - n
		end

	remove (index: INTEGER) is
		do
			storage.remove(index, upper)
			upper := upper - 1
		end

	new_iterator: ITERATOR[E_] is
		do
			create {ITERATOR_ON_TRAVERSABLE[E_]} Result.make(Current)
		end
	
feature {} -- Garbage collector tuning (very low-level):
	mark_native_arrays is
			-- For performance reasons, the unused area of `storage' is always left as it is when
			-- some elements are removed. No time is lost to clean the released area with a Void 
			-- or a 0 value. (Look for example the `remove_last' implementation.)
			-- Thus, the unused area of `storage' may contains references of actually unreachable 
			-- objects. The following `mark_native_arrays' actually replace the 
			-- default behavior (the call is automatic) in order to mark only reachable objects.
			--
			-- See also class GARBAGE_COLLECTOR_TUNING.
		local
			i: INTEGER
		do
			from
				i := upper
			until
				i < 0
			loop
				mark_item(storage, i)
				i := i - 1
			end
		end

feature {} -- Implement manifest generic creation (very low-level):
	manifest_make (needed_capacity: INTEGER) is
			-- Manifest creation of a FAST_ARRAY[E_].
		require
			needed_capacity > 0
		do
			make(needed_capacity)
		end

	manifest_put (index: INTEGER; element: like item) is
		do
			check
				index < capacity
			end
			put(element, index)
		end

end -- class FAST_ARRAY
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
