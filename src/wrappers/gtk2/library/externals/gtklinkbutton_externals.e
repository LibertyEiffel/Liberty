-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLINKBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_link_button_get_type: like long_unsigned is
 		-- gtk_link_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_get_type()"
		}"
		end

	gtk_link_button_get_uri (a_link_button: POINTER): POINTER is
 		-- gtk_link_button_get_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_get_uri"
		}"
		end

	gtk_link_button_get_visited (a_link_button: POINTER): INTEGER is
 		-- gtk_link_button_get_visited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_get_visited"
		}"
		end

	gtk_link_button_new (an_uri: POINTER): POINTER is
 		-- gtk_link_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_new"
		}"
		end

	gtk_link_button_new_with_label (an_uri: POINTER; a_label: POINTER): POINTER is
 		-- gtk_link_button_new_with_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_new_with_label"
		}"
		end

	gtk_link_button_set_uri (a_link_button: POINTER; an_uri: POINTER) is
 		-- gtk_link_button_set_uri
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_set_uri"
		}"
		end

	gtk_link_button_set_visited (a_link_button: POINTER; a_visited: INTEGER) is
 		-- gtk_link_button_set_visited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_set_visited"
		}"
		end


end -- class GTKLINKBUTTON_EXTERNALS
