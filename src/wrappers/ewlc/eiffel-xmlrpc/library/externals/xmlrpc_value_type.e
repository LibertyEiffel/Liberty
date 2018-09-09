note
	description: "XMLRPC value types"
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

deferred class XMLRPC_VALUE_TYPE

inherit ANY undefine is_equal, copy end



		-- typedef enum {
		--     XMLRPC_TYPE_INT      = 0,
		--     XMLRPC_TYPE_BOOL     = 1,
		--     XMLRPC_TYPE_DOUBLE   = 2,
		--     XMLRPC_TYPE_DATETIME = 3,
		--     XMLRPC_TYPE_STRING   = 4,
		--     XMLRPC_TYPE_BASE64   = 5,
		--     XMLRPC_TYPE_ARRAY    = 6,
		--     XMLRPC_TYPE_STRUCT   = 7,
		--     XMLRPC_TYPE_C_PTR    = 8,
		--     XMLRPC_TYPE_NIL      = 9,
		--     XMLRPC_TYPE_DEAD     = 0xDEAD
		-- } xmlrpc_type;

feature {} -- enum

	is_valid_xmlrpc_value_type (a_value: INTEGER) : BOOLEAN
		do
			Result := ((a_value = xmlrpc_value_int) or else
			           (a_value = xmlrpc_value_bool) or else
			           (a_value = xmlrpc_value_double) or else
			           (a_value = xmlrpc_value_datetime) or else
			           (a_value = xmlrpc_value_string) or else
			           (a_value = xmlrpc_value_base64) or else
			           (a_value = xmlrpc_value_array) or else
			           (a_value = xmlrpc_value_struct) or else
			           (a_value = xmlrpc_value_c_ptr) or else
			           (a_value = xmlrpc_value_nil) or else
			           (a_value = xmlrpc_value_dead))
		end

	xmlrpc_value_int: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_INT"
		end

	xmlrpc_value_bool: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_BOOL"
		end

	xmlrpc_value_double: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_DOUBLE"
		end

	xmlrpc_value_datetime: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_DATETIME"
		end

	xmlrpc_value_string: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_STRING"
		end

	xmlrpc_value_base64: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_BASE64"
		end

	xmlrpc_value_array: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_ARRAY"
		end

	xmlrpc_value_struct: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_STRUCT"
		end

	xmlrpc_value_c_ptr: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_C_PTR"
		end

	xmlrpc_value_nil: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_NIL"
		end

	xmlrpc_value_dead: INTEGER
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_DEAD"
		end

end -- class XMLRPC_VALUE_TYPE
