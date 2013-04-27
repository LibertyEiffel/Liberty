-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_toolbar_elide_underscores skipped.
	-- `hidden' function _gtk_toolbar_get_default_space_size skipped.
	gtk_toolbar_get_drop_index (a_toolbar: POINTER; a_x: INTEGER; a_y: INTEGER): INTEGER is
 		-- gtk_toolbar_get_drop_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_drop_index"
		}"
		end

	gtk_toolbar_get_icon_size (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_icon_size"
		}"
		end

	gtk_toolbar_get_item_index (a_toolbar: POINTER; an_item: POINTER): INTEGER is
 		-- gtk_toolbar_get_item_index
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_item_index"
		}"
		end

	gtk_toolbar_get_n_items (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_n_items
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_n_items"
		}"
		end

	gtk_toolbar_get_nth_item (a_toolbar: POINTER; a_n: INTEGER): POINTER is
 		-- gtk_toolbar_get_nth_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_nth_item"
		}"
		end

	gtk_toolbar_get_relief_style (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_relief_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_relief_style"
		}"
		end

	gtk_toolbar_get_show_arrow (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_show_arrow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_show_arrow"
		}"
		end

	gtk_toolbar_get_style (a_toolbar: POINTER): INTEGER is
 		-- gtk_toolbar_get_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_style"
		}"
		end

	gtk_toolbar_get_type: like long_unsigned is
 		-- gtk_toolbar_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_get_type()"
		}"
		end

	gtk_toolbar_insert (a_toolbar: POINTER; an_item: POINTER; a_pos: INTEGER) is
 		-- gtk_toolbar_insert
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_insert"
		}"
		end

	gtk_toolbar_new: POINTER is
 		-- gtk_toolbar_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_new()"
		}"
		end

	-- `hidden' function _gtk_toolbar_paint_space_line skipped.
	gtk_toolbar_set_drop_highlight_item (a_toolbar: POINTER; a_tool_item: POINTER; an_index: INTEGER) is
 		-- gtk_toolbar_set_drop_highlight_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_drop_highlight_item"
		}"
		end

	gtk_toolbar_set_icon_size (a_toolbar: POINTER; an_icon_size: INTEGER) is
 		-- gtk_toolbar_set_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_icon_size"
		}"
		end

	gtk_toolbar_set_show_arrow (a_toolbar: POINTER; a_show_arrow: INTEGER) is
 		-- gtk_toolbar_set_show_arrow
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_show_arrow"
		}"
		end

	gtk_toolbar_set_style (a_toolbar: POINTER; a_style: INTEGER) is
 		-- gtk_toolbar_set_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_set_style"
		}"
		end

	gtk_toolbar_unset_icon_size (a_toolbar: POINTER) is
 		-- gtk_toolbar_unset_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_unset_icon_size"
		}"
		end

	gtk_toolbar_unset_style (a_toolbar: POINTER) is
 		-- gtk_toolbar_unset_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_toolbar_unset_style"
		}"
		end


end -- class GTKTOOLBAR_EXTERNALS
