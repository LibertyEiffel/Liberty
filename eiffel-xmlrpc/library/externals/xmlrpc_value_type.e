deferred class XMLRPC_VALUE_TYPE

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

	is_valid_xmlrpc_value_type (a_value: INTEGER) : BOOLEAN is
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

	xmlrpc_value_int: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_INT"
		end

	xmlrpc_value_bool: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_BOOL"
		end

	xmlrpc_value_double: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_DOUBLE"
		end

	xmlrpc_value_datetime: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_DATETIME"
		end

	xmlrpc_value_string: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_STRING"
		end

	xmlrpc_value_base64: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_BASE64"
		end

	xmlrpc_value_array: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_ARRAY"
		end

	xmlrpc_value_struct: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_STRUCT"
		end

	xmlrpc_value_c_ptr: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_C_PTR"
		end

	xmlrpc_value_nil: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_NIL"
		end

	xmlrpc_value_dead: INTEGER is
		external "C macro use <xmlrpc-c/base.h>"
		alias "XMLRPC_TYPE_DEAD"
		end

end -- class XMLRPC_VALUE_TYPE
