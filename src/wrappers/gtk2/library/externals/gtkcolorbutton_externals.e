-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_button_set_color (a_color_button: POINTER; a_color: POINTER) is
 		-- gtk_color_button_set_color (node at line 1336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_color"
		}"
		end

	gtk_color_button_set_title (a_color_button: POINTER; a_title: POINTER) is
 		-- gtk_color_button_set_title (node at line 10458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_title"
		}"
		end

	gtk_color_button_get_use_alpha (a_color_button: POINTER): INTEGER_32 is
 		-- gtk_color_button_get_use_alpha (node at line 12836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_use_alpha"
		}"
		end

	gtk_color_button_get_alpha (a_color_button: POINTER): NATURAL_16 is
 		-- gtk_color_button_get_alpha (node at line 14770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_alpha"
		}"
		end

	gtk_color_button_new_with_color (a_color: POINTER): POINTER is
 		-- gtk_color_button_new_with_color (node at line 18969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_new_with_color"
		}"
		end

	gtk_color_button_new: POINTER is
 		-- gtk_color_button_new (node at line 19016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_new()"
		}"
		end

	gtk_color_button_get_type: NATURAL_64 is
 		-- gtk_color_button_get_type (node at line 20889)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_type()"
		}"
		end

	gtk_color_button_set_alpha (a_color_button: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_button_set_alpha (node at line 24542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_alpha"
		}"
		end

	gtk_color_button_set_use_alpha (a_color_button: POINTER; an_use_alpha: INTEGER_32) is
 		-- gtk_color_button_set_use_alpha (node at line 31314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_use_alpha"
		}"
		end

	gtk_color_button_get_color (a_color_button: POINTER; a_color: POINTER) is
 		-- gtk_color_button_get_color (node at line 34004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_color"
		}"
		end

	gtk_color_button_get_title (a_color_button: POINTER): POINTER is
 		-- gtk_color_button_get_title (node at line 41307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_title"
		}"
		end


end -- class GTKCOLORBUTTON_EXTERNALS
