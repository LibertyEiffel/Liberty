-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GKEYFILE_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_key_file_error_quark: NATURAL 
               -- g_key_file_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_error_quark"
               }"
               end

	g_key_file_free (a_key_file: POINTER) 
               -- g_key_file_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_free"
               }"
               end

	g_key_file_get_boolean (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_get_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_boolean"
               }"
               end

	g_key_file_get_boolean_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_boolean_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_boolean_list"
               }"
               end

	g_key_file_get_comment (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_comment"
               }"
               end

	g_key_file_get_double (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): REAL 
               -- g_key_file_get_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_double"
               }"
               end

	g_key_file_get_double_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_double_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_double_list"
               }"
               end

	g_key_file_get_groups (a_key_file: POINTER; a_length: POINTER): POINTER 
               -- g_key_file_get_groups
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_groups"
               }"
               end

	g_key_file_get_int64 (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): like long 
               -- g_key_file_get_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_int64"
               }"
               end

	g_key_file_get_integer (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_get_integer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_integer"
               }"
               end

	g_key_file_get_integer_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_integer_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_integer_list"
               }"
               end

	g_key_file_get_keys (a_key_file: POINTER; a_group_name: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_keys
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_keys"
               }"
               end

	g_key_file_get_locale_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_locale_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_locale_string"
               }"
               end

	g_key_file_get_locale_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_locale_string_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_locale_string_list"
               }"
               end

	g_key_file_get_start_group (a_key_file: POINTER): POINTER 
               -- g_key_file_get_start_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_start_group"
               }"
               end

	g_key_file_get_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_string"
               }"
               end

	g_key_file_get_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_string_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_string_list"
               }"
               end

	g_key_file_get_uint64 (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): like long_unsigned 
               -- g_key_file_get_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_uint64"
               }"
               end

	g_key_file_get_value (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_get_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_get_value"
               }"
               end

	g_key_file_has_group (a_key_file: POINTER; a_group_name: POINTER): INTEGER 
               -- g_key_file_has_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_has_group"
               }"
               end

	g_key_file_has_key (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_has_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_has_key"
               }"
               end

	g_key_file_load_from_data (a_key_file: POINTER; a_data: POINTER; a_length: like long_unsigned; a_flags: INTEGER; an_error: POINTER): INTEGER 
               -- g_key_file_load_from_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_load_from_data"
               }"
               end

	g_key_file_load_from_data_dirs (a_key_file: POINTER; a_file: POINTER; a_full_path: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER 
               -- g_key_file_load_from_data_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_load_from_data_dirs"
               }"
               end

	g_key_file_load_from_dirs (a_key_file: POINTER; a_file: POINTER; a_search_dirs: POINTER; a_full_path: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER 
               -- g_key_file_load_from_dirs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_load_from_dirs"
               }"
               end

	g_key_file_load_from_file (a_key_file: POINTER; a_file: POINTER; a_flags: INTEGER; an_error: POINTER): INTEGER 
               -- g_key_file_load_from_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_load_from_file"
               }"
               end

	g_key_file_new: POINTER 
               -- g_key_file_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_new"
               }"
               end

	g_key_file_ref (a_key_file: POINTER): POINTER 
               -- g_key_file_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_ref"
               }"
               end

	g_key_file_remove_comment (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_remove_comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_remove_comment"
               }"
               end

	g_key_file_remove_group (a_key_file: POINTER; a_group_name: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_remove_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_remove_group"
               }"
               end

	g_key_file_remove_key (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_remove_key
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_remove_key"
               }"
               end

	g_key_file_save_to_file (a_key_file: POINTER; a_filename: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_save_to_file
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_save_to_file"
               }"
               end

	g_key_file_set_boolean (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: INTEGER) 
               -- g_key_file_set_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_boolean"
               }"
               end

	g_key_file_set_boolean_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: like long_unsigned) 
               -- g_key_file_set_boolean_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_boolean_list"
               }"
               end

	g_key_file_set_comment (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_comment: POINTER; an_error: POINTER): INTEGER 
               -- g_key_file_set_comment
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_comment"
               }"
               end

	g_key_file_set_double (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: REAL) 
               -- g_key_file_set_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_double"
               }"
               end

	g_key_file_set_double_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: like long_unsigned) 
               -- g_key_file_set_double_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_double_list"
               }"
               end

	g_key_file_set_int64 (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: like long) 
               -- g_key_file_set_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_int64"
               }"
               end

	g_key_file_set_integer (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: INTEGER) 
               -- g_key_file_set_integer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_integer"
               }"
               end

	g_key_file_set_integer_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: like long_unsigned) 
               -- g_key_file_set_integer_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_integer_list"
               }"
               end

	g_key_file_set_list_separator (a_key_file: POINTER; a_separator: CHARACTER) 
               -- g_key_file_set_list_separator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_list_separator"
               }"
               end

	g_key_file_set_locale_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; a_string: POINTER) 
               -- g_key_file_set_locale_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_locale_string"
               }"
               end

	g_key_file_set_locale_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_locale: POINTER; a_list: POINTER; a_length: like long_unsigned) 
               -- g_key_file_set_locale_string_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_locale_string_list"
               }"
               end

	g_key_file_set_string (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_string: POINTER) 
               -- g_key_file_set_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_string"
               }"
               end

	g_key_file_set_string_list (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_list: POINTER; a_length: like long_unsigned) 
               -- g_key_file_set_string_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_string_list"
               }"
               end

	g_key_file_set_uint64 (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: like long_unsigned) 
               -- g_key_file_set_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_uint64"
               }"
               end

	g_key_file_set_value (a_key_file: POINTER; a_group_name: POINTER; a_key: POINTER; a_value: POINTER) 
               -- g_key_file_set_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_set_value"
               }"
               end

	g_key_file_to_data (a_key_file: POINTER; a_length: POINTER; an_error: POINTER): POINTER 
               -- g_key_file_to_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_to_data"
               }"
               end

	g_key_file_unref (a_key_file: POINTER) 
               -- g_key_file_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_key_file_unref"
               }"
               end


end -- class GKEYFILE_EXTERNALS
