class BACKTRACKING_SEQUENCE
	--
	-- A single node sequence.
	--

inherit
	ABSTRACT_BACKTRACKING_SEQUENCE
		rename pool as pool_of_sequence
		end

insert
	BACKTRACKING_GLOBALS

feature {ABSTRACT_BACKTRACKING}
	next: BACKTRACKING_NODE
			-- next node

	set_next (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			next := value
		ensure
			definition: next = value
			next_not_void: next /= Void
		end

	next_sequence (explorer: BACKTRACKING) is
		do
			-- Tell to evaluate 'next' now.
			explorer.set_current_node(next)
			-- Sequence is off, remove it.
			explorer.pop_sequence
		end

end -- class BACKTRACKING_SEQUENCE
