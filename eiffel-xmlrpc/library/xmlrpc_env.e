--			if env.fault_occurred then
--				print ("Fault occurred. Code: " + env.fault_code.out )
--				print ("                String: " + env.fault_string + "%N%N")
--				die_with_code (1)
--			end

class XMLRPC_ENV

inherit
	C_STRUCT redefine make, dispose end

insert
	XMLRPC_ENV_EXTERNALS

creation
	make

feature -- Size

	struct_size: INTEGER is
		external "C inline use <xmlrpc-c/base.h>"
		alias "sizeof (xmlrpc_env)"
		end

feature {} -- Creation

	make is
		do
			Precursor
			xmlrpc_env_init (handle)
		end

feature {} -- Destruction

	dispose is
		do
			xmlrpc_env_clean (handle)
			Precursor
		end

feature

	fault_occurred: BOOLEAN is
		do
			Result := xmlrpc_env_fault_occurred (handle).to_boolean
		end

	fault_code: INTEGER is
		do
			Result := xmlrpc_env_fault_code (handle)
		ensure
			is_valid_xmlrpc_error_type (Result)
		end

	fault_string: STRING is
		local
			res_ptr: POINTER
		do
			res_ptr := xmlrpc_env_fault_string (handle)
			if res_ptr.is_not_null then
				create Result.from_external (res_ptr)
			end
		end

end -- class XMLRPC_ENV
