-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSELDIALOG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_color_selection_dialog_get_type: NATURAL_64 is
 		-- gtk_color_selection_dialog_get_type (node at line 16901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_dialog_get_type()"
		}"
		end

	gtk_color_selection_dialog_new (a_title: POINTER): POINTER is
 		-- gtk_color_selection_dialog_new (node at line 27558)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_dialog_new"
		}"
		end

	gtk_color_selection_dialog_get_color_selection (a_colorsel: POINTER): POINTER is
 		-- gtk_color_selection_dialog_get_color_selection (node at line 28118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_color_selection_dialog_get_color_selection"
		}"
		end


end -- class GTKCOLORSELDIALOG_EXTERNALS
