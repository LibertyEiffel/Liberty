-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_toolbar_get_relief_style (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_relief_style (node at line 2190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_relief_style"
		}"
		end

	gtk_toolbar_get_type: NATURAL_64 is
 		-- gtk_toolbar_get_type (node at line 3163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_type()"
		}"
		end

	gtk_toolbar_set_style (a_toolbar: POINTER; a_style: INTEGER) is
 		-- gtk_toolbar_set_style (node at line 6163)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_style"
		}"
		end

	gtk_toolbar_insert (a_toolbar: POINTER; an_item: POINTER; a_pos: INTEGER_32) is
 		-- gtk_toolbar_insert (node at line 9356)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert"
		}"
		end

	gtk_toolbar_set_drop_highlight_item (a_toolbar: POINTER; a_tool_item: POINTER; an_index: INTEGER_32) is
 		-- gtk_toolbar_set_drop_highlight_item (node at line 9580)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_drop_highlight_item"
		}"
		end

	-- `hidden' function _gtk_toolbar_get_default_space_size skipped.
	gtk_toolbar_new: POINTER is
 		-- gtk_toolbar_new (node at line 14340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_new()"
		}"
		end

	-- `hidden' function _gtk_toolbar_paint_space_line skipped.
	gtk_toolbar_get_show_arrow (a_toolbar: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_show_arrow (node at line 17236)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_show_arrow"
		}"
		end

	gtk_toolbar_set_icon_size (a_toolbar: POINTER; an_icon_size: INTEGER) is
 		-- gtk_toolbar_set_icon_size (node at line 20315)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_icon_size"
		}"
		end

	gtk_toolbar_set_show_arrow (a_toolbar: POINTER; a_show_arrow: INTEGER_32) is
 		-- gtk_toolbar_set_show_arrow (node at line 23308)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_show_arrow"
		}"
		end

	gtk_toolbar_get_nth_item (a_toolbar: POINTER; a_n: INTEGER_32): POINTER is
 		-- gtk_toolbar_get_nth_item (node at line 25545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_nth_item"
		}"
		end

	gtk_toolbar_get_icon_size (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_icon_size (node at line 25976)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_icon_size"
		}"
		end

	gtk_toolbar_unset_icon_size (a_toolbar: POINTER) is
 		-- gtk_toolbar_unset_icon_size (node at line 27593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_unset_icon_size"
		}"
		end

	gtk_toolbar_get_n_items (a_toolbar: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_n_items (node at line 28870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_n_items"
		}"
		end

	gtk_toolbar_get_item_index (a_toolbar: POINTER; an_item: POINTER): INTEGER_32 is
 		-- gtk_toolbar_get_item_index (node at line 33102)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_item_index"
		}"
		end

	gtk_toolbar_unset_style (a_toolbar: POINTER) is
 		-- gtk_toolbar_unset_style (node at line 37683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_unset_style"
		}"
		end

	gtk_toolbar_get_style (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_style (node at line 37950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_style"
		}"
		end

	gtk_toolbar_get_drop_index (a_toolbar: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gtk_toolbar_get_drop_index (node at line 39259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_drop_index"
		}"
		end

	-- `hidden' function _gtk_toolbar_elide_underscores skipped.

end -- class GTKTOOLBAR_EXTERNALS
