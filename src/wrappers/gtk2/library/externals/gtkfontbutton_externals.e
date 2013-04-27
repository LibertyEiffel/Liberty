-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFONTBUTTON_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_font_button_get_font_name (a_font_button: POINTER): POINTER is
 		-- gtk_font_button_get_font_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_font_name"
		}"
		end

	gtk_font_button_get_show_size (a_font_button: POINTER): INTEGER is
 		-- gtk_font_button_get_show_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_show_size"
		}"
		end

	gtk_font_button_get_show_style (a_font_button: POINTER): INTEGER is
 		-- gtk_font_button_get_show_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_show_style"
		}"
		end

	gtk_font_button_get_title (a_font_button: POINTER): POINTER is
 		-- gtk_font_button_get_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_title"
		}"
		end

	gtk_font_button_get_type: like long_unsigned is
 		-- gtk_font_button_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_type()"
		}"
		end

	gtk_font_button_get_use_font (a_font_button: POINTER): INTEGER is
 		-- gtk_font_button_get_use_font
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_use_font"
		}"
		end

	gtk_font_button_get_use_size (a_font_button: POINTER): INTEGER is
 		-- gtk_font_button_get_use_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_get_use_size"
		}"
		end

	gtk_font_button_new: POINTER is
 		-- gtk_font_button_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_new()"
		}"
		end

	gtk_font_button_new_with_font (a_fontname: POINTER): POINTER is
 		-- gtk_font_button_new_with_font
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_new_with_font"
		}"
		end

	gtk_font_button_set_font_name (a_font_button: POINTER; a_fontname: POINTER): INTEGER is
 		-- gtk_font_button_set_font_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_set_font_name"
		}"
		end

	gtk_font_button_set_show_size (a_font_button: POINTER; a_show_size: INTEGER) is
 		-- gtk_font_button_set_show_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_set_show_size"
		}"
		end

	gtk_font_button_set_show_style (a_font_button: POINTER; a_show_style: INTEGER) is
 		-- gtk_font_button_set_show_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_set_show_style"
		}"
		end

	gtk_font_button_set_title (a_font_button: POINTER; a_title: POINTER) is
 		-- gtk_font_button_set_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_set_title"
		}"
		end

	gtk_font_button_set_use_font (a_font_button: POINTER; an_use_font: INTEGER) is
 		-- gtk_font_button_set_use_font
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_set_use_font"
		}"
		end

	gtk_font_button_set_use_size (a_font_button: POINTER; an_use_size: INTEGER) is
 		-- gtk_font_button_set_use_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_font_button_set_use_size"
		}"
		end


end -- class GTKFONTBUTTON_EXTERNALS
