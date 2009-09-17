deferred class ARRAYED_COLLECTION[E_]
	--
	-- Common root for ARRAY, FAST_ARRAY and RING_ARRAY.
	--

insert
	COLLECTION[E_]

feature {ARRAYED_COLLECTION}
	storage: NATIVE_ARRAY[E_]
			-- Internal access to storage location.

feature {ANY}
	capacity: INTEGER
			-- Internal storage capacity in number of item.

	upper: INTEGER
			-- Upper index bound.

	subarray (min, max: INTEGER): like Current is
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
	first: like item is
		do
			Result := storage.item(0)
		end

	last: like item is
		do
			Result := item(upper)
		end

	add (element: like item; index: INTEGER) is
		do
			if index = upper + 1 then
				add_last(element)
			else
				add_last(element)
				move(index, upper - 1, 1)
				put(element, index)
			end
		end

	remove_last is
		do
			upper := upper - 1
		end

	remove_tail (n: INTEGER) is
		do
			upper := upper - n
		end

	replace_all (old_value, new_value: like item) is
		do
			storage.replace_all(old_value, new_value, count - 1)
		end

	fast_replace_all (old_value, new_value: like item) is
		do
			storage.fast_replace_all(old_value, new_value, count - 1)
		end

	reverse is
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
	to_external: POINTER is
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
	set_upper (new_upper: like upper) is
		do
			upper := new_upper
		end

invariant
	capacity >= upper - lower + 1
	capacity > 0 implies storage.is_not_null

end -- class ARRAYED_COLLECTION
