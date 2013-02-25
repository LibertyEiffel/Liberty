-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUILDER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_builder_connect_signals_full (a_builder: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- gtk_builder_connect_signals_full (node at line 10684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_connect_signals_full"
		}"
		end

	gtk_builder_add_objects_from_string (a_builder: POINTER; a_buffer: POINTER; a_length: NATURAL_64; an_object_ids: POINTER; an_error: POINTER): NATURAL_32 is
 		-- gtk_builder_add_objects_from_string (node at line 12473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_objects_from_string"
		}"
		end

	gtk_builder_add_from_string (a_builder: POINTER; a_buffer: POINTER; a_length: NATURAL_64; an_error: POINTER): NATURAL_32 is
 		-- gtk_builder_add_from_string (node at line 14161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_from_string"
		}"
		end

	gtk_builder_get_type: NATURAL_64 is
 		-- gtk_builder_get_type (node at line 16929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_type()"
		}"
		end

	gtk_builder_error_quark: NATURAL_32 is
 		-- gtk_builder_error_quark (node at line 17847)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_error_quark()"
		}"
		end

	gtk_builder_get_translation_domain (a_builder: POINTER): POINTER is
 		-- gtk_builder_get_translation_domain (node at line 17931)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_translation_domain"
		}"
		end

	gtk_builder_value_from_string_type (a_builder: POINTER; a_type: NATURAL_64; a_string: POINTER; a_value: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_builder_value_from_string_type (node at line 18180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_value_from_string_type"
		}"
		end

	gtk_builder_set_translation_domain (a_builder: POINTER; a_domain: POINTER) is
 		-- gtk_builder_set_translation_domain (node at line 19568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_set_translation_domain"
		}"
		end

	gtk_builder_add_objects_from_file (a_builder: POINTER; a_filename: POINTER; an_object_ids: POINTER; an_error: POINTER): NATURAL_32 is
 		-- gtk_builder_add_objects_from_file (node at line 21351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_objects_from_file"
		}"
		end

	gtk_builder_add_from_file (a_builder: POINTER; a_filename: POINTER; an_error: POINTER): NATURAL_32 is
 		-- gtk_builder_add_from_file (node at line 21389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_add_from_file"
		}"
		end

	gtk_builder_get_objects (a_builder: POINTER): POINTER is
 		-- gtk_builder_get_objects (node at line 23248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_objects"
		}"
		end

	gtk_builder_value_from_string (a_builder: POINTER; a_pspec: POINTER; a_string: POINTER; a_value: POINTER; an_error: POINTER): INTEGER_32 is
 		-- gtk_builder_value_from_string (node at line 25320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_value_from_string"
		}"
		end

	gtk_builder_get_object (a_builder: POINTER; a_name: POINTER): POINTER is
 		-- gtk_builder_get_object (node at line 28318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_object"
		}"
		end

	gtk_builder_connect_signals (a_builder: POINTER; an_user_data: POINTER) is
 		-- gtk_builder_connect_signals (node at line 31105)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_connect_signals"
		}"
		end

	gtk_builder_get_type_from_name (a_builder: POINTER; a_type_name: POINTER): NATURAL_64 is
 		-- gtk_builder_get_type_from_name (node at line 31326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_get_type_from_name"
		}"
		end

	gtk_builder_new: POINTER is
 		-- gtk_builder_new (node at line 37832)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_builder_new()"
		}"
		end


end -- class GTKBUILDER_EXTERNALS
