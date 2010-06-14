-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBBOX_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_button_box_set_child_secondary (a_widget: POINTER; a_child: POINTER; an_is_secondary: INTEGER_32) is
 		-- gtk_button_box_set_child_secondary (node at line 269)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_child_secondary"
		}"
		end

	gtk_button_box_get_child_size (a_widget: POINTER; a_min_width: POINTER; a_min_height: POINTER) is
 		-- gtk_button_box_get_child_size (node at line 849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_child_size"
		}"
		end

	gtk_button_box_set_child_size (a_widget: POINTER; a_min_width: INTEGER_32; a_min_height: INTEGER_32) is
 		-- gtk_button_box_set_child_size (node at line 6806)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_child_size"
		}"
		end

	-- `hidden' function _gtk_button_box_child_requisition skipped.
	gtk_button_box_set_layout (a_widget: POINTER; a_layout_style: INTEGER) is
 		-- gtk_button_box_set_layout (node at line 12080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_layout"
		}"
		end

	gtk_button_box_get_type: NATURAL_32 is
 		-- gtk_button_box_get_type (node at line 12779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_type()"
		}"
		end

	gtk_button_box_get_child_ipadding (a_widget: POINTER; an_ipad_x: POINTER; an_ipad_y: POINTER) is
 		-- gtk_button_box_get_child_ipadding (node at line 19366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_child_ipadding"
		}"
		end

	gtk_button_box_get_child_secondary (a_widget: POINTER; a_child: POINTER): INTEGER_32 is
 		-- gtk_button_box_get_child_secondary (node at line 25328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_child_secondary"
		}"
		end

	gtk_button_box_set_child_ipadding (a_widget: POINTER; an_ipad_x: INTEGER_32; an_ipad_y: INTEGER_32) is
 		-- gtk_button_box_set_child_ipadding (node at line 28595)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_set_child_ipadding"
		}"
		end

	gtk_button_box_get_layout (a_widget: POINTER): INTEGER is
 		-- gtk_button_box_get_layout (node at line 28886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_button_box_get_layout"
		}"
		end


end -- class GTKBBOX_EXTERNALS
