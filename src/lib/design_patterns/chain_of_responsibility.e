deferred class CHAIN_OF_RESPONSIBILITY
	--
	-- The ''Chain Of Responsibility'' Design Pattern reified. Such a chain is made of handlers you can add or
	-- remove at your leisure.
	--
	-- The Chain itself is a ''Command'' (see that Design Pattern).  Executing that command looks for a handler
	-- that can handle a request, and let it handle that request.
	--
	-- How you do implement the query is up to you. The handlers are given `Current' i.e. the Chain itself, and
	-- CHAIN_HANDLER is a generic class so you can implement your own protocol.
	--

inherit
	COMMAND

feature {ANY}
	add (c: CHAIN_HANDLER[like Current]) is
			-- Add a handler to the Chain.
		do
			chain.add_last(c)
		end

	remove (c: CHAIN_HANDLER[like Current]) is
			-- Remove a handler from the Chain.
		require
			has(c)
		local
			i: INTEGER
		do
			i := chain.first_index_of(c)
			chain.remove(i)
		end

	has (c: CHAIN_HANDLER[like Current]): BOOLEAN is
			-- Does the handler belong to the chain?
		do
			Result := chain.has(c)
		end

feature {ANY}
	execute is
			-- Find a suitable handler to handle a request.
		local
			i: INTEGER; ok: BOOLEAN
		do
			from
				i := chain.lower
			until
				ok or else i > chain.upper
			loop
				if chain.item(i).can_handle(Current) then
					chain.item(i).handle(Current)
					ok := True
				end
				i := i + 1
			end
		end

feature {}
	chain: FAST_ARRAY[CHAIN_HANDLER[like Current]]

invariant
	chain /= Void

end -- class CHAIN_OF_RESPONSIBILITY
