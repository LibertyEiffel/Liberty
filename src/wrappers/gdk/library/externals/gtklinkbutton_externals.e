-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLINKBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_link_button_get_visited (a_link_button: POINTER): INTEGER_32 is
 		-- gtk_link_button_get_visited (node at line 4742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_get_visited"
		}"
		end

	gtk_link_button_get_uri (a_link_button: POINTER): POINTER is
 		-- gtk_link_button_get_uri (node at line 8370)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_get_uri"
		}"
		end

	gtk_link_button_set_visited (a_link_button: POINTER; a_visited: INTEGER_32) is
 		-- gtk_link_button_set_visited (node at line 11307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_set_visited"
		}"
		end

	gtk_link_button_new_with_label (an_uri: POINTER; a_label: POINTER): POINTER is
 		-- gtk_link_button_new_with_label (node at line 12104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_new_with_label"
		}"
		end

	gtk_link_button_get_type: NATURAL_32 is
 		-- gtk_link_button_get_type (node at line 22240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_get_type()"
		}"
		end

	gtk_link_button_set_uri (a_link_button: POINTER; an_uri: POINTER) is
 		-- gtk_link_button_set_uri (node at line 26041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_set_uri"
		}"
		end

	gtk_link_button_set_uri_hook (a_func: POINTER; a_data: POINTER; a_destroy: POINTER): POINTER is
 		-- gtk_link_button_set_uri_hook (node at line 32536)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_set_uri_hook"
		}"
		end

	gtk_link_button_new (an_uri: POINTER): POINTER is
 		-- gtk_link_button_new (node at line 33762)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_link_button_new"
		}"
		end


end -- class GTKLINKBUTTON_EXTERNALS
