class QUEUE[E_]
	--
	-- A Queue of elements of type `E_'.
	--

insert
	RING_ARRAY[E_]
		rename add as collection_add,
			add_last as add,
			remove as collection_remove,
			remove_first as remove,
			make as collection_make,
			with_capacity as collection_with_capacity
		export {ANY} is_empty, add, remove, first, count;
			{QUEUE} all
		redefine
			new_iterator
		end
	ANY
		-- To get reasonable default exports
		undefine fill_tagged_out_memory, copy, is_equal
		end

creation {ANY}
	make, with_capacity

creation {RING_ARRAY}
	collection_make

feature {}
	make is
			-- Create an empty array. Also consider `with_capacity',
			-- since growing a full queue is rather expensive.
		do
			with_capacity(16)
		ensure
			is_empty
		end

	with_capacity (needed_capacity: INTEGER) is
			-- Create an empty array with capacity initialized
			-- at least to `needed_capacity'
		require
			needed_capacity >= 0
		do
			collection_with_capacity(needed_capacity, 1)
		end

	new_iterator: ITERATOR[E_] is
		do
			check
				False
			end
		end

end -- class QUEUE
