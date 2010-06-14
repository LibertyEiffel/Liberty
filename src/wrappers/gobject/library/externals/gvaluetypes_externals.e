-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVALUETYPES_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_value_get_uint (a_value: POINTER): NATURAL_32 is
 		-- g_value_get_uint (node at line 291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_uint"
		}"
		end

	g_value_get_pointer (a_value: POINTER): POINTER is
 		-- g_value_get_pointer (node at line 1394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_pointer"
		}"
		end

	g_strdup_value_contents (a_value: POINTER): POINTER is
 		-- g_strdup_value_contents (node at line 1447)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strdup_value_contents"
		}"
		end

	g_value_get_char (a_value: POINTER): CHARACTER is
 		-- g_value_get_char (node at line 1652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_char"
		}"
		end

	g_value_set_double (a_value: POINTER; a_v_double: REAL_64) is
 		-- g_value_set_double (node at line 1913)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_double"
		}"
		end

	g_value_set_float (a_value: POINTER; a_v_float: REAL_32) is
 		-- g_value_set_float (node at line 2186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_float"
		}"
		end

	g_value_set_static_string (a_value: POINTER; a_v_string: POINTER) is
 		-- g_value_set_static_string (node at line 2269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_static_string"
		}"
		end

	g_value_set_uint64 (a_value: POINTER; a_v_uint64: NATURAL_64) is
 		-- g_value_set_uint64 (node at line 2333)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_uint64"
		}"
		end

	g_value_set_string_take_ownership (a_value: POINTER; a_v_string: POINTER) is
 		-- g_value_set_string_take_ownership (node at line 2497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_string_take_ownership"
		}"
		end

	g_value_get_int (a_value: POINTER): INTEGER_32 is
 		-- g_value_get_int (node at line 2515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_int"
		}"
		end

	g_value_set_long (a_value: POINTER; a_v_long: INTEGER_32) is
 		-- g_value_set_long (node at line 2527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_long"
		}"
		end

	g_pointer_type_register_static (a_name: POINTER): NATURAL_32 is
 		-- g_pointer_type_register_static (node at line 3139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_pointer_type_register_static"
		}"
		end

	g_value_set_ulong (a_value: POINTER; a_v_ulong: NATURAL_32) is
 		-- g_value_set_ulong (node at line 3444)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_ulong"
		}"
		end

	g_value_dup_string (a_value: POINTER): POINTER is
 		-- g_value_dup_string (node at line 3867)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_dup_string"
		}"
		end

	g_value_get_double (a_value: POINTER): REAL_64 is
 		-- g_value_get_double (node at line 4488)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_double"
		}"
		end

	g_value_set_boolean (a_value: POINTER; a_v_boolean: INTEGER_32) is
 		-- g_value_set_boolean (node at line 4660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_boolean"
		}"
		end

	g_value_get_long (a_value: POINTER): INTEGER_32 is
 		-- g_value_get_long (node at line 4841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_long"
		}"
		end

	g_value_set_string (a_value: POINTER; a_v_string: POINTER) is
 		-- g_value_set_string (node at line 4890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_string"
		}"
		end

	g_value_set_uint (a_value: POINTER; a_v_uint: NATURAL_32) is
 		-- g_value_set_uint (node at line 4978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_uint"
		}"
		end

	g_value_get_string (a_value: POINTER): POINTER is
 		-- g_value_get_string (node at line 5130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_string"
		}"
		end

	g_value_get_gtype (a_value: POINTER): NATURAL_32 is
 		-- g_value_get_gtype (node at line 5402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_gtype"
		}"
		end

	g_value_set_int64 (a_value: POINTER; a_v_int64: INTEGER_64) is
 		-- g_value_set_int64 (node at line 5656)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_int64"
		}"
		end

	g_value_get_ulong (a_value: POINTER): NATURAL_32 is
 		-- g_value_get_ulong (node at line 5741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_ulong"
		}"
		end

	g_value_get_boolean (a_value: POINTER): INTEGER_32 is
 		-- g_value_get_boolean (node at line 6108)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_boolean"
		}"
		end

	g_value_get_int64 (a_value: POINTER): INTEGER_64 is
 		-- g_value_get_int64 (node at line 6199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_int64"
		}"
		end

	g_value_set_int (a_value: POINTER; a_v_int: INTEGER_32) is
 		-- g_value_set_int (node at line 6249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_int"
		}"
		end

	g_value_set_uchar (a_value: POINTER; a_v_uchar: CHARACTER) is
 		-- g_value_set_uchar (node at line 6313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_uchar"
		}"
		end

	g_value_set_gtype (a_value: POINTER; a_v_gtype: NATURAL_32) is
 		-- g_value_set_gtype (node at line 6327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_gtype"
		}"
		end

	g_gtype_get_type: NATURAL_32 is
 		-- g_gtype_get_type (node at line 6543)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_gtype_get_type()"
		}"
		end

	g_value_get_uchar (a_value: POINTER): CHARACTER is
 		-- g_value_get_uchar (node at line 6914)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_uchar"
		}"
		end

	g_value_take_string (a_value: POINTER; a_v_string: POINTER) is
 		-- g_value_take_string (node at line 7437)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_take_string"
		}"
		end

	g_value_get_float (a_value: POINTER): REAL_32 is
 		-- g_value_get_float (node at line 7957)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_float"
		}"
		end

	g_value_get_uint64 (a_value: POINTER): NATURAL_64 is
 		-- g_value_get_uint64 (node at line 8207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_uint64"
		}"
		end

	g_value_set_pointer (a_value: POINTER; a_v_pointer: POINTER) is
 		-- g_value_set_pointer (node at line 8366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_pointer"
		}"
		end

	g_value_set_char (a_value: POINTER; a_v_char: CHARACTER) is
 		-- g_value_set_char (node at line 8443)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_char"
		}"
		end


end -- class GVALUETYPES_EXTERNALS
