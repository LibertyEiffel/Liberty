expanded class STRING_RECYCLING_ITEM
	--
	-- Used by STRING_RECYCLING_POOL to track STRING capacities and to allow the use of a sorted array with
	-- "holes" (since STRING's are WEAK_REFERENCE'ed)
	--

insert
	ANY
		redefine
			is_equal
		end

feature {ANY}
	is_equal (other: like Current): BOOLEAN is
		do
			Result := capacity = other.capacity
		end

feature {STRING_RECYCLING_POOL, STRING_RECYCLING_ITEM, STRING_RECYCLING_ITEM_SORTER}
	capacity: INTEGER

	item: STRING is
			-- The STRING item. May become Void if the GC decides so.
		do
			if item_memory /= Void then
				Result := item_memory.item
			end
		end

	set_item (a_item: like item) is
			-- Stores the STRING as being reusable. The GC may remove it afterwards.
		require
			a_item = Void or else a_item.is_empty
		do
			if a_item = Void then
				if item_memory /= Void then
					item_memory.set_item(Void)
				end
			else
				capacity := a_item.capacity
				if item_memory = Void then
					create item_memory.set_item(a_item)
				else
					item_memory.set_item(a_item)
				end
			end
		ensure
			item = a_item
		end

	set_capacity (a_capacity: like capacity) is
			-- Sets the capacity. Useful for array sorting and element comparison. Should not be used when a
			-- STRING is stored.
		require
			a_capacity >= 0
			item = Void
		do
			capacity := a_capacity
		ensure
			capacity = a_capacity
		end

feature {}
	item_memory: WEAK_REFERENCE[STRING]
			-- Holds a recyclable STRING

invariant
	item /= Void implies item.capacity = capacity
	capacity >= 0

end -- class STRING_RECYCLING_ITEM
