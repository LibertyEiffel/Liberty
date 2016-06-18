deferred class XMLRPC_CLIENT_EXTERNALS

inherit ANY undefine is_equal, copy end



feature {} -- Externals

	xmlrpc_client_create (an_env_ptr: POINTER; flags: INTEGER;
	                      name, version, client_parms: POINTER;
	                      parm_size: INTEGER; client: POINTER)
			-- void
			-- xmlrpc_client_create(xmlrpc_env *                const envP,
			--                      int                         const flags,
			--                      char *                      const appname,
			--                      char *                      const appversion,
			--                      struct xmlrpc_clientparms * const clientparmsP,
			--                      unsigned int                const parmSize,
			--                      xmlrpc_client **            const clientPP);
		require
			an_env_ptr.is_not_null
			name.is_not_null
			version.is_not_null
			parm_size >= 0
			client.is_not_null
		external "C use <xmlrpc-c/client.h>"
		ensure
			client.is_not_null
		end

	xmlrpc_client_destroy (client: POINTER)
			-- void
			-- xmlrpc_client_destroy(xmlrpc_client * const clientP);
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_client_call2 (an_env_ptr, client, server_info,
	                     method_name, params, res_ptr: POINTER)
			-- void
			-- xmlrpc_client_call2(xmlrpc_env *               const envP,
			--                     struct xmlrpc_client *     const clientP,
			--                     const xmlrpc_server_info * const serverInfoP,
			--                     const char *               const methodName,
			--                     xmlrpc_value *             const paramArrayP,
			--                     xmlrpc_value **            const resultPP);
		require
			an_env_ptr.is_not_null
			client.is_not_null
			server_info.is_not_null
			method_name.is_not_null
			--params.is_not_null ??
			res_ptr.is_not_null
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_client_setup_global_const (an_env_ptr: POINTER)
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_client_teardown_global_const
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_client_get_default_transport (an_env_ptr: POINTER): POINTER
			-- const char *
			-- xmlrpc_client_get_default_transport (xmlrpc_env * const envP);
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/client.h>"
		end

end -- class XMLRPC_CLIENT_EXTERNALS
