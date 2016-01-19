-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUILDER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_builder_add_from_file (a_builder: POINTER; a_filename: POINTER; an_error: POINTER): NATURAL is
 		-- gtk_builder_add_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_from_file"
		}"
		end

	gtk_builder_add_from_string (a_builder: POINTER; a_buffer: POINTER; a_length: NATURAL; an_error: POINTER): NATURAL is
 		-- gtk_builder_add_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_from_string"
		}"
		end

	gtk_builder_add_objects_from_file (a_builder: POINTER; a_filename: POINTER; an_object_ids: POINTER; an_error: POINTER): NATURAL is
 		-- gtk_builder_add_objects_from_file
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_objects_from_file"
		}"
		end

	gtk_builder_add_objects_from_string (a_builder: POINTER; a_buffer: POINTER; a_length: NATURAL; an_object_ids: POINTER; an_error: POINTER): NATURAL is
 		-- gtk_builder_add_objects_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_objects_from_string"
		}"
		end

	gtk_builder_connect_signals (a_builder: POINTER; an_user_data: POINTER) is
 		-- gtk_builder_connect_signals
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_connect_signals"
		}"
		end

	gtk_builder_connect_signals_full (a_builder: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_builder_connect_signals_full
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_connect_signals_full"
		}"
		end

	gtk_builder_error_quark: NATURAL is
 		-- gtk_builder_error_quark
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_error_quark()"
		}"
		end

	gtk_builder_get_object (a_builder: POINTER; a_name: POINTER): POINTER is
 		-- gtk_builder_get_object
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_object"
		}"
		end

	gtk_builder_get_objects (a_builder: POINTER): POINTER is
 		-- gtk_builder_get_objects
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_objects"
		}"
		end

	gtk_builder_get_translation_domain (a_builder: POINTER): POINTER is
 		-- gtk_builder_get_translation_domain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_translation_domain"
		}"
		end

	gtk_builder_get_type: like long_unsigned is
 		-- gtk_builder_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_type()"
		}"
		end

	gtk_builder_get_type_from_name (a_builder: POINTER; a_type_name: POINTER): like long_unsigned is
 		-- gtk_builder_get_type_from_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_type_from_name"
		}"
		end

	gtk_builder_new: POINTER is
 		-- gtk_builder_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_new()"
		}"
		end

	gtk_builder_set_translation_domain (a_builder: POINTER; a_domain: POINTER) is
 		-- gtk_builder_set_translation_domain
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_set_translation_domain"
		}"
		end

	gtk_builder_value_from_string (a_builder: POINTER; a_pspec: POINTER; a_string: POINTER; a_value: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_builder_value_from_string
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_value_from_string"
		}"
		end

	gtk_builder_value_from_string_type (a_builder: POINTER; a_type: like long_unsigned; a_string: POINTER; a_value: POINTER; an_error: POINTER): INTEGER is
 		-- gtk_builder_value_from_string_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_value_from_string_type"
		}"
		end


end -- class GTKBUILDER_EXTERNALS
