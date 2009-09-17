deferred class ABSTRACT_BACKTRACKING_SEQUENCE
	--
	-- Abstract realisation of a sequence iterator
	-- for the ABSTRACT_BACKTRACKING
	--
	-- The ABSTRACT_BACKTRACKING uses the fields
	-- continuation to record the continuation path
	-- and calls the feature 'next_sequence' to let
	-- the current object choose how to continue the
	-- exploration.
	--

inherit
	ABSTRACT_BACKTRACKING_POOLABLE
		rename pool_link as previous,
			set_pool_link as set_previous
		export {ABSTRACT_BACKTRACKING_POOL, ABSTRACT_BACKTRACKING} set_previous
		redefine previous
		end

feature {ABSTRACT_BACKTRACKING_POOL, ABSTRACT_BACKTRACKING}
	previous: ABSTRACT_BACKTRACKING_SEQUENCE
			-- For the linked stack of sequences.
			-- Managed by ABSTRACT_BACKTRACKING.

feature {ABSTRACT_BACKTRACKING}
	continuation: ABSTRACT_BACKTRACKING_SEQUENCE
			-- The sequence to continue after a success in
			-- exploration of the current sequence.
			-- Managed by ABSTRACT_BACKTRACKING.

	set_continuation (value: like continuation) is
		do
			continuation := value
		ensure
			definition: continuation = value
		end

	next_sequence (explorer: ABSTRACT_BACKTRACKING) is
			-- Called by ABSTRACT_BACKTRACKING to let
			-- the current object switch to the next state
			-- to explore.
			-- Two actions must be performed by that feature:
			--   - make iteration actions and then call
			--      'pop_sequence' if this is the last state
			--      to be explored.
			--   - select the state to be evaluated or
			--      call 'continue' or call 'backtrack'.
		require
			is_on_top: Current = explorer.top_sequence
		deferred
		end

end -- class ABSTRACT_BACKTRACKING_SEQUENCE
