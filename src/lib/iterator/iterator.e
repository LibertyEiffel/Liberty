deferred class ITERATOR[E_]
	--
	-- The iterator pattern at work: this abstract class defines a
	-- traversal interface for any kind of aggregates data structure.
	-- An iterator can be used when you need to do something on all
	-- elements in the data structure, but there is no order concept.
	--
	-- To create a new iterator, use `new_iterator' in the
	-- corresponding data structure.
	--
	-- See examples in directory SmartEiffel/tutorial/iterator.

feature {ANY}
	start is
			-- Positions the iterator to the first object in the
			-- aggregate to be traversed.
		deferred
		end

	is_off: BOOLEAN is
			-- Returns True when there are no more objects in the
			-- sequence.
		deferred
		end

	item: E_ is
			-- Returns the object at the current position in the
			-- sequence.
		require
			not is_off
		deferred
		end

	next is
			-- Positions the iterator to the next object in the
			-- sequence.
		require
			not is_off
		deferred
		end

end -- class ITERATOR
