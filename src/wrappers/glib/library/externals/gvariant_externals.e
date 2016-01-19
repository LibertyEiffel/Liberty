-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVARIANT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_variant_builder_add (a_builder: POINTER; a_format_string: POINTER) 
               -- g_variant_builder_add (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_add"
               }"
               end

	g_variant_builder_add_parsed (a_builder: POINTER; a_format: POINTER) 
               -- g_variant_builder_add_parsed (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_add_parsed"
               }"
               end

	g_variant_builder_add_value (a_builder: POINTER; a_value: POINTER) 
               -- g_variant_builder_add_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_add_value"
               }"
               end

	g_variant_builder_clear (a_builder: POINTER) 
               -- g_variant_builder_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_clear"
               }"
               end

	g_variant_builder_close (a_builder: POINTER) 
               -- g_variant_builder_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_close"
               }"
               end

	g_variant_builder_end (a_builder: POINTER): POINTER 
               -- g_variant_builder_end
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_end"
               }"
               end

	g_variant_builder_init (a_builder: POINTER; a_type: POINTER) 
               -- g_variant_builder_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_init"
               }"
               end

	g_variant_builder_new (a_type: POINTER): POINTER 
               -- g_variant_builder_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_new"
               }"
               end

	g_variant_builder_open (a_builder: POINTER; a_type: POINTER) 
               -- g_variant_builder_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_open"
               }"
               end

	g_variant_builder_ref (a_builder: POINTER): POINTER 
               -- g_variant_builder_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_ref"
               }"
               end

	g_variant_builder_unref (a_builder: POINTER) 
               -- g_variant_builder_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_builder_unref"
               }"
               end

	g_variant_byteswap (a_value: POINTER): POINTER 
               -- g_variant_byteswap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_byteswap"
               }"
               end

	g_variant_check_format_string (a_value: POINTER; a_format_string: POINTER; a_copy_only: INTEGER): INTEGER 
               -- g_variant_check_format_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_check_format_string"
               }"
               end

	g_variant_classify (a_value: POINTER): INTEGER 
               -- g_variant_classify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_classify"
               }"
               end

	g_variant_compare (an_one: POINTER; a_two: POINTER): INTEGER 
               -- g_variant_compare
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_compare"
               }"
               end

	g_variant_dict_clear (a_dict: POINTER) 
               -- g_variant_dict_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_clear"
               }"
               end

	g_variant_dict_contains (a_dict: POINTER; a_key: POINTER): INTEGER 
               -- g_variant_dict_contains
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_contains"
               }"
               end

	g_variant_dict_end (a_dict: POINTER): POINTER 
               -- g_variant_dict_end
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_end"
               }"
               end

	g_variant_dict_init (a_dict: POINTER; a_from_asv: POINTER) 
               -- g_variant_dict_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_init"
               }"
               end

	g_variant_dict_insert (a_dict: POINTER; a_key: POINTER; a_format_string: POINTER) 
               -- g_variant_dict_insert (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_insert"
               }"
               end

	g_variant_dict_insert_value (a_dict: POINTER; a_key: POINTER; a_value: POINTER) 
               -- g_variant_dict_insert_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_insert_value"
               }"
               end

	g_variant_dict_lookup (a_dict: POINTER; a_key: POINTER; a_format_string: POINTER): INTEGER 
               -- g_variant_dict_lookup (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_lookup"
               }"
               end

	g_variant_dict_lookup_value (a_dict: POINTER; a_key: POINTER; an_expected_type: POINTER): POINTER 
               -- g_variant_dict_lookup_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_lookup_value"
               }"
               end

	g_variant_dict_new (a_from_asv: POINTER): POINTER 
               -- g_variant_dict_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_new"
               }"
               end

	g_variant_dict_ref (a_dict: POINTER): POINTER 
               -- g_variant_dict_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_ref"
               }"
               end

	g_variant_dict_remove (a_dict: POINTER; a_key: POINTER): INTEGER 
               -- g_variant_dict_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_remove"
               }"
               end

	g_variant_dict_unref (a_dict: POINTER) 
               -- g_variant_dict_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dict_unref"
               }"
               end

	g_variant_dup_bytestring (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_dup_bytestring
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dup_bytestring"
               }"
               end

	g_variant_dup_bytestring_array (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_dup_bytestring_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dup_bytestring_array"
               }"
               end

	g_variant_dup_objv (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_dup_objv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dup_objv"
               }"
               end

	g_variant_dup_string (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_dup_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dup_string"
               }"
               end

	g_variant_dup_strv (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_dup_strv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_dup_strv"
               }"
               end

	g_variant_equal (an_one: POINTER; a_two: POINTER): INTEGER 
               -- g_variant_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_equal"
               }"
               end

	g_variant_get (a_value: POINTER; a_format_string: POINTER) 
               -- g_variant_get (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get"
               }"
               end

	g_variant_get_boolean (a_value: POINTER): INTEGER 
               -- g_variant_get_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_boolean"
               }"
               end

	g_variant_get_byte (a_value: POINTER): CHARACTER 
               -- g_variant_get_byte
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_byte"
               }"
               end

	g_variant_get_bytestring (a_value: POINTER): POINTER 
               -- g_variant_get_bytestring
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_bytestring"
               }"
               end

	g_variant_get_bytestring_array (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_get_bytestring_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_bytestring_array"
               }"
               end

	g_variant_get_child (a_value: POINTER; an_index: like long_unsigned; a_format_string: POINTER) 
               -- g_variant_get_child (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_child"
               }"
               end

	g_variant_get_child_value (a_value: POINTER; an_index: like long_unsigned): POINTER 
               -- g_variant_get_child_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_child_value"
               }"
               end

	g_variant_get_data (a_value: POINTER): POINTER 
               -- g_variant_get_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_data"
               }"
               end

	g_variant_get_data_as_bytes (a_value: POINTER): POINTER 
               -- g_variant_get_data_as_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_data_as_bytes"
               }"
               end

	g_variant_get_double (a_value: POINTER): REAL 
               -- g_variant_get_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_double"
               }"
               end

	g_variant_get_fixed_array (a_value: POINTER; a_n_elements: POINTER; an_element_size: like long_unsigned): POINTER 
               -- g_variant_get_fixed_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_fixed_array"
               }"
               end

	g_variant_get_handle (a_value: POINTER): INTEGER 
               -- g_variant_get_handle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_handle"
               }"
               end

	g_variant_get_int16 (a_value: POINTER): INTEGER_16 
               -- g_variant_get_int16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_int16"
               }"
               end

	g_variant_get_int32 (a_value: POINTER): INTEGER 
               -- g_variant_get_int32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_int32"
               }"
               end

	g_variant_get_int64 (a_value: POINTER): like long 
               -- g_variant_get_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_int64"
               }"
               end

	g_variant_get_maybe (a_value: POINTER): POINTER 
               -- g_variant_get_maybe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_maybe"
               }"
               end

	g_variant_get_normal_form (a_value: POINTER): POINTER 
               -- g_variant_get_normal_form
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_normal_form"
               }"
               end

	g_variant_get_objv (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_get_objv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_objv"
               }"
               end

	g_variant_get_size (a_value: POINTER): like long_unsigned 
               -- g_variant_get_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_size"
               }"
               end

	g_variant_get_string (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_get_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_string"
               }"
               end

	g_variant_get_strv (a_value: POINTER; a_length: POINTER): POINTER 
               -- g_variant_get_strv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_strv"
               }"
               end

	g_variant_get_type (a_value: POINTER): POINTER 
               -- g_variant_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_type"
               }"
               end

	g_variant_get_type_string (a_value: POINTER): POINTER 
               -- g_variant_get_type_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_type_string"
               }"
               end

	g_variant_get_uint16 (a_value: POINTER): NATURAL_16 
               -- g_variant_get_uint16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_uint16"
               }"
               end

	g_variant_get_uint32 (a_value: POINTER): NATURAL 
               -- g_variant_get_uint32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_uint32"
               }"
               end

	g_variant_get_uint64 (a_value: POINTER): like long_unsigned 
               -- g_variant_get_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_uint64"
               }"
               end

	g_variant_get_va (a_value: POINTER; a_format_string: POINTER; an_endptr: POINTER; an_app: POINTER) 
               -- g_variant_get_va
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_va"
               }"
               end

	g_variant_get_variant (a_value: POINTER): POINTER 
               -- g_variant_get_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_get_variant"
               }"
               end

	g_variant_hash (a_value: POINTER): NATURAL 
               -- g_variant_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_hash"
               }"
               end

	g_variant_is_container (a_value: POINTER): INTEGER 
               -- g_variant_is_container
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_is_container"
               }"
               end

	g_variant_is_floating (a_value: POINTER): INTEGER 
               -- g_variant_is_floating
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_is_floating"
               }"
               end

	g_variant_is_normal_form (a_value: POINTER): INTEGER 
               -- g_variant_is_normal_form
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_is_normal_form"
               }"
               end

	g_variant_is_object_path (a_string: POINTER): INTEGER 
               -- g_variant_is_object_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_is_object_path"
               }"
               end

	g_variant_is_of_type (a_value: POINTER; a_type: POINTER): INTEGER 
               -- g_variant_is_of_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_is_of_type"
               }"
               end

	g_variant_is_signature (a_string: POINTER): INTEGER 
               -- g_variant_is_signature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_is_signature"
               }"
               end

	g_variant_iter_copy (an_iter: POINTER): POINTER 
               -- g_variant_iter_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_copy"
               }"
               end

	g_variant_iter_free (an_iter: POINTER) 
               -- g_variant_iter_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_free"
               }"
               end

	g_variant_iter_init (an_iter: POINTER; a_value: POINTER): like long_unsigned 
               -- g_variant_iter_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_init"
               }"
               end

	g_variant_iter_loop (an_iter: POINTER; a_format_string: POINTER): INTEGER 
               -- g_variant_iter_loop (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_loop"
               }"
               end

	g_variant_iter_n_children (an_iter: POINTER): like long_unsigned 
               -- g_variant_iter_n_children
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_n_children"
               }"
               end

	g_variant_iter_new (a_value: POINTER): POINTER 
               -- g_variant_iter_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_new"
               }"
               end

	g_variant_iter_next (an_iter: POINTER; a_format_string: POINTER): INTEGER 
               -- g_variant_iter_next (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_next"
               }"
               end

	g_variant_iter_next_value (an_iter: POINTER): POINTER 
               -- g_variant_iter_next_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_iter_next_value"
               }"
               end

	g_variant_lookup (a_dictionary: POINTER; a_key: POINTER; a_format_string: POINTER): INTEGER 
               -- g_variant_lookup (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_lookup"
               }"
               end

	g_variant_lookup_value (a_dictionary: POINTER; a_key: POINTER; an_expected_type: POINTER): POINTER 
               -- g_variant_lookup_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_lookup_value"
               }"
               end

	g_variant_n_children (a_value: POINTER): like long_unsigned 
               -- g_variant_n_children
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_n_children"
               }"
               end

	g_variant_new (a_format_string: POINTER): POINTER 
               -- g_variant_new (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new"
               }"
               end

	g_variant_new_array (a_child_type: POINTER; a_children: POINTER; a_n_children: like long_unsigned): POINTER 
               -- g_variant_new_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_array"
               }"
               end

	g_variant_new_boolean (a_value: INTEGER): POINTER 
               -- g_variant_new_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_boolean"
               }"
               end

	g_variant_new_byte (a_value: CHARACTER): POINTER 
               -- g_variant_new_byte
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_byte"
               }"
               end

	g_variant_new_bytestring (a_string: POINTER): POINTER 
               -- g_variant_new_bytestring
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_bytestring"
               }"
               end

	g_variant_new_bytestring_array (a_strv: POINTER; a_length: like long): POINTER 
               -- g_variant_new_bytestring_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_bytestring_array"
               }"
               end

	g_variant_new_dict_entry (a_key: POINTER; a_value: POINTER): POINTER 
               -- g_variant_new_dict_entry
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_dict_entry"
               }"
               end

	g_variant_new_double (a_value: REAL): POINTER 
               -- g_variant_new_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_double"
               }"
               end

	g_variant_new_fixed_array (an_element_type: POINTER; an_elements: POINTER; a_n_elements: like long_unsigned; an_element_size: like long_unsigned): POINTER 
               -- g_variant_new_fixed_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_fixed_array"
               }"
               end

	g_variant_new_from_bytes (a_type: POINTER; a_bytes: POINTER; a_trusted: INTEGER): POINTER 
               -- g_variant_new_from_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_from_bytes"
               }"
               end

	g_variant_new_from_data (a_type: POINTER; a_data: POINTER; a_size: like long_unsigned; a_trusted: INTEGER; a_notify: POINTER; an_user_data: POINTER): POINTER 
               -- g_variant_new_from_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_from_data"
               }"
               end

	g_variant_new_handle (a_value: INTEGER): POINTER 
               -- g_variant_new_handle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_handle"
               }"
               end

	g_variant_new_int16 (a_value: INTEGER_16): POINTER 
               -- g_variant_new_int16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_int16"
               }"
               end

	g_variant_new_int32 (a_value: INTEGER): POINTER 
               -- g_variant_new_int32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_int32"
               }"
               end

	g_variant_new_int64 (a_value: like long): POINTER 
               -- g_variant_new_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_int64"
               }"
               end

	g_variant_new_maybe (a_child_type: POINTER; a_child: POINTER): POINTER 
               -- g_variant_new_maybe
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_maybe"
               }"
               end

	g_variant_new_object_path (an_object_path: POINTER): POINTER 
               -- g_variant_new_object_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_object_path"
               }"
               end

	g_variant_new_objv (a_strv: POINTER; a_length: like long): POINTER 
               -- g_variant_new_objv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_objv"
               }"
               end

	g_variant_new_parsed (a_format: POINTER): POINTER 
               -- g_variant_new_parsed (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_parsed"
               }"
               end

	g_variant_new_parsed_va (a_format: POINTER; an_app: POINTER): POINTER 
               -- g_variant_new_parsed_va
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_parsed_va"
               }"
               end

	g_variant_new_printf (a_format_string: POINTER): POINTER 
               -- g_variant_new_printf (variadic call) 
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_printf"
               }"
               end

	g_variant_new_signature (a_signature: POINTER): POINTER 
               -- g_variant_new_signature
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_signature"
               }"
               end

	g_variant_new_string (a_string: POINTER): POINTER 
               -- g_variant_new_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_string"
               }"
               end

	g_variant_new_strv (a_strv: POINTER; a_length: like long): POINTER 
               -- g_variant_new_strv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_strv"
               }"
               end

	g_variant_new_take_string (a_string: POINTER): POINTER 
               -- g_variant_new_take_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_take_string"
               }"
               end

	g_variant_new_tuple (a_children: POINTER; a_n_children: like long_unsigned): POINTER 
               -- g_variant_new_tuple
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_tuple"
               }"
               end

	g_variant_new_uint16 (a_value: NATURAL_16): POINTER 
               -- g_variant_new_uint16
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_uint16"
               }"
               end

	g_variant_new_uint32 (a_value: NATURAL): POINTER 
               -- g_variant_new_uint32
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_uint32"
               }"
               end

	g_variant_new_uint64 (a_value: like long_unsigned): POINTER 
               -- g_variant_new_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_uint64"
               }"
               end

	g_variant_new_va (a_format_string: POINTER; an_endptr: POINTER; an_app: POINTER): POINTER 
               -- g_variant_new_va
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_va"
               }"
               end

	g_variant_new_variant (a_value: POINTER): POINTER 
               -- g_variant_new_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_new_variant"
               }"
               end

	g_variant_parse (a_type: POINTER; a_text: POINTER; a_limit: POINTER; an_endptr: POINTER; an_error: POINTER): POINTER 
               -- g_variant_parse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_parse"
               }"
               end

	g_variant_parse_error_print_context (an_error: POINTER; a_source_str: POINTER): POINTER 
               -- g_variant_parse_error_print_context
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_parse_error_print_context"
               }"
               end

	g_variant_parse_error_quark: NATURAL 
               -- g_variant_parse_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_parse_error_quark"
               }"
               end

	g_variant_parser_get_error_quark: NATURAL 
               -- g_variant_parser_get_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_parser_get_error_quark"
               }"
               end

	g_variant_print (a_value: POINTER; a_type_annotate: INTEGER): POINTER 
               -- g_variant_print
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_print"
               }"
               end

	g_variant_print_string (a_value: POINTER; a_string: POINTER; a_type_annotate: INTEGER): POINTER 
               -- g_variant_print_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_print_string"
               }"
               end

	g_variant_ref (a_value: POINTER): POINTER 
               -- g_variant_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_ref"
               }"
               end

	g_variant_ref_sink (a_value: POINTER): POINTER 
               -- g_variant_ref_sink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_ref_sink"
               }"
               end

	g_variant_store (a_value: POINTER; a_data: POINTER) 
               -- g_variant_store
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_store"
               }"
               end

	g_variant_take_ref (a_value: POINTER): POINTER 
               -- g_variant_take_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_take_ref"
               }"
               end

	g_variant_unref (a_value: POINTER) 
               -- g_variant_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_variant_unref"
               }"
               end


end -- class GVARIANT_EXTERNALS
