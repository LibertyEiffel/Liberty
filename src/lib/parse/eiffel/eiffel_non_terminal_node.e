deferred class EIFFEL_NON_TERMINAL_NODE

inherit
	EIFFEL_NODE

feature {ANY}
	name_at (index: INTEGER): STRING is
		require
			valid_index(index)
		deferred
		end

	node_at (index: INTEGER): EIFFEL_NODE is
		require
			valid_index(index)
		deferred
		end

	valid_index (index: INTEGER): BOOLEAN is
		deferred
		ensure
			definition: Result = (index >= lower and then index <= upper)
		end

	lower: INTEGER is
		deferred
		ensure
			Result >= 0
		end

	upper: INTEGER is
		deferred
		ensure
			Result >= upper - 1
		end

	count: INTEGER is
		deferred
		ensure
			definition: Result = upper - lower + 1
		end

	is_empty: BOOLEAN is
		deferred
		ensure
			definition: Result = (count = 0)
		end

feature {EIFFEL_GRAMMAR}
	set (index: INTEGER; node: EIFFEL_NODE) is
		require
			valid_index(index)
		deferred
		ensure
			node_at(index) = node
		end

end -- class EIFFEL_NON_TERMINAL_NODE
