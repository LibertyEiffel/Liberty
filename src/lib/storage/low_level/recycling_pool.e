class RECYCLING_POOL[R_ -> RECYCLABLE]
	--
	-- RECYCLABLE objects container.
	--
	-- Useful to implement recycling support in libraries.
	--
	-- Has no sense for expanded types (it will not even compile).
	--
	-- This class is designed to work with and without the garbage collector. It takes advantage of the GC if
	-- it is used, but it also minimises the memory footprint when the GC is ''not'' used.
	--
	-- See also STRING_RECYCLING_POOL, especially tuned for STRING usage.
	--

insert
	STACK[R_]
		rename
			item as collection_item
		export
			{RECYCLING_POOL} lower, upper, storage, count;
			{ANY} is_empty;
			{} all
		redefine
			mark_native_arrays
		end
	ANY
		undefine
			fill_tagged_out_memory, copy, is_equal
		end

creation {ANY}
	make

creation {RECYCLING_POOL}
	collection_make

feature {ANY}
	item: R_ is
			--
			-- Returns a recycled object, if there is one to be obtained. Returns Void otherwise.
			--
			-- See also `recycle'
			--
		require
			not is_empty
		do
			Result := top
			pop
		end

  recycle (an_item: like item) is
			--
			-- Stores the object as being reuseable. Automatically calls the "recycle" feature of the object.
			--
			-- Two notes:
			--
			-- * You should not directly reuse the object after it is recycled; call `item' instead to obtain a
			-- fresh reference. Using it directly will lead to classic problems of double referencing. In a
			-- nutshell, '''be sure not to hold any reference to a recycled object'''.
			--
			-- * If the GC is used it may free some recycled objects so using a RECYCLING_POOL does not interfere
			-- with memory conservation.
			--
			-- See also `item'
			--
		require
			an_item /= Void
		do
			an_item.recycle
			push(an_item)
		end

feature {}
	mark_native_arrays is
		do
			clear_count
		end

end -- class RECYCLING_POOL
