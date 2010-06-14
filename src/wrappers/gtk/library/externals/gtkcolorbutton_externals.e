-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORBUTTON_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_button_set_color (a_color_button: POINTER; a_color: POINTER) is
 		-- gtk_color_button_set_color (node at line 1386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_color"
		}"
		end

	gtk_color_button_set_title (a_color_button: POINTER; a_title: POINTER) is
 		-- gtk_color_button_set_title (node at line 9684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_title"
		}"
		end

	gtk_color_button_get_use_alpha (a_color_button: POINTER): INTEGER_32 is
 		-- gtk_color_button_get_use_alpha (node at line 11796)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_use_alpha"
		}"
		end

	gtk_color_button_get_alpha (a_color_button: POINTER): NATURAL_16 is
 		-- gtk_color_button_get_alpha (node at line 13708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_alpha"
		}"
		end

	gtk_color_button_new_with_color (a_color: POINTER): POINTER is
 		-- gtk_color_button_new_with_color (node at line 17327)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_new_with_color"
		}"
		end

	gtk_color_button_new: POINTER is
 		-- gtk_color_button_new (node at line 17373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_new()"
		}"
		end

	gtk_color_button_get_type: NATURAL_32 is
 		-- gtk_color_button_get_type (node at line 19109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_type()"
		}"
		end

	gtk_color_button_set_alpha (a_color_button: POINTER; an_alpha: NATURAL_16) is
 		-- gtk_color_button_set_alpha (node at line 22278)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_alpha"
		}"
		end

	gtk_color_button_set_use_alpha (a_color_button: POINTER; an_use_alpha: INTEGER_32) is
 		-- gtk_color_button_set_use_alpha (node at line 28268)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_set_use_alpha"
		}"
		end

	gtk_color_button_get_color (a_color_button: POINTER; a_color: POINTER) is
 		-- gtk_color_button_get_color (node at line 30784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_color"
		}"
		end

	gtk_color_button_get_title (a_color_button: POINTER): POINTER is
 		-- gtk_color_button_get_title (node at line 37604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_button_get_title"
		}"
		end


end -- class GTKCOLORBUTTON_EXTERNALS
