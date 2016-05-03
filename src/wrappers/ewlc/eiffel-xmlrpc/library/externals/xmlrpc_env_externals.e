note
	description: "External calls for XMLRPC environment"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006 Soluciones Informaticas Libres S.A. (Except)
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$Revision:$"

deferred class XMLRPC_ENV_EXTERNALS

inherit ANY undefine is_equal, copy end



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
