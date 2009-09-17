deferred class ABSTRACT_BACKTRACKING_POOLABLE
	--
	-- Alternatives and sequences MUST be managed in a pool.
	-- The ability to be in a pool is declared in that class.
	--

feature {ANY}
	release is
			-- Called by ABSTRACT_BACKTRACKING to release
			-- current instance to the pool.
		require
			pool /= Void
		do
			pool.release_instance(Current)
		end

	get_twin: like Current is
			-- Return a twin of current from the pool
		require
			pool /= Void
		do
			Result := pool.get_instance
			Result.copy(Current)
		ensure
			Result.is_equal(Current)
		end

	pool: ABSTRACT_BACKTRACKING_POOL[like Current] is
			-- The pool that will record Current
		deferred
		end

feature {ABSTRACT_BACKTRACKING_POOL}
	pool_link: ABSTRACT_BACKTRACKING_POOLABLE
			-- Internal link used by the pool
			-- to chain its poolable items.
			-- Technical note: to give more freedom for
			-- further usages of 'pool_link' it is not
			-- defined with type anchorage.

	set_pool_link (other: like pool_link) is
			-- Set 'pool_link' to 'other'
		do
			pool_link := other
		ensure
			definition: pool_link = other
		end

end -- class ABSTRACT_BACKTRACKING_POOLABLE
