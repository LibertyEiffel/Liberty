-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVARIANTTYPE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_variant_type_is_definite (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_definite (node at line 51)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_definite"
		}"
		end

	g_variant_type_is_basic (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_basic (node at line 60)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_basic"
		}"
		end

	g_variant_type_string_scan (a_string: POINTER; a_limit: POINTER; an_endptr: POINTER): INTEGER_32 is
 		-- g_variant_type_string_scan (node at line 131)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_string_scan"
		}"
		end

	g_variant_type_element (a_type: POINTER): POINTER is
 		-- g_variant_type_element (node at line 387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_element"
		}"
		end

	g_variant_type_peek_string (a_type: POINTER): POINTER is
 		-- g_variant_type_peek_string (node at line 706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_peek_string"
		}"
		end

	g_variant_type_next (a_type: POINTER): POINTER is
 		-- g_variant_type_next (node at line 853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_next"
		}"
		end

	g_variant_type_is_container (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_container (node at line 1119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_container"
		}"
		end

	g_variant_type_equal (a_type1: POINTER; a_type2: POINTER): INTEGER_32 is
 		-- g_variant_type_equal (node at line 1958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_equal"
		}"
		end

	g_variant_type_n_items (a_type: POINTER): NATURAL_32 is
 		-- g_variant_type_n_items (node at line 2050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_n_items"
		}"
		end

	g_variant_type_new_dict_entry (a_key: POINTER; a_value: POINTER): POINTER is
 		-- g_variant_type_new_dict_entry (node at line 2406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_new_dict_entry"
		}"
		end

	g_variant_type_is_subtype_of (a_type: POINTER; a_supertype: POINTER): INTEGER_32 is
 		-- g_variant_type_is_subtype_of (node at line 2717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_subtype_of"
		}"
		end

	g_variant_type_new_array (an_element: POINTER): POINTER is
 		-- g_variant_type_new_array (node at line 3190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_new_array"
		}"
		end

	g_variant_type_is_tuple (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_tuple (node at line 3214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_tuple"
		}"
		end

	g_variant_type_dup_string (a_type: POINTER): POINTER is
 		-- g_variant_type_dup_string (node at line 3335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_dup_string"
		}"
		end

	g_variant_type_string_is_valid (a_type_string: POINTER): INTEGER_32 is
 		-- g_variant_type_string_is_valid (node at line 3494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_string_is_valid"
		}"
		end

	g_variant_type_get_string_length (a_type: POINTER): NATURAL_32 is
 		-- g_variant_type_get_string_length (node at line 3717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_get_string_length"
		}"
		end

	g_variant_type_copy (a_type: POINTER): POINTER is
 		-- g_variant_type_copy (node at line 3991)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_copy"
		}"
		end

	g_variant_type_free (a_type: POINTER) is
 		-- g_variant_type_free (node at line 4211)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_free"
		}"
		end

	g_variant_type_is_maybe (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_maybe (node at line 4251)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_maybe"
		}"
		end

	g_variant_type_new_tuple (an_items: POINTER; a_length: INTEGER_32): POINTER is
 		-- g_variant_type_new_tuple (node at line 4484)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_new_tuple"
		}"
		end

	g_variant_type_is_variant (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_variant (node at line 4676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_variant"
		}"
		end

	g_variant_type_hash (a_type: POINTER): NATURAL_32 is
 		-- g_variant_type_hash (node at line 4897)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_hash"
		}"
		end

	g_variant_type_new (a_type_string: POINTER): POINTER is
 		-- g_variant_type_new (node at line 5404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_new"
		}"
		end

	g_variant_type_is_array (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_array (node at line 5853)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_array"
		}"
		end

	g_variant_type_is_dict_entry (a_type: POINTER): INTEGER_32 is
 		-- g_variant_type_is_dict_entry (node at line 5960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_is_dict_entry"
		}"
		end

	g_variant_type_first (a_type: POINTER): POINTER is
 		-- g_variant_type_first (node at line 6165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_first"
		}"
		end

	g_variant_type_new_maybe (an_element: POINTER): POINTER is
 		-- g_variant_type_new_maybe (node at line 6201)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_new_maybe"
		}"
		end

	g_variant_type_value (a_type: POINTER): POINTER is
 		-- g_variant_type_value (node at line 6576)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_value"
		}"
		end

	g_variant_type_key (a_type: POINTER): POINTER is
 		-- g_variant_type_key (node at line 6735)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_key"
		}"
		end

	g_variant_type_checked (an_argument_l6764_c7: POINTER): POINTER is
 		-- g_variant_type_checked_ (node at line 6763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_type_checked_"
		}"
		end


end -- class GVARIANTTYPE_EXTERNALS
