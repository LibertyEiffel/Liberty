-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTEXTBUFFERRICHTEXT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_text_buffer_deserialize (a_register_buffer: POINTER; a_content_buffer: POINTER; a_format: POINTER; an_iter: POINTER; a_data: POINTER; a_length: NATURAL; an_error: POINTER): INTEGER is
 		-- gtk_text_buffer_deserialize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_deserialize"
		}"
		end

	gtk_text_buffer_deserialize_get_can_create_tags (a_buffer: POINTER; a_format: POINTER): INTEGER is
 		-- gtk_text_buffer_deserialize_get_can_create_tags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_deserialize_get_can_create_tags"
		}"
		end

	gtk_text_buffer_deserialize_set_can_create_tags (a_buffer: POINTER; a_format: POINTER; a_can_create_tags: INTEGER) is
 		-- gtk_text_buffer_deserialize_set_can_create_tags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_deserialize_set_can_create_tags"
		}"
		end

	gtk_text_buffer_get_deserialize_formats (a_buffer: POINTER; a_n_formats: POINTER): POINTER is
 		-- gtk_text_buffer_get_deserialize_formats
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_deserialize_formats"
		}"
		end

	gtk_text_buffer_get_serialize_formats (a_buffer: POINTER; a_n_formats: POINTER): POINTER is
 		-- gtk_text_buffer_get_serialize_formats
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_get_serialize_formats"
		}"
		end

	gtk_text_buffer_register_deserialize_format (a_buffer: POINTER; a_mime_type: POINTER; a_function: POINTER; an_user_data: POINTER; an_user_data_destroy: POINTER): POINTER is
 		-- gtk_text_buffer_register_deserialize_format
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_deserialize_format"
		}"
		end

	gtk_text_buffer_register_deserialize_tagset (a_buffer: POINTER; a_tagset_name: POINTER): POINTER is
 		-- gtk_text_buffer_register_deserialize_tagset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_deserialize_tagset"
		}"
		end

	gtk_text_buffer_register_serialize_format (a_buffer: POINTER; a_mime_type: POINTER; a_function: POINTER; an_user_data: POINTER; an_user_data_destroy: POINTER): POINTER is
 		-- gtk_text_buffer_register_serialize_format
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_serialize_format"
		}"
		end

	gtk_text_buffer_register_serialize_tagset (a_buffer: POINTER; a_tagset_name: POINTER): POINTER is
 		-- gtk_text_buffer_register_serialize_tagset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_register_serialize_tagset"
		}"
		end

	gtk_text_buffer_serialize (a_register_buffer: POINTER; a_content_buffer: POINTER; a_format: POINTER; a_start: POINTER; an_end_external: POINTER; a_length: POINTER): POINTER is
 		-- gtk_text_buffer_serialize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_serialize"
		}"
		end

	gtk_text_buffer_unregister_deserialize_format (a_buffer: POINTER; a_format: POINTER) is
 		-- gtk_text_buffer_unregister_deserialize_format
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_unregister_deserialize_format"
		}"
		end

	gtk_text_buffer_unregister_serialize_format (a_buffer: POINTER; a_format: POINTER) is
 		-- gtk_text_buffer_unregister_serialize_format
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_unregister_serialize_format"
		}"
		end


end -- class GTKTEXTBUFFERRICHTEXT_EXTERNALS
