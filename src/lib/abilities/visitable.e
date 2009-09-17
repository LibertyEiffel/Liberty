deferred class VISITABLE
	--
	-- An object that can be visited by a VISITOR.
	--

feature {ANY}
	accept (visitor: VISITOR) is
			-- Accept to be visited by the `visitor'.
		require
			visitor /= Void
		deferred
		end

end -- class VISITABLE
