-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_button_box_child_requisition skipped.
	gtk_button_box_get_child_secondary (a_widget: POINTER; a_child: POINTER): INTEGER is
 		-- gtk_button_box_get_child_secondary
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_child_secondary"
		}"
		end

	gtk_button_box_get_layout (a_widget: POINTER): INTEGER is
 		-- gtk_button_box_get_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_layout"
		}"
		end

	gtk_button_box_get_type: like long_unsigned is
 		-- gtk_button_box_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_type()"
		}"
		end

	gtk_button_box_set_child_secondary (a_widget: POINTER; a_child: POINTER; an_is_secondary: INTEGER) is
 		-- gtk_button_box_set_child_secondary
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_child_secondary"
		}"
		end

	gtk_button_box_set_layout (a_widget: POINTER; a_layout_style: INTEGER) is
 		-- gtk_button_box_set_layout
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_layout"
		}"
		end


end -- class GTKBBOX_EXTERNALS
