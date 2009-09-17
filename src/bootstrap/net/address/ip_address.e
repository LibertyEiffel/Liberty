class IP_ADDRESS
	-- The host represented by its address. Currently only IPv4 is supported.

inherit
	ADDRESS
		redefine out
		end

creation {ANY}
	make

feature {ANY}
	a, b, c, d: INTEGER
			-- The four parts of an IP address.
			-- Example: 192.168.0.1 will be represented:
			--   a = 192
			--   b = 168
			--   c = 0
			--   d = 1

	hash_code: INTEGER is
		do
			Result := a & 0x7f |<< 24 | (b |<< 16) | (c |<< 8) | d
		end

	ip: IP_ADDRESS is
		do
			Result := Current
		end

	out: STRING is
		do
			Result := a.out + "." + b.out + "." + c.out + "." + d.out
		end

feature {}
	make (ip_a, ip_b, ip_c, ip_d: INTEGER) is
		require
			ip_a.in_range(0, 255)
			ip_b.in_range(0, 255)
			ip_c.in_range(0, 255)
			ip_d.in_range(0, 255)
		do
			a := ip_a
			b := ip_b
			c := ip_c
			d := ip_d
		end

end -- class IP_ADDRESS
