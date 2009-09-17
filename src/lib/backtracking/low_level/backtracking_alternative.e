class BACKTRACKING_ALTERNATIVE
	--
	-- A single node alternative.
	--

inherit
	ABSTRACT_BACKTRACKING_ALTERNATIVE
		rename pool as pool_of_alternative
		end

insert
	BACKTRACKING_GLOBALS

feature {BACKTRACKING}
	next: BACKTRACKING_NODE
			-- next alternate node

	set_next (value: BACKTRACKING_NODE) is
		require
			value_not_void: value /= Void
		do
			next := value
		ensure
			definition: next = value
		end

feature {ABSTRACT_BACKTRACKING}
	next_alternative (explorer: BACKTRACKING) is
		do
			-- Tell to evaluate 'next' now.
			explorer.set_current_node(next)
			-- Alternative is off, remove it.
			explorer.pop_alternative
		end

end -- class BACKTRACKING_ALTERNATIVE
