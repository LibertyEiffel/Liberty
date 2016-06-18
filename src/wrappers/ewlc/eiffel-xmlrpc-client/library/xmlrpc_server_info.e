class XMLRPC_SERVER_INFO

inherit
	C_STRUCT
		redefine dispose
		end

insert
	XMLRPC_SERVER_INFO_EXTERNALS

create {ANY}
	from_url, from_server_info, make

feature {ANY} -- Size

	struct_size: INTEGER
		external "C inline use <xmlrpc-c/client.h>"
		alias "sizeof (xmlrpc_server_info)"
		end

feature {ANY} -- Representation

	url: STRING

	is_valid: BOOLEAN
		require
			env /= Void
			env.handle.is_not_null
		do
			Result := not env.fault_occurred
		end

feature {} -- Representation

	env: XMLRPC_ENV

feature {} -- Creation

	make,
	from_url (an_url: STRING)
		require
			an_url.substring (1, 7).is_equal ("http://")
		local
			res_ptr: POINTER
		do
			create env.make
			if is_valid then
				res_ptr := xmlrpc_server_info_new (env.handle, an_url.to_external)
				if is_valid then
					check res_ptr.is_not_null end
					from_external_pointer (res_ptr)
					url := an_url
				end
			end
		end

	from_server_info (other: like Current)
		require
			other /= Void
			other.handle.is_not_null
		local
			res_ptr: POINTER
		do
			res_ptr := xmlrpc_server_info_copy (env.handle, other.handle)
			if is_valid then
				check res_ptr.is_not_null end
				from_external_pointer (res_ptr)
			end
		end

feature {} -- Destruction

	dispose
		do
			xmlrpc_server_info_free (handle)
			handle:= default_pointer
		end

feature {ANY} -- Operations

	set_basic_auth (username, password: STRING)
		do
			xmlrpc_server_info_set_basic_auth (env.handle, handle,
			                                   username.to_external, password.to_external)
		end

invariant

	env /= Void

end -- class XMLRPC_SERVER_INFO
