-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLITEMGROUP_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_item_group_insert (a_group: POINTER; an_item: POINTER; a_position: INTEGER_32) is
 		-- gtk_tool_item_group_insert (node at line 1085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_insert"
		}"
		end

	gtk_tool_item_group_set_label_widget (a_group: POINTER; a_label_widget: POINTER) is
 		-- gtk_tool_item_group_set_label_widget (node at line 2354)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_label_widget"
		}"
		end

	gtk_tool_item_group_set_header_relief (a_group: POINTER; a_style: INTEGER) is
 		-- gtk_tool_item_group_set_header_relief (node at line 6234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_header_relief"
		}"
		end

	gtk_tool_item_group_new (a_label: POINTER): POINTER is
 		-- gtk_tool_item_group_new (node at line 8485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_new"
		}"
		end

	gtk_tool_item_group_get_ellipsize (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_ellipsize (node at line 9505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_ellipsize"
		}"
		end

	gtk_tool_item_group_set_ellipsize (a_group: POINTER; an_ellipsize: INTEGER) is
 		-- gtk_tool_item_group_set_ellipsize (node at line 13648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_ellipsize"
		}"
		end

	gtk_tool_item_group_get_label_widget (a_group: POINTER): POINTER is
 		-- gtk_tool_item_group_get_label_widget (node at line 14136)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_label_widget"
		}"
		end

	gtk_tool_item_group_get_type: NATURAL_32 is
 		-- gtk_tool_item_group_get_type (node at line 18302)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_type()"
		}"
		end

	gtk_tool_item_group_get_n_items (a_group: POINTER): NATURAL_32 is
 		-- gtk_tool_item_group_get_n_items (node at line 20827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_n_items"
		}"
		end

	gtk_tool_item_group_get_nth_item (a_group: POINTER; an_index: NATURAL_32): POINTER is
 		-- gtk_tool_item_group_get_nth_item (node at line 21781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_nth_item"
		}"
		end

	gtk_tool_item_group_get_drop_item (a_group: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gtk_tool_item_group_get_drop_item (node at line 27229)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_drop_item"
		}"
		end

	gtk_tool_item_group_get_collapsed (a_group: POINTER): INTEGER_32 is
 		-- gtk_tool_item_group_get_collapsed (node at line 27537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_collapsed"
		}"
		end

	gtk_tool_item_group_get_label (a_group: POINTER): POINTER is
 		-- gtk_tool_item_group_get_label (node at line 30357)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_label"
		}"
		end

	gtk_tool_item_group_set_item_position (a_group: POINTER; an_item: POINTER; a_position: INTEGER_32) is
 		-- gtk_tool_item_group_set_item_position (node at line 31207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_item_position"
		}"
		end

	gtk_tool_item_group_set_collapsed (a_group: POINTER; a_collapsed: INTEGER_32) is
 		-- gtk_tool_item_group_set_collapsed (node at line 31434)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_collapsed"
		}"
		end

	gtk_tool_item_group_get_item_position (a_group: POINTER; an_item: POINTER): INTEGER_32 is
 		-- gtk_tool_item_group_get_item_position (node at line 36741)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_item_position"
		}"
		end

	gtk_tool_item_group_get_header_relief (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_header_relief (node at line 37580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_header_relief"
		}"
		end

	gtk_tool_item_group_set_label (a_group: POINTER; a_label: POINTER) is
 		-- gtk_tool_item_group_set_label (node at line 37619)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_label"
		}"
		end


end -- class GTKTOOLITEMGROUP_EXTERNALS
