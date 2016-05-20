deferred class XMLRPC_SERVER_INFO_EXTERNALS

inherit ANY undefine is_equal, copy end



feature {} -- Externals

	xmlrpc_server_info_new (an_env_ptr, an_url: POINTER): POINTER is
			-- xmlrpc_server_info *
			-- xmlrpc_server_info_new(xmlrpc_env * const envP,
			--                        const char * const serverUrl);
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_server_info_free (info: POINTER) is
			-- void
			-- xmlrpc_server_info_free(xmlrpc_server_info * const serverInfoP);
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_server_info_copy (an_env_ptr, info: POINTER): POINTER is
			-- xmlrpc_server_info *
			-- xmlrpc_server_info_copy(xmlrpc_env *         const envP,
			--                         xmlrpc_server_info * const aserverInfoP);
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/client.h>"
		end

	xmlrpc_server_info_set_basic_auth (an_env_ptr, info, username, password: POINTER) is
			-- void
			-- xmlrpc_server_info_set_basic_auth(xmlrpc_env *         const envP,
			--                                   xmlrpc_server_info * const serverP,
			--                                   const char *         const username,
			--                                   const char *         const password);
		require
			an_env_ptr.is_not_null
		external "C use <xmlrpc-c/client.h>"
		end

end -- class XMLRPC_SERVER_INFO_EXTERNALS
