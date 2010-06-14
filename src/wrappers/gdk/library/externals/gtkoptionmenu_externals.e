-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKOPTIONMENU_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_option_menu_get_type: NATURAL_32 is
 		-- gtk_option_menu_get_type (node at line 2440)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_get_type()"
		}"
		end

	gtk_option_menu_remove_menu (an_option_menu: POINTER) is
 		-- gtk_option_menu_remove_menu (node at line 4770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_remove_menu"
		}"
		end

	gtk_option_menu_new: POINTER is
 		-- gtk_option_menu_new (node at line 9029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_new()"
		}"
		end

	gtk_option_menu_get_menu (an_option_menu: POINTER): POINTER is
 		-- gtk_option_menu_get_menu (node at line 18043)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_get_menu"
		}"
		end

	gtk_option_menu_get_history (an_option_menu: POINTER): INTEGER_32 is
 		-- gtk_option_menu_get_history (node at line 19579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_get_history"
		}"
		end

	gtk_option_menu_set_history (an_option_menu: POINTER; an_index: NATURAL_32) is
 		-- gtk_option_menu_set_history (node at line 25270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_set_history"
		}"
		end

	gtk_option_menu_set_menu (an_option_menu: POINTER; a_menu: POINTER) is
 		-- gtk_option_menu_set_menu (node at line 34316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_option_menu_set_menu"
		}"
		end


end -- class GTKOPTIONMENU_EXTERNALS
