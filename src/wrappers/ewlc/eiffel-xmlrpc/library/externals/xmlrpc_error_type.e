note
	description: "XMLRPC error type"
	copyright: "[
					Author: Natalia B. Bidart
					Copyright (C) 2006-2018: Soluciones Informaticas Libres S.A. (Except)
					
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

deferred class XMLRPC_ERROR_TYPE

inherit ANY undefine is_equal, copy end



		-- #define XMLRPC_INTERNAL_ERROR               (-500)
		-- #define XMLRPC_TYPE_ERROR                   (-501)
		-- #define XMLRPC_INDEX_ERROR                  (-502)
		-- #define XMLRPC_PARSE_ERROR                  (-503)
		-- #define XMLRPC_NETWORK_ERROR                (-504)
		-- #define XMLRPC_TIMEOUT_ERROR                (-505)
		-- #define XMLRPC_NO_SUCH_METHOD_ERROR         (-506)
		-- #define XMLRPC_REQUEST_REFUSED_ERROR        (-507)
		-- #define XMLRPC_INTROSPECTION_DISABLED_ERROR (-508)
		-- #define XMLRPC_LIMIT_EXCEEDED_ERROR         (-509)
		-- #define XMLRPC_INVALID_UTF8_ERROR           (-510)

feature {} -- enum

	is_valid_xmlrpc_error_type (an_error: INTEGER) : BOOLEAN
		do
			Result := ((an_error = xmlrpc_internal_error) or else
			           (an_error = xmlrpc_type_error) or else
			           (an_error = xmlrpc_index_error) or else
			           (an_error = xmlrpc_parse_error) or else
			           (an_error = xmlrpc_network_error) or else
			           (an_error = xmlrpc_timeout_error) or else
			           (an_error = xmlrpc_no_such_method_error) or else
			           (an_error = xmlrpc_request_refused_error) or else
			           (an_error = xmlrpc_introspection_disabled_error) or else
			           (an_error = xmlrpc_limit_exceeded_error) or else
			           (an_error = xmlrpc_invalid_utf8_error))
		end

		xmlrpc_internal_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INTERNAL_ERROR"
		end

		xmlrpc_type_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_ERROR"
		end

		xmlrpc_index_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INDEX_ERROR"
		end

		xmlrpc_parse_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_PARSE_ERROR"
		end

		xmlrpc_network_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_NETWORK_ERROR"
		end

		xmlrpc_timeout_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TIMEOUT_ERROR"
		end

		xmlrpc_no_such_method_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_NO_SUCH_METHOD_ERROR"
		end

		xmlrpc_request_refused_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_REQUEST_REFUSED_ERROR"
		end

		xmlrpc_introspection_disabled_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INTROSPECTION_DISABLED_ERROR"
		end

		xmlrpc_limit_exceeded_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_LIMIT_EXCEEDED_ERROR"
		end

		xmlrpc_invalid_utf8_error: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_INVALID_UTF8_ERROR"
		end

end -- class XMLRPC_ERROR_TYPE
