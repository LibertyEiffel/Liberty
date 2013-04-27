-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSELDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_selection_dialog_get_color_selection (a_colorsel: POINTER): POINTER is
 		-- gtk_color_selection_dialog_get_color_selection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_dialog_get_color_selection"
		}"
		end

	gtk_color_selection_dialog_get_type: like long_unsigned is
 		-- gtk_color_selection_dialog_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_dialog_get_type()"
		}"
		end

	gtk_color_selection_dialog_new (a_title: POINTER): POINTER is
 		-- gtk_color_selection_dialog_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_dialog_new"
		}"
		end


end -- class GTKCOLORSELDIALOG_EXTERNALS
