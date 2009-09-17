deferred class CHAIN_HANDLER[C_ -> CHAIN_OF_RESPONSIBILITY]
	--
	-- Part of a chain of responsibility. It must tell if it is able to handle a request, and then handle it.
	--

feature {CHAIN_OF_RESPONSIBILITY}
	can_handle (chain: C_): BOOLEAN is
			-- True if the handler can indeed handle a request from the given chain of responsibility.
		require
			chain /= Void
		deferred
		end

	handle (chain: C_) is
			-- Handle a request from the given chain of responsibility.
		require
			chain /= Void
			can_handle(chain)
		deferred
		end

end -- class CHAIN_HANDLER
