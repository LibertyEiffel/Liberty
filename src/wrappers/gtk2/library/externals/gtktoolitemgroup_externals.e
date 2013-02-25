-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLITEMGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_item_group_insert (a_group: POINTER; an_item: POINTER; a_position: INTEGER_32) is
 		-- gtk_tool_item_group_insert (node at line 1046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_insert"
		}"
		end

	gtk_tool_item_group_set_label_widget (a_group: POINTER; a_label_widget: POINTER) is
 		-- gtk_tool_item_group_set_label_widget (node at line 2261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_label_widget"
		}"
		end

	gtk_tool_item_group_set_header_relief (a_group: POINTER; a_style: INTEGER) is
 		-- gtk_tool_item_group_set_header_relief (node at line 6834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_header_relief"
		}"
		end

	gtk_tool_item_group_new (a_label: POINTER): POINTER is
 		-- gtk_tool_item_group_new (node at line 9162)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_new"
		}"
		end

	gtk_tool_item_group_get_ellipsize (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_ellipsize (node at line 10291)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_ellipsize"
		}"
		end

	gtk_tool_item_group_set_ellipsize (a_group: POINTER; an_ellipsize: INTEGER) is
 		-- gtk_tool_item_group_set_ellipsize (node at line 14727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_ellipsize"
		}"
		end

	gtk_tool_item_group_get_label_widget (a_group: POINTER): POINTER is
 		-- gtk_tool_item_group_get_label_widget (node at line 15265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_label_widget"
		}"
		end

	gtk_tool_item_group_get_type: NATURAL_64 is
 		-- gtk_tool_item_group_get_type (node at line 19975)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_type()"
		}"
		end

	gtk_tool_item_group_get_n_items (a_group: POINTER): NATURAL_32 is
 		-- gtk_tool_item_group_get_n_items (node at line 22941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_n_items"
		}"
		end

	gtk_tool_item_group_get_nth_item (a_group: POINTER; an_index: NATURAL_32): POINTER is
 		-- gtk_tool_item_group_get_nth_item (node at line 24017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_nth_item"
		}"
		end

	gtk_tool_item_group_get_drop_item (a_group: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gtk_tool_item_group_get_drop_item (node at line 30055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_drop_item"
		}"
		end

	gtk_tool_item_group_get_collapsed (a_group: POINTER): INTEGER_32 is
 		-- gtk_tool_item_group_get_collapsed (node at line 30400)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_collapsed"
		}"
		end

	gtk_tool_item_group_get_label (a_group: POINTER): POINTER is
 		-- gtk_tool_item_group_get_label (node at line 33500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_label"
		}"
		end

	gtk_tool_item_group_set_item_position (a_group: POINTER; an_item: POINTER; a_position: INTEGER_32) is
 		-- gtk_tool_item_group_set_item_position (node at line 34499)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_item_position"
		}"
		end

	gtk_tool_item_group_set_collapsed (a_group: POINTER; a_collapsed: INTEGER_32) is
 		-- gtk_tool_item_group_set_collapsed (node at line 34775)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_collapsed"
		}"
		end

	gtk_tool_item_group_get_item_position (a_group: POINTER; an_item: POINTER): INTEGER_32 is
 		-- gtk_tool_item_group_get_item_position (node at line 40418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_item_position"
		}"
		end

	gtk_tool_item_group_get_header_relief (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_header_relief (node at line 41274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_header_relief"
		}"
		end

	gtk_tool_item_group_set_label (a_group: POINTER; a_label: POINTER) is
 		-- gtk_tool_item_group_set_label (node at line 41324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_label"
		}"
		end


end -- class GTKTOOLITEMGROUP_EXTERNALS
