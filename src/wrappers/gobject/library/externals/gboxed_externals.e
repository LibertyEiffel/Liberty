-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBOXED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_variant_type_get_gtype: NATURAL_32 is
 		-- g_variant_type_get_gtype (node at line 339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_get_gtype()"
		}"
		end

	g_gstring_get_type: NATURAL_32 is
 		-- g_gstring_get_type (node at line 707)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_gstring_get_type()"
		}"
		end

	g_hash_table_get_type: NATURAL_32 is
 		-- g_hash_table_get_type (node at line 1338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_hash_table_get_type()"
		}"
		end

	g_date_get_type: NATURAL_32 is
 		-- g_date_get_type (node at line 2228)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_date_get_type()"
		}"
		end

	g_boxed_type_register_static (a_name: POINTER; a_boxed_copy: POINTER; a_boxed_free: POINTER): NATURAL_32 is
 		-- g_boxed_type_register_static (node at line 2337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_type_register_static"
		}"
		end

	g_variant_get_gtype: NATURAL_32 is
 		-- g_variant_get_gtype (node at line 2953)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_gtype()"
		}"
		end

	g_byte_array_get_type: NATURAL_32 is
 		-- g_byte_array_get_type (node at line 4388)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_get_type()"
		}"
		end

	g_regex_get_type: NATURAL_32 is
 		-- g_regex_get_type (node at line 4888)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_regex_get_type()"
		}"
		end

	g_closure_get_type: NATURAL_32 is
 		-- g_closure_get_type (node at line 4902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_get_type()"
		}"
		end

	g_value_set_boxed_take_ownership (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_set_boxed_take_ownership (node at line 5390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_boxed_take_ownership"
		}"
		end

	g_value_set_static_boxed (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_set_static_boxed (node at line 5496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_static_boxed"
		}"
		end

	g_boxed_copy (a_boxed_type: NATURAL_32; a_src_boxed: POINTER): POINTER is
 		-- g_boxed_copy (node at line 6235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_copy"
		}"
		end

	g_boxed_free (a_boxed_type: NATURAL_32; a_boxed: POINTER) is
 		-- g_boxed_free (node at line 6362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_free"
		}"
		end

	g_value_dup_boxed (a_value: POINTER): POINTER is
 		-- g_value_dup_boxed (node at line 6526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_dup_boxed"
		}"
		end

	g_value_get_type: NATURAL_32 is
 		-- g_value_get_type (node at line 6580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_type()"
		}"
		end

	g_value_take_boxed (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_take_boxed (node at line 6683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_take_boxed"
		}"
		end

	g_strv_get_type: NATURAL_32 is
 		-- g_strv_get_type (node at line 6759)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_strv_get_type()"
		}"
		end

	g_value_set_boxed (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_set_boxed (node at line 6956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_boxed"
		}"
		end

	g_value_array_get_type: NATURAL_32 is
 		-- g_value_array_get_type (node at line 7424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_get_type()"
		}"
		end

	g_array_get_type: NATURAL_32 is
 		-- g_array_get_type (node at line 7697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_get_type()"
		}"
		end

	g_ptr_array_get_type: NATURAL_32 is
 		-- g_ptr_array_get_type (node at line 7844)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_get_type()"
		}"
		end

	g_value_get_boxed (a_value: POINTER): POINTER is
 		-- g_value_get_boxed (node at line 8171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_boxed"
		}"
		end


end -- class GBOXED_EXTERNALS
