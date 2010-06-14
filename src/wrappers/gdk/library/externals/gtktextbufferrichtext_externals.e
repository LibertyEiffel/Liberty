-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTBUFFERRICHTEXT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_buffer_deserialize_get_can_create_tags (a_buffer: POINTER; a_format: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_deserialize_get_can_create_tags (node at line 3069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_deserialize_get_can_create_tags"
		}"
		end

	gtk_text_buffer_unregister_serialize_format (a_buffer: POINTER; a_format: POINTER) is
 		-- gtk_text_buffer_unregister_serialize_format (node at line 5212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_unregister_serialize_format"
		}"
		end

	gtk_text_buffer_get_serialize_formats (a_buffer: POINTER; a_n_formats: POINTER): POINTER is
 		-- gtk_text_buffer_get_serialize_formats (node at line 14088)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_serialize_formats"
		}"
		end

	gtk_text_buffer_unregister_deserialize_format (a_buffer: POINTER; a_format: POINTER) is
 		-- gtk_text_buffer_unregister_deserialize_format (node at line 16137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_unregister_deserialize_format"
		}"
		end

	gtk_text_buffer_get_deserialize_formats (a_buffer: POINTER; a_n_formats: POINTER): POINTER is
 		-- gtk_text_buffer_get_deserialize_formats (node at line 19977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_deserialize_formats"
		}"
		end

	gtk_text_buffer_deserialize (a_register_buffer: POINTER; a_content_buffer: POINTER; a_format: POINTER; an_iter: POINTER; a_data: POINTER; a_length: NATURAL_32; an_error: POINTER): INTEGER_32 is
 		-- gtk_text_buffer_deserialize (node at line 22101)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_deserialize"
		}"
		end

	gtk_text_buffer_register_serialize_format (a_buffer: POINTER; a_mime_type: POINTER; a_function: POINTER; an_user_data: POINTER; an_user_data_destroy: POINTER): POINTER is
 		-- gtk_text_buffer_register_serialize_format (node at line 23610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_serialize_format"
		}"
		end

	gtk_text_buffer_register_serialize_tagset (a_buffer: POINTER; a_tagset_name: POINTER): POINTER is
 		-- gtk_text_buffer_register_serialize_tagset (node at line 24604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_serialize_tagset"
		}"
		end

	gtk_text_buffer_deserialize_set_can_create_tags (a_buffer: POINTER; a_format: POINTER; a_can_create_tags: INTEGER_32) is
 		-- gtk_text_buffer_deserialize_set_can_create_tags (node at line 29561)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_deserialize_set_can_create_tags"
		}"
		end

	gtk_text_buffer_register_deserialize_format (a_buffer: POINTER; a_mime_type: POINTER; a_function: POINTER; an_user_data: POINTER; an_user_data_destroy: POINTER): POINTER is
 		-- gtk_text_buffer_register_deserialize_format (node at line 29877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_deserialize_format"
		}"
		end

	gtk_text_buffer_register_deserialize_tagset (a_buffer: POINTER; a_tagset_name: POINTER): POINTER is
 		-- gtk_text_buffer_register_deserialize_tagset (node at line 30880)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_deserialize_tagset"
		}"
		end

	gtk_text_buffer_serialize (a_register_buffer: POINTER; a_content_buffer: POINTER; a_format: POINTER; a_start: POINTER; an_end_external: POINTER; a_length: POINTER): POINTER is
 		-- gtk_text_buffer_serialize (node at line 35266)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_serialize"
		}"
		end


end -- class GTKTEXTBUFFERRICHTEXT_EXTERNALS
