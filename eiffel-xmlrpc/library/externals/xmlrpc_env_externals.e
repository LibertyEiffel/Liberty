deferred class XMLRPC_ENV_EXTERNALS

		-- typedef struct _xmlrpc_env {
		--     int    fault_occurred;
		--     int    fault_code;
		--     char * fault_string;
		-- } xmlrpc_env;

insert
	XMLRPC_ERROR_TYPE

feature {} -- Externals

	xmlrpc_env_init (an_env_ptr: POINTER) is
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

	xmlrpc_env_clean (an_env_ptr: POINTER) is
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/base.h>"
		end

	xmlrpc_env_fault_occurred (an_env_ptr: POINTER): INTEGER is
		require
			an_env_ptr.is_not_null
		external "C struct xmlrpc_env get fault_occurred use <xmlrpc-c/base.h>"
		end

	xmlrpc_env_fault_code (an_env_ptr: POINTER): INTEGER is
		require
			an_env_ptr.is_not_null
		external "C struct xmlrpc_env get fault_code use <xmlrpc-c/base.h>"
		ensure
			is_valid_xmlrpc_error_type (Result)
		end

	xmlrpc_env_fault_string (an_env_ptr: POINTER): POINTER is
		require
			an_env_ptr.is_not_null
		external "C struct xmlrpc_env get fault_string use <xmlrpc-c/base.h>"
		end

end -- class XMLRPC_ENV_EXTERNALS
