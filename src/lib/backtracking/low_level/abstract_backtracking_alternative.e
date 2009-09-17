deferred class ABSTRACT_BACKTRACKING_ALTERNATIVE
	--
	-- Abstract realisation of an alternative iterator
	-- for the ABSTRACT_BACKTRACKING
	--
	-- The ABSTRACT_BACKTRACKING uses the fields
	-- continuation and top_sequence to record its
	-- exploration state and calls the feature
	-- 'next_alternative' to let the current object
	-- choose how to continue the exploration.
	--

inherit
	ABSTRACT_BACKTRACKING_POOLABLE
		rename pool_link as previous,
			set_pool_link as set_previous
		export {ABSTRACT_BACKTRACKING_POOL, ABSTRACT_BACKTRACKING} set_previous
		redefine previous
		end

feature {ABSTRACT_BACKTRACKING_POOL, ABSTRACT_BACKTRACKING}
	previous: ABSTRACT_BACKTRACKING_ALTERNATIVE
			-- For the linked stack of alternatives.
			-- Managed by ABSTRACT_BACKTRACKING.

feature {ABSTRACT_BACKTRACKING}
	continuation: ABSTRACT_BACKTRACKING_SEQUENCE
			-- The sequence to continue after a success in
			-- exploration of the current alternative.
			-- Managed by ABSTRACT_BACKTRACKING.

	set_continuation (value: like continuation) is
		do
			continuation := value
		ensure
			definition: continuation = value
		end

	top_sequence: like continuation
			-- Record of the top of the stack of sequence
			-- to restore the state of the exploration after
			-- that all alternatives were explored.
			-- Managed by ABSTRACT_BACKTRACKING.

	set_top_sequence (value: like top_sequence) is
		do
			top_sequence := value
		ensure
			definition: top_sequence = value
		end

	next_alternative (explorer: ABSTRACT_BACKTRACKING) is
			-- Called by ABSTRACT_BACKTRACKING to let
			-- the current object switch to the next alternative
			-- to explore.
			-- Two actions must be performed by that feature:
			--   - make iteration actions and then call
			--      'continue_alternative' if iteration is not ended
			--      and that current object must be called again to
			--      switch to an other alternative or else call
			--      'pop_alternative' if this is the last alternative
			--      to be explored.
			--   - select the state to be evaluated or
			--      call 'continue' or call 'backtrack'.
		require
			is_on_top: Current = explorer.top_alternative
		deferred
		end

end -- class ABSTRACT_BACKTRACKING_ALTERNATIVE
