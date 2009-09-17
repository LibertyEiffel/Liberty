class LOCALHOST
	--
	-- The very machine on which the program runs
	--
	-- The name resolution part was originally written by Serge Romanchenko <se@sir.nensi.net>
	--

inherit
	HOST
		rename
			make as make_host
		export
			{} make_host;
			{ANY} last_error, last_error_number
		end

creation {ANY}
	make

feature {ANY}
	fqdn: STRING is
			-- Fully Qualified Domain Name
		do
			Result := once ""
			Result.copy(host_name)
			Result.extend('.')
			Result.append(domain_name)
		end

	host_name: STRING is
			-- Short host name
		local
			e: POINTER
		do
			e := net_gethostname
			if e /= default_pointer then
				Result := once ""
				Result.from_external_copy(e)
			end
		end

	domain_name: STRING is
			-- Full domain name (without the `host_name`)
		local
			e: POINTER
		do
			e := net_getdomainname
			if e /= default_pointer then
				Result := once ""
				Result.from_external_copy(e)
			end
		end

	set_host_name (a_host_name: STRING) is
		require
			a_host_name /= Void and then not a_host_name.is_empty
		do
			net_sethostname(a_host_name.to_external, a_host_name.count)
		end

	set_domain_name (a_domain_name: STRING) is
		require
			a_domain_name /= Void and then not a_domain_name.is_empty
		do
			net_setdomainname(a_domain_name.to_external, a_domain_name.count)
		end

feature {}
	make is
		do
			make_host(once "localhost")
		end

end -- class LOCALHOST
