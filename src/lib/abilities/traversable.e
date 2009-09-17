deferred class TRAVERSABLE[E_]
	-- A `TRAVERSABLE[E_]' is a finite readable sequence of objects of type E_.
	-- For instance, `COLLECTION's and `STRING's are `TRAVERSABLE'.
	--
	-- A good performance should always be obtained by sequentially acessing a `TRAVERSABLE' with increasing
	-- indexes (from `lower' to `upper'), as demonstrated in the following code snippet :
	--
	--  from
	--     i := a_traversable.lower
	--  until
	--     i > a_traversable.upper
	--  loop
	--     do_something_with(a_traversable.item(i))
	--     i := i + 1
	--  end
	--
	-- Other accessing methods (including random access and sequential access from `upper' to `lower') may or
	-- may not lead to acceptable performance, depending on the particular implementation of `TRAVERSABLE'.

feature {ANY} -- Indexing:
	lower: INTEGER is
			-- Minimum index.
			--
			-- See also `upper', `valid_index', `item'.
		deferred
		end

	upper: INTEGER is
			-- Maximum index.
			--
			-- See also `lower', `valid_index', `item'.
		deferred
		end

	valid_index (i: INTEGER): BOOLEAN is
			-- True when `i' is valid (i.e., inside actual bounds).
			--
			-- See also `lower', `upper', `item'.
		do
			Result := lower <= i and then i <= upper
		ensure
			definition: Result = (lower <= i and i <= upper)
		end

feature {ANY} -- Counting:
	count: INTEGER is
			-- Number of available indices.
			--
			-- See also `is_empty', `lower', `upper'.
		deferred
		ensure
			definition: Result = upper - lower + 1
		end

	is_empty: BOOLEAN is
			-- Is collection empty ?
			--
			-- See also `count'.
		deferred
		ensure
			definition: Result = (count = 0)
		end

feature {ANY} -- Accessing:
	item (i: INTEGER): E_ is
			-- Item at the corresponding index `i'.
			--
			-- See also `lower', `upper', `valid_index'.
		require
			valid_index(i)
		deferred
		end

	first: like item is
			-- The very `first' item.
			--
			-- See also `last', `item'.
		require
			not is_empty
		deferred
		ensure
			definition: Result = item(lower)
		end

	last: like item is
			-- The `last' item.
			--
			-- See also `first', `item'.
		require
			not is_empty
		deferred
		ensure
			definition: Result = item(upper)
		end

feature {ANY} -- Agent-based features:
	do_all (action: ROUTINE[TUPLE[E_]]) is
			-- Apply `action' to every item of `Current'.
			--
			-- See also `for_all', `exists'.
		require
			action /= Void
		local
			i: INTEGER
		do
			from
				i := lower
			until
				i > upper
			loop
				action.call([item(i)])
				i := i + 1
			end
		end

	for_all (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
			-- Do all items satisfy `test'?
			--
			-- See also `do_all', `exists'.
		require
			test /= Void
		local
			i: INTEGER
		do
			from
				Result := True
				i := lower
			until
				not Result or else i > upper
			loop
				Result := test.item([item(i)])
				i := i + 1
			end
		end

	exists (test: PREDICATE[TUPLE[E_]]): BOOLEAN is
			-- Does at least one item satisfy `test'?
			--
			-- See also `do_all', `for_all'.
		require
			test /= Void
		local
			i: INTEGER
		do
			from
				i := lower
			until
				Result or else i > upper
			loop
				Result := test.item([item(i)])
				i := i + 1
			end
		end

feature {ANY} -- Other features:
	new_iterator: ITERATOR[E_] is
		deferred
		ensure
			Result /= Void
		end

	frozen get_new_iterator: like new_iterator is
		obsolete "Please use new_iterator instead. This SmartEiffel historic feature is badly named."
		do
			Result := new_iterator
		end

end -- class TRAVERSABLE
