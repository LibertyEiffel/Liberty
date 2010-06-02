-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVARIANT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_variant_parser_get_error_quark: NATURAL_32 is
 		-- g_variant_parser_get_error_quark (node at line 96)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_parser_get_error_quark()"
		}"
		end

	g_variant_new_double (a_floating: REAL_64): POINTER is
 		-- g_variant_new_double (node at line 194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_double"
		}"
		end

	g_variant_new_boolean (a_boolean: INTEGER_32): POINTER is
 		-- g_variant_new_boolean (node at line 238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_boolean"
		}"
		end

	g_variant_dup_strv (a_value: POINTER; a_length: POINTER): POINTER is
 		-- g_variant_dup_strv (node at line 255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_dup_strv"
		}"
		end

	g_variant_get_strv (a_value: POINTER; a_length: POINTER): POINTER is
 		-- g_variant_get_strv (node at line 259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_strv"
		}"
		end

	g_variant_new_strv (a_strv: POINTER; a_length: INTEGER_32): POINTER is
 		-- g_variant_new_strv (node at line 324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_strv"
		}"
		end

	g_variant_get_maybe (a_value: POINTER): POINTER is
 		-- g_variant_get_maybe (node at line 337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_maybe"
		}"
		end

	g_variant_byteswap (a_value: POINTER): POINTER is
 		-- g_variant_byteswap (node at line 419)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_byteswap"
		}"
		end

	g_variant_get_type_string (a_value: POINTER): POINTER is
 		-- g_variant_get_type_string (node at line 570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_type_string"
		}"
		end

	g_variant_get_byte (a_value: POINTER): CHARACTER is
 		-- g_variant_get_byte (node at line 620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_byte"
		}"
		end

	g_variant_builder_ref (a_builder: POINTER): POINTER is
 		-- g_variant_builder_ref (node at line 645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_ref"
		}"
		end

	g_variant_new_int16 (an_int16: INTEGER_16): POINTER is
 		-- g_variant_new_int16 (node at line 700)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_int16"
		}"
		end

	g_variant_new_signature (a_signature: POINTER): POINTER is
 		-- g_variant_new_signature (node at line 714)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_signature"
		}"
		end

	g_variant_new_int32 (an_int32: INTEGER_32): POINTER is
 		-- g_variant_new_int32 (node at line 757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_int32"
		}"
		end

	g_variant_new_parsed (a_format: POINTER): POINTER is
 		-- g_variant_new_parsed (variadic call)  (node at line 829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_parsed"
		}"
		end

	g_variant_parse (a_type: POINTER; a_text: POINTER; a_limit: POINTER; an_endptr: POINTER; an_error: POINTER): POINTER is
 		-- g_variant_parse (node at line 840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_parse"
		}"
		end

	g_variant_new_variant (a_value: POINTER): POINTER is
 		-- g_variant_new_variant (node at line 995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_variant"
		}"
		end

	g_variant_new_parsed_va (a_format: POINTER; an_app: POINTER): POINTER is
 		-- g_variant_new_parsed_va (node at line 1232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_parsed_va"
		}"
		end

	g_variant_iter_init (an_iter: POINTER; a_value: POINTER): NATURAL_32 is
 		-- g_variant_iter_init (node at line 1304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_init"
		}"
		end

	g_variant_builder_open (a_builder: POINTER; a_type: POINTER) is
 		-- g_variant_builder_open (node at line 1368)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_open"
		}"
		end

	g_variant_new_va (a_format_string: POINTER; an_endptr: POINTER; an_app: POINTER): POINTER is
 		-- g_variant_new_va (node at line 1418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_va"
		}"
		end

	g_variant_new_int64 (an_int64: INTEGER_64): POINTER is
 		-- g_variant_new_int64 (node at line 1808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_int64"
		}"
		end

	g_variant_iter_loop (an_iter: POINTER; a_format_string: POINTER): INTEGER_32 is
 		-- g_variant_iter_loop (variadic call)  (node at line 1978)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_loop"
		}"
		end

	g_variant_is_object_path (a_string: POINTER): INTEGER_32 is
 		-- g_variant_is_object_path (node at line 2069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_is_object_path"
		}"
		end

	g_variant_unref (a_value: POINTER) is
 		-- g_variant_unref (node at line 2308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_unref"
		}"
		end

	g_variant_iter_next (an_iter: POINTER; a_format_string: POINTER): INTEGER_32 is
 		-- g_variant_iter_next (variadic call)  (node at line 2344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_next"
		}"
		end

	g_variant_hash (a_value: POINTER): NATURAL_32 is
 		-- g_variant_hash (node at line 2351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_hash"
		}"
		end

	g_variant_is_signature (a_string: POINTER): INTEGER_32 is
 		-- g_variant_is_signature (node at line 2487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_is_signature"
		}"
		end

	g_variant_get_uint32 (a_value: POINTER): NATURAL_32 is
 		-- g_variant_get_uint32 (node at line 2506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_uint32"
		}"
		end

	g_variant_iter_copy (an_iter: POINTER): POINTER is
 		-- g_variant_iter_copy (node at line 2522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_copy"
		}"
		end

	g_variant_equal (an_one: POINTER; a_two: POINTER): INTEGER_32 is
 		-- g_variant_equal (node at line 2622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_equal"
		}"
		end

	g_variant_new_byte (a_byte: CHARACTER): POINTER is
 		-- g_variant_new_byte (node at line 2721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_byte"
		}"
		end

	g_variant_get_va (a_value: POINTER; a_format_string: POINTER; an_endptr: POINTER; an_app: POINTER) is
 		-- g_variant_get_va (node at line 2751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_va"
		}"
		end

	g_variant_iter_n_children (an_iter: POINTER): NATURAL_32 is
 		-- g_variant_iter_n_children (node at line 2778)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_n_children"
		}"
		end

	g_variant_new_maybe (a_child_type: POINTER; a_child: POINTER): POINTER is
 		-- g_variant_new_maybe (node at line 2798)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_maybe"
		}"
		end

	g_variant_get_int16 (a_value: POINTER): INTEGER_16 is
 		-- g_variant_get_int16 (node at line 2858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_int16"
		}"
		end

	g_variant_get_int32 (a_value: POINTER): INTEGER_32 is
 		-- g_variant_get_int32 (node at line 2912)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_int32"
		}"
		end

	g_variant_get_int64 (a_value: POINTER): INTEGER_64 is
 		-- g_variant_get_int64 (node at line 2938)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_int64"
		}"
		end

	g_variant_builder_add (a_builder: POINTER; a_format_string: POINTER) is
 		-- g_variant_builder_add (variadic call)  (node at line 2948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_add"
		}"
		end

	g_variant_get_handle (a_value: POINTER): INTEGER_32 is
 		-- g_variant_get_handle (node at line 3013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_handle"
		}"
		end

	g_variant_is_container (a_value: POINTER): INTEGER_32 is
 		-- g_variant_is_container (node at line 3068)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_is_container"
		}"
		end

	g_variant_store (a_value: POINTER; a_data: POINTER) is
 		-- g_variant_store (node at line 3080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_store"
		}"
		end

	g_variant_new_dict_entry (a_key: POINTER; a_value: POINTER): POINTER is
 		-- g_variant_new_dict_entry (node at line 3084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_dict_entry"
		}"
		end

	g_variant_new_uint16 (an_uint16: NATURAL_16): POINTER is
 		-- g_variant_new_uint16 (node at line 3193)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_uint16"
		}"
		end

	g_variant_get_string (a_value: POINTER; a_length: POINTER): POINTER is
 		-- g_variant_get_string (node at line 3328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_string"
		}"
		end

	g_variant_builder_clear (a_builder: POINTER) is
 		-- g_variant_builder_clear (node at line 3507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_clear"
		}"
		end

	g_variant_ref_sink (a_value: POINTER): POINTER is
 		-- g_variant_ref_sink (node at line 3671)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_ref_sink"
		}"
		end

	g_variant_new (a_format_string: POINTER): POINTER is
 		-- g_variant_new (variadic call)  (node at line 3704)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new"
		}"
		end

	g_variant_new_object_path (an_object_path: POINTER): POINTER is
 		-- g_variant_new_object_path (node at line 3841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_object_path"
		}"
		end

	g_variant_get_double (a_value: POINTER): REAL_64 is
 		-- g_variant_get_double (node at line 3848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_double"
		}"
		end

	g_variant_builder_init (a_builder: POINTER; a_type: POINTER) is
 		-- g_variant_builder_init (node at line 3858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_init"
		}"
		end

	g_variant_new_from_data (a_type: POINTER; a_data: POINTER; a_size: NATURAL_32; a_trusted: INTEGER_32; a_notify: POINTER; an_user_data: POINTER): POINTER is
 		-- g_variant_new_from_data (node at line 3928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_from_data"
		}"
		end

	g_variant_get_boolean (a_value: POINTER): INTEGER_32 is
 		-- g_variant_get_boolean (node at line 4034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_boolean"
		}"
		end

	g_variant_is_normal_form (a_value: POINTER): INTEGER_32 is
 		-- g_variant_is_normal_form (node at line 4185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_is_normal_form"
		}"
		end

	g_variant_get_fixed_array (a_value: POINTER; a_n_elements: POINTER; an_element_size: NATURAL_32): POINTER is
 		-- g_variant_get_fixed_array (node at line 4206)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_fixed_array"
		}"
		end

	g_variant_new_uint32 (an_uint32: NATURAL_32): POINTER is
 		-- g_variant_new_uint32 (node at line 4248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_uint32"
		}"
		end

	g_variant_get (a_value: POINTER; a_format_string: POINTER) is
 		-- g_variant_get (variadic call)  (node at line 4265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get"
		}"
		end

	g_variant_iter_free (an_iter: POINTER) is
 		-- g_variant_iter_free (node at line 4292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_free"
		}"
		end

	g_variant_n_children (a_value: POINTER): NATURAL_32 is
 		-- g_variant_n_children (node at line 4317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_n_children"
		}"
		end

	g_variant_ref (a_value: POINTER): POINTER is
 		-- g_variant_ref (node at line 4350)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_ref"
		}"
		end

	g_variant_iter_next_value (an_iter: POINTER): POINTER is
 		-- g_variant_iter_next_value (node at line 4612)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_next_value"
		}"
		end

	g_variant_builder_add_value (a_builder: POINTER; a_value: POINTER) is
 		-- g_variant_builder_add_value (node at line 4728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_add_value"
		}"
		end

	g_variant_is_of_type (a_value: POINTER; a_type: POINTER): INTEGER_32 is
 		-- g_variant_is_of_type (node at line 4771)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_is_of_type"
		}"
		end

	g_variant_print (a_value: POINTER; a_type_annotate: INTEGER_32): POINTER is
 		-- g_variant_print (node at line 4847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_print"
		}"
		end

	g_variant_get_data (a_value: POINTER): POINTER is
 		-- g_variant_get_data (node at line 4873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_data"
		}"
		end

	g_variant_get_type (a_value: POINTER): POINTER is
 		-- g_variant_get_type (node at line 5161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_type"
		}"
		end

	g_variant_dup_string (a_value: POINTER; a_length: POINTER): POINTER is
 		-- g_variant_dup_string (node at line 5489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_dup_string"
		}"
		end

	g_variant_builder_close (a_builder: POINTER) is
 		-- g_variant_builder_close (node at line 5640)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_close"
		}"
		end

	g_variant_get_uint16 (a_value: POINTER): NATURAL_16 is
 		-- g_variant_get_uint16 (node at line 5647)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_uint16"
		}"
		end

	g_variant_new_handle (a_handle: INTEGER_32): POINTER is
 		-- g_variant_new_handle (node at line 5675)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_handle"
		}"
		end

	g_variant_iter_new (a_value: POINTER): POINTER is
 		-- g_variant_iter_new (node at line 5698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_iter_new"
		}"
		end

	g_variant_new_uint64 (an_uint64: NATURAL_64): POINTER is
 		-- g_variant_new_uint64 (node at line 5726)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_uint64"
		}"
		end

	g_variant_classify (a_value: POINTER): INTEGER is
 		-- g_variant_classify (node at line 5729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_classify"
		}"
		end

	g_variant_get_child_value (a_value: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_variant_get_child_value (node at line 5752)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_child_value"
		}"
		end

	g_variant_get_uint64 (a_value: POINTER): NATURAL_64 is
 		-- g_variant_get_uint64 (node at line 5804)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_uint64"
		}"
		end

	g_variant_get_variant (a_value: POINTER): POINTER is
 		-- g_variant_get_variant (node at line 5929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_variant"
		}"
		end

	g_variant_new_array (a_child_type: POINTER; a_children: POINTER; a_n_children: NATURAL_32): POINTER is
 		-- g_variant_new_array (node at line 6002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_array"
		}"
		end

	g_variant_get_normal_form (a_value: POINTER): POINTER is
 		-- g_variant_get_normal_form (node at line 6141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_normal_form"
		}"
		end

	g_variant_builder_end (a_builder: POINTER): POINTER is
 		-- g_variant_builder_end (node at line 6536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_end"
		}"
		end

	g_variant_new_tuple (a_children: POINTER; a_n_children: NATURAL_32): POINTER is
 		-- g_variant_new_tuple (node at line 6589)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_tuple"
		}"
		end

	g_variant_get_child (a_value: POINTER; an_index: NATURAL_32; a_format_string: POINTER) is
 		-- g_variant_get_child (variadic call)  (node at line 6623)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_child"
		}"
		end

	g_variant_print_string (a_value: POINTER; a_string: POINTER; a_type_annotate: INTEGER_32): POINTER is
 		-- g_variant_print_string (node at line 6629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_print_string"
		}"
		end

	g_variant_new_string (a_string: POINTER): POINTER is
 		-- g_variant_new_string (node at line 6754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_new_string"
		}"
		end

	g_variant_get_size (a_value: POINTER): NATURAL_32 is
 		-- g_variant_get_size (node at line 6785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_get_size"
		}"
		end

	g_variant_builder_unref (a_builder: POINTER) is
 		-- g_variant_builder_unref (node at line 6838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_unref"
		}"
		end

	g_variant_builder_new (a_type: POINTER): POINTER is
 		-- g_variant_builder_new (node at line 6926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_variant_builder_new"
		}"
		end


end -- class GVARIANT_EXTERNALS
