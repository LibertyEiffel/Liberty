-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_param_spec_uint (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: NATURAL_32; a_maximum: NATURAL_32; a_default_value: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_uint (node at line 260)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_uint"
		}"
		end

	g_param_spec_long (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: INTEGER_32; a_maximum: INTEGER_32; a_default_value: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_long (node at line 414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_long"
		}"
		end

	g_param_spec_string (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_default_value: POINTER; a_flags: INTEGER): POINTER is
 		-- g_param_spec_string (node at line 500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_string"
		}"
		end

	g_param_spec_boolean (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_default_value: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_boolean (node at line 636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_boolean"
		}"
		end

	g_param_spec_char (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: CHARACTER; a_maximum: CHARACTER; a_default_value: CHARACTER; a_flags: INTEGER): POINTER is
 		-- g_param_spec_char (node at line 684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_char"
		}"
		end

	g_param_spec_param (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_param_type: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_param (node at line 1366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_param"
		}"
		end

	g_param_spec_boxed (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_boxed_type: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_boxed (node at line 2246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_boxed"
		}"
		end

	g_param_spec_pointer (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_flags: INTEGER): POINTER is
 		-- g_param_spec_pointer (node at line 2778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pointer"
		}"
		end

	g_param_spec_unichar (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_default_value: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_unichar (node at line 2855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_unichar"
		}"
		end

	g_param_spec_object (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_object_type: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_object (node at line 3010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_object"
		}"
		end

	g_param_spec_ulong (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: NATURAL_32; a_maximum: NATURAL_32; a_default_value: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_ulong (node at line 3222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_ulong"
		}"
		end

	g_param_spec_override (a_name: POINTER; an_overridden: POINTER): POINTER is
 		-- g_param_spec_override (node at line 3448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_override"
		}"
		end

	g_param_spec_float (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: REAL_32; a_maximum: REAL_32; a_default_value: REAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_float (node at line 4031)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_float"
		}"
		end

	g_param_spec_uchar (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: CHARACTER; a_maximum: CHARACTER; a_default_value: CHARACTER; a_flags: INTEGER): POINTER is
 		-- g_param_spec_uchar (node at line 4066)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_uchar"
		}"
		end

	g_param_spec_flags (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_flags_type: NATURAL_32; a_default_value: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_flags (node at line 5349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_flags"
		}"
		end

	g_param_spec_int64 (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: INTEGER_64; a_maximum: INTEGER_64; a_default_value: INTEGER_64; a_flags: INTEGER): POINTER is
 		-- g_param_spec_int64 (node at line 6841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_int64"
		}"
		end

	g_param_spec_double (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: REAL_64; a_maximum: REAL_64; a_default_value: REAL_64; a_flags: INTEGER): POINTER is
 		-- g_param_spec_double (node at line 7234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_double"
		}"
		end

	g_param_spec_int (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: INTEGER_32; a_maximum: INTEGER_32; a_default_value: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_int (node at line 7943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_int"
		}"
		end

	g_param_spec_value_array (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_element_spec: POINTER; a_flags: INTEGER): POINTER is
 		-- g_param_spec_value_array (node at line 8140)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_value_array"
		}"
		end

	g_param_spec_uint64 (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: NATURAL_64; a_maximum: NATURAL_64; a_default_value: NATURAL_64; a_flags: INTEGER): POINTER is
 		-- g_param_spec_uint64 (node at line 8419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_uint64"
		}"
		end

	g_param_spec_enum (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_enum_type: NATURAL_32; a_default_value: INTEGER_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_enum (node at line 8570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_enum"
		}"
		end

	g_param_spec_gtype (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_is_a_type: NATURAL_32; a_flags: INTEGER): POINTER is
 		-- g_param_spec_gtype (node at line 8738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_gtype"
		}"
		end

feature {} -- Variables
	g_param_spec_types: POINTER is
 		-- g_param_spec_types (node at line 1079)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_types"
		}"
		end


end -- class GPARAMSPECS_EXTERNALS
