-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBBOX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_button_box_set_child_secondary (a_widget: POINTER; a_child: POINTER; an_is_secondary: INTEGER_32) is
 		-- gtk_button_box_set_child_secondary (node at line 279)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_child_secondary"
		}"
		end

	gtk_button_box_set_layout (a_widget: POINTER; a_layout_style: INTEGER) is
 		-- gtk_button_box_set_layout (node at line 13160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_layout"
		}"
		end

	gtk_button_box_get_type: NATURAL_64 is
 		-- gtk_button_box_get_type (node at line 13902)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_type()"
		}"
		end

	gtk_button_box_get_child_secondary (a_widget: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_button_box_get_child_secondary (node at line 28076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_child_secondary"
		}"
		end

	gtk_button_box_get_layout (a_widget: POINTER): INTEGER is
 		-- gtk_button_box_get_layout (node at line 31868)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_layout"
		}"
		end

	-- `hidden' function _gtk_button_box_child_requisition skipped.

end -- class GTKBBOX_EXTERNALS
