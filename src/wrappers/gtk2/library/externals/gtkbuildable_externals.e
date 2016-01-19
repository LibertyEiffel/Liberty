-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUILDABLE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_buildable_add_child (a_buildable: POINTER; a_builder: POINTER; a_child: POINTER; a_type: POINTER) is
 		-- gtk_buildable_add_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_add_child"
		}"
		end

	gtk_buildable_construct_child (a_buildable: POINTER; a_builder: POINTER; a_name: POINTER): POINTER is
 		-- gtk_buildable_construct_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_construct_child"
		}"
		end

	gtk_buildable_custom_finished (a_buildable: POINTER; a_builder: POINTER; a_child: POINTER; a_tagname: POINTER; a_data: POINTER) is
 		-- gtk_buildable_custom_finished
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_custom_finished"
		}"
		end

	gtk_buildable_custom_tag_end (a_buildable: POINTER; a_builder: POINTER; a_child: POINTER; a_tagname: POINTER; a_data: POINTER) is
 		-- gtk_buildable_custom_tag_end
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_custom_tag_end"
		}"
		end

	gtk_buildable_custom_tag_start (a_buildable: POINTER; a_builder: POINTER; a_child: POINTER; a_tagname: POINTER; a_parser: POINTER; a_data: POINTER): INTEGER is
 		-- gtk_buildable_custom_tag_start
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_custom_tag_start"
		}"
		end

	gtk_buildable_get_internal_child (a_buildable: POINTER; a_builder: POINTER; a_childname: POINTER): POINTER is
 		-- gtk_buildable_get_internal_child
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_get_internal_child"
		}"
		end

	gtk_buildable_get_name (a_buildable: POINTER): POINTER is
 		-- gtk_buildable_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_get_name"
		}"
		end

	gtk_buildable_get_type: like long_unsigned is
 		-- gtk_buildable_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_get_type()"
		}"
		end

	gtk_buildable_parser_finished (a_buildable: POINTER; a_builder: POINTER) is
 		-- gtk_buildable_parser_finished
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_parser_finished"
		}"
		end

	gtk_buildable_set_buildable_property (a_buildable: POINTER; a_builder: POINTER; a_name: POINTER; a_value: POINTER) is
 		-- gtk_buildable_set_buildable_property
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_set_buildable_property"
		}"
		end

	gtk_buildable_set_name (a_buildable: POINTER; a_name: POINTER) is
 		-- gtk_buildable_set_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_buildable_set_name"
		}"
		end


end -- class GTKBUILDABLE_EXTERNALS
