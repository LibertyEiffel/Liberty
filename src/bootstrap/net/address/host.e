class HOST
	-- The host is represented by a name. The name will be resolved by a DNS.

inherit
	ADDRESS
		redefine out
		end

insert
	SOCKET_PLUG_IN
		undefine out
		end

creation {ANY}
	make

feature {ANY}
	hostname: STRING
			-- The name of the host

	ip: IP_ADDRESS is
		do
			if resolved = Void and then error = Void then
				resolve
			end
			Result := resolved
		end

	hash_code: INTEGER is
		do
			Result := ip.hash_code
		end

	out: STRING is
		do
			Result := hostname + " (" + ip.out + ")"
		end

feature {}
	resolved: IP_ADDRESS

	resolve is
			-- Resolve the host address by looking for the IP address (uses DNS resolution)
		require
			resolved = Void
		local
			a, b, c, d, ipaddr: INTEGER
		do
			ipaddr := net_hostname(hostname.to_external)
			a := ipaddr |>>> 24
			b := ipaddr |>>> 16 & 0x000000ff
			c := ipaddr |>>> 8 & 0x000000ff
			d := ipaddr & 0x000000ff
			error := last_error
			if error = Void then
				create resolved.make(a, b, c, d)
			end
		ensure
			(error = Void) /= (resolved = Void)
		end

feature {}
	make (a_hostname: STRING) is
		require
			a_hostname /= Void
		do
			hostname := a_hostname
		end

end -- class HOST
