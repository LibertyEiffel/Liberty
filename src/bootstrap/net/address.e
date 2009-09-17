deferred class ADDRESS
	-- The address of a host.

inherit
	HASHABLE

insert
	ANY

feature {ANY}
	ip: IP_ADDRESS is
			-- The resolved address
		deferred
		ensure
			conservative: Result = ip
		end

	error: STRING
			-- If there was an error

end -- class ADDRESS
