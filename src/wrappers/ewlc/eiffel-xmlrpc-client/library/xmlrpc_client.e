class XMLRPC_CLIENT

inherit
	C_STRUCT
		redefine dispose
		end

insert
	XMLRPC_CLIENT_EXTERNALS

create {ANY}
	make

feature {} -- Representation

	env: XMLRPC_ENV

feature {} -- Creation

	setup
		require
			is_valid
		once
			xmlrpc_client_setup_global_const (env.handle)
		end

	make (flags: INTEGER; name, version: STRING;
	      client_parms: XMLRPC_CLIENT_PARMS)
			-- Current implementation ignores `client_parms' and uses a
			-- null pointer instead.
			
		require
			name /= Void
			version /= Void
			--client_parms /= Void
		local
			res_ptr: POINTER
		do
			create env.make
			setup
			if is_valid then
				xmlrpc_client_create (env.handle, flags, name.to_external, version.to_external,
				                      default_pointer, 0, $res_ptr)
				check res_ptr.is_not_null end
				from_external_pointer (res_ptr)
			else
				print (env.fault_string + "%N%N")
			end
		end

feature {} -- Destruction

	teardown
		once
			xmlrpc_client_teardown_global_const
		end

	dispose
		do
			teardown
			xmlrpc_client_destroy (handle)
			handle:= default_pointer
		end

feature {ANY} -- Representation

	is_valid: BOOLEAN
		require
			env /= Void
			env.handle.is_not_null
		do
			Result := not env.fault_occurred
		end

feature {ANY} -- Operations

	call (server_info: XMLRPC_SERVER_INFO; method_name: STRING;
	      params: XMLRPC_VALUE_ARRAY): XMLRPC_VALUE
		require
			server_info /= Void
			method_name /= Void
			params /= Void
		local
			res_ptr: POINTER
		do
			xmlrpc_client_call2 (env.handle, handle, server_info.handle,
			                     method_name.to_external, params.handle, $res_ptr)
			create Result.from_external_pointer (res_ptr) -- XXX ver esto
		end

	default_transport: STRING
		do
			create Result.from_external (xmlrpc_client_get_default_transport (handle))
		end

invariant

	env /= Void

end -- class XMLRPC_CLIENT
