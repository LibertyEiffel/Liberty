-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLITEMGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_item_group_get_collapsed (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_collapsed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_collapsed"
		}"
		end

	gtk_tool_item_group_get_drop_item (a_group: POINTER; a_x: INTEGER; a_y: INTEGER): POINTER is
 		-- gtk_tool_item_group_get_drop_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_drop_item"
		}"
		end

	gtk_tool_item_group_get_ellipsize (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_ellipsize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_ellipsize"
		}"
		end

	gtk_tool_item_group_get_header_relief (a_group: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_header_relief
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_header_relief"
		}"
		end

	gtk_tool_item_group_get_item_position (a_group: POINTER; an_item: POINTER): INTEGER is
 		-- gtk_tool_item_group_get_item_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_item_position"
		}"
		end

	gtk_tool_item_group_get_label (a_group: POINTER): POINTER is
 		-- gtk_tool_item_group_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_label"
		}"
		end

	gtk_tool_item_group_get_label_widget (a_group: POINTER): POINTER is
 		-- gtk_tool_item_group_get_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_label_widget"
		}"
		end

	gtk_tool_item_group_get_n_items (a_group: POINTER): NATURAL is
 		-- gtk_tool_item_group_get_n_items
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_n_items"
		}"
		end

	gtk_tool_item_group_get_nth_item (a_group: POINTER; an_index: NATURAL): POINTER is
 		-- gtk_tool_item_group_get_nth_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_nth_item"
		}"
		end

	gtk_tool_item_group_get_type: like long_unsigned is
 		-- gtk_tool_item_group_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_get_type()"
		}"
		end

	gtk_tool_item_group_insert (a_group: POINTER; an_item: POINTER; a_position: INTEGER) is
 		-- gtk_tool_item_group_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_insert"
		}"
		end

	gtk_tool_item_group_new (a_label: POINTER): POINTER is
 		-- gtk_tool_item_group_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_new"
		}"
		end

	gtk_tool_item_group_set_collapsed (a_group: POINTER; a_collapsed: INTEGER) is
 		-- gtk_tool_item_group_set_collapsed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_collapsed"
		}"
		end

	gtk_tool_item_group_set_ellipsize (a_group: POINTER; an_ellipsize: INTEGER) is
 		-- gtk_tool_item_group_set_ellipsize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_ellipsize"
		}"
		end

	gtk_tool_item_group_set_header_relief (a_group: POINTER; a_style: INTEGER) is
 		-- gtk_tool_item_group_set_header_relief
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_header_relief"
		}"
		end

	gtk_tool_item_group_set_item_position (a_group: POINTER; an_item: POINTER; a_position: INTEGER) is
 		-- gtk_tool_item_group_set_item_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_item_position"
		}"
		end

	gtk_tool_item_group_set_label (a_group: POINTER; a_label: POINTER) is
 		-- gtk_tool_item_group_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_label"
		}"
		end

	gtk_tool_item_group_set_label_widget (a_group: POINTER; a_label_widget: POINTER) is
 		-- gtk_tool_item_group_set_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_item_group_set_label_widget"
		}"
		end


end -- class GTKTOOLITEMGROUP_EXTERNALS
