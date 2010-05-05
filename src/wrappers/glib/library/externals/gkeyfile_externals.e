-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GKEYFILE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_key_file_set_list_separator (a_key_file: POINTER; a_separator: CHARACTER) is
 		-- g_key_file_set_list_separator (node at line 174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_list_separator"
		}"
		end

	g_key_file_get_locale_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_locale_string (node at line 314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_locale_string"
		}"
		end

	g_key_file_set_boolean (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: INTEGER_32) is
 		-- g_key_file_set_boolean (node at line 364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_boolean"
		}"
		end

	g_key_file_set_locale_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; a_string: POINTER) is
 		-- g_key_file_set_locale_string (node at line 380)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_locale_string"
		}"
		end

	g_key_file_error_quark: NATURAL_32 is
 		-- g_key_file_error_quark (node at line 470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_error_quark()"
		}"
		end

	g_key_file_load_from_dirs (a_key_file: POINTER; a_file: POINTER; a_search_dirs: POINTER; a_full_path: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_load_from_dirs (node at line 539)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_load_from_dirs"
		}"
		end

	g_key_file_get_groups (a_key_file: POINTER; a_length: POINTER): POINTER is
 		-- g_key_file_get_groups (node at line 687)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_groups"
		}"
		end

	g_key_file_set_comment (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_comment: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_set_comment (node at line 719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_comment"
		}"
		end

	g_key_file_set_double (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: REAL_64) is
 		-- g_key_file_set_double (node at line 823)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_double"
		}"
		end

	g_key_file_load_from_file (a_key_file: POINTER; a_file: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_load_from_file (node at line 1176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_load_from_file"
		}"
		end

	g_key_file_has_group (a_key_file: POINTER; a_group_name: POINTER): INTEGER_32 is
 		-- g_key_file_has_group (node at line 1327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_has_group"
		}"
		end

	g_key_file_get_boolean_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_boolean_list (node at line 1519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_boolean_list"
		}"
		end

	g_key_file_get_value (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_value (node at line 1529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_value"
		}"
		end

	g_key_file_set_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_string: POINTER) is
 		-- g_key_file_set_string (node at line 1574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_string"
		}"
		end

	g_key_file_to_data (a_key_file: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_to_data (node at line 1688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_to_data"
		}"
		end

	g_key_file_get_locale_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_locale_string_list (node at line 1774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_locale_string_list"
		}"
		end

	g_key_file_set_integer_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: NATURAL_32) is
 		-- g_key_file_set_integer_list (node at line 2560)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_integer_list"
		}"
		end

	g_key_file_free (a_key_file: POINTER) is
 		-- g_key_file_free (node at line 2662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_free"
		}"
		end

	g_key_file_get_boolean (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_get_boolean (node at line 2706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_boolean"
		}"
		end

	g_key_file_set_double_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: NATURAL_32) is
 		-- g_key_file_set_double_list (node at line 2744)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_double_list"
		}"
		end

	g_key_file_get_comment (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_comment (node at line 3042)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_comment"
		}"
		end

	g_key_file_set_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: NATURAL_32) is
 		-- g_key_file_set_string_list (node at line 3144)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_string_list"
		}"
		end

	g_key_file_set_locale_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; a_list: POINTER; a_length: NATURAL_32) is
 		-- g_key_file_set_locale_string_list (node at line 3391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_locale_string_list"
		}"
		end

	g_key_file_get_double_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_double_list (node at line 3455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_double_list"
		}"
		end

	g_key_file_remove_comment (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_remove_comment (node at line 3565)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_remove_comment"
		}"
		end

	g_key_file_load_from_data_dirs (a_key_file: POINTER; a_file: POINTER; a_full_path: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_load_from_data_dirs (node at line 3876)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_load_from_data_dirs"
		}"
		end

	g_key_file_set_integer (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: INTEGER_32) is
 		-- g_key_file_set_integer (node at line 3883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_integer"
		}"
		end

	g_key_file_get_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_string_list (node at line 3984)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_string_list"
		}"
		end

	g_key_file_remove_key (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_remove_key (node at line 4173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_remove_key"
		}"
		end

	g_key_file_load_from_data (a_key_file: POINTER; a_data: POINTER; a_length: NATURAL_32; a_flags: INTEGER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_load_from_data (node at line 4281)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_load_from_data"
		}"
		end

	g_key_file_get_start_group (a_key_file: POINTER): POINTER is
 		-- g_key_file_get_start_group (node at line 4526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_start_group"
		}"
		end

	g_key_file_get_keys (a_key_file: POINTER; a_group_name: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_keys (node at line 4660)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_keys"
		}"
		end

	g_key_file_get_integer (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_get_integer (node at line 5229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_integer"
		}"
		end

	g_key_file_set_value (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: POINTER) is
 		-- g_key_file_set_value (node at line 5774)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_value"
		}"
		end

	g_key_file_get_integer_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_integer_list (node at line 5828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_integer_list"
		}"
		end

	g_key_file_set_boolean_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: NATURAL_32) is
 		-- g_key_file_set_boolean_list (node at line 5838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_set_boolean_list"
		}"
		end

	g_key_file_has_key (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_has_key (node at line 6050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_has_key"
		}"
		end

	g_key_file_get_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): POINTER is
 		-- g_key_file_get_string (node at line 6171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_string"
		}"
		end

	g_key_file_get_double (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): REAL_64 is
 		-- g_key_file_get_double (node at line 6617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_get_double"
		}"
		end

	g_key_file_new: POINTER is
 		-- g_key_file_new (node at line 6718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_new()"
		}"
		end

	g_key_file_remove_group (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_key_file_remove_group (node at line 6727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_key_file_remove_group"
		}"
		end


end -- class GKEYFILE_EXTERNALS
