deferred class LINKED_COLLECTION[E_]
	--
	-- Common root of LINKED_LIST and TWO_WAY_LINKED_LIST.
	--

insert
	COLLECTION[E_]

feature {ANY}
	lower: INTEGER is 1
			-- Lower index bound is frozen.

	upper: INTEGER
			-- Memorized upper index bound.

	make is
			-- Make an empty list
		deferred
		end

	remove_head (n: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				remove_first
				i := i - 1
			end
		end

	remove_tail (n: INTEGER) is
		local
			i: INTEGER
		do
			from
				i := n
			until
				i = 0
			loop
				remove_last
				i := i - 1
			end
		end

	first_index_of (element: like item): INTEGER is
		do
			Result := index_of(element, lower)
		end
			
	fast_first_index_of (element: like item): INTEGER is
		do
			Result := fast_index_of(element, lower)
		end
			
feature {} -- Implement manifest generic creation:
	manifest_make (needed_capacity: INTEGER) is
			-- Manifest creation of a list of items of type E_.
		do
			make
		end

	manifest_put (index: INTEGER; element: like item) is
		do
			add_last(element)
		end

end -- class LINKED_COLLECTION
