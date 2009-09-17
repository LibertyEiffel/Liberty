deferred class RECYCLABLE
	--
	-- Used for gc-aware memory management.
	--
	-- See also RECYCLING_POOL
	--

feature {RECYCLING_POOL}
	recycle is
			-- Do whatever needs to be done to free resources or recycle other objects when recycling this one
		deferred
		end

end -- class RECYCLABLE
