-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTCHOOSERMENU_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_recent_chooser_menu_get_type: NATURAL_32 is
 		-- gtk_recent_chooser_menu_get_type (node at line 2812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_menu_get_type()"
		}"
		end

	gtk_recent_chooser_menu_new_for_manager (a_manager: POINTER): POINTER is
 		-- gtk_recent_chooser_menu_new_for_manager (node at line 12360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_menu_new_for_manager"
		}"
		end

	gtk_recent_chooser_menu_set_show_numbers (a_menu: POINTER; a_show_numbers: INTEGER_32) is
 		-- gtk_recent_chooser_menu_set_show_numbers (node at line 16318)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_menu_set_show_numbers"
		}"
		end

	gtk_recent_chooser_menu_get_show_numbers (a_menu: POINTER): INTEGER_32 is
 		-- gtk_recent_chooser_menu_get_show_numbers (node at line 20643)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_menu_get_show_numbers"
		}"
		end

	gtk_recent_chooser_menu_new: POINTER is
 		-- gtk_recent_chooser_menu_new (node at line 22997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_chooser_menu_new()"
		}"
		end


end -- class GTKRECENTCHOOSERMENU_EXTERNALS
