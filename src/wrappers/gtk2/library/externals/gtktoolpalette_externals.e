-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLPALETTE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_palette_add_drag_dest (a_palette: POINTER; a_widget: POINTER; a_flags: INTEGER; a_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_tool_palette_add_drag_dest
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_add_drag_dest"
		}"
		end

	gtk_tool_palette_get_drag_item (a_palette: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_tool_palette_get_drag_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drag_item"
		}"
		end

	gtk_tool_palette_get_drag_target_group: POINTER is
 		-- gtk_tool_palette_get_drag_target_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drag_target_group()"
		}"
		end

	gtk_tool_palette_get_drag_target_item: POINTER is
 		-- gtk_tool_palette_get_drag_target_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drag_target_item()"
		}"
		end

	gtk_tool_palette_get_drop_group (a_palette: POINTER; a_x: INTEGER; a_y: INTEGER): POINTER is
 		-- gtk_tool_palette_get_drop_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drop_group"
		}"
		end

	gtk_tool_palette_get_drop_item (a_palette: POINTER; a_x: INTEGER; a_y: INTEGER): POINTER is
 		-- gtk_tool_palette_get_drop_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drop_item"
		}"
		end

	gtk_tool_palette_get_exclusive (a_palette: POINTER; a_group: POINTER): INTEGER is
 		-- gtk_tool_palette_get_exclusive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_exclusive"
		}"
		end

	gtk_tool_palette_get_expand (a_palette: POINTER; a_group: POINTER): INTEGER is
 		-- gtk_tool_palette_get_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_expand"
		}"
		end

	gtk_tool_palette_get_group_position (a_palette: POINTER; a_group: POINTER): INTEGER is
 		-- gtk_tool_palette_get_group_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_group_position"
		}"
		end

	gtk_tool_palette_get_hadjustment (a_palette: POINTER): POINTER is
 		-- gtk_tool_palette_get_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_hadjustment"
		}"
		end

	gtk_tool_palette_get_icon_size (a_palette: POINTER): INTEGER is
 		-- gtk_tool_palette_get_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_icon_size"
		}"
		end

	gtk_tool_palette_get_style (a_palette: POINTER): INTEGER is
 		-- gtk_tool_palette_get_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_style"
		}"
		end

	gtk_tool_palette_get_type: like long_unsigned is
 		-- gtk_tool_palette_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_type()"
		}"
		end

	gtk_tool_palette_get_vadjustment (a_palette: POINTER): POINTER is
 		-- gtk_tool_palette_get_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_vadjustment"
		}"
		end

	gtk_tool_palette_new: POINTER is
 		-- gtk_tool_palette_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_new()"
		}"
		end

	gtk_tool_palette_set_drag_source (a_palette: POINTER; a_targets: INTEGER) is
 		-- gtk_tool_palette_set_drag_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_drag_source"
		}"
		end

	gtk_tool_palette_set_exclusive (a_palette: POINTER; a_group: POINTER; an_exclusive: INTEGER) is
 		-- gtk_tool_palette_set_exclusive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_exclusive"
		}"
		end

	gtk_tool_palette_set_expand (a_palette: POINTER; a_group: POINTER; an_expand: INTEGER) is
 		-- gtk_tool_palette_set_expand
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_expand"
		}"
		end

	gtk_tool_palette_set_group_position (a_palette: POINTER; a_group: POINTER; a_position: INTEGER) is
 		-- gtk_tool_palette_set_group_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_group_position"
		}"
		end

	gtk_tool_palette_set_icon_size (a_palette: POINTER; an_icon_size: INTEGER) is
 		-- gtk_tool_palette_set_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_icon_size"
		}"
		end

	gtk_tool_palette_set_style (a_palette: POINTER; a_style: INTEGER) is
 		-- gtk_tool_palette_set_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_style"
		}"
		end

	gtk_tool_palette_unset_icon_size (a_palette: POINTER) is
 		-- gtk_tool_palette_unset_icon_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_unset_icon_size"
		}"
		end

	gtk_tool_palette_unset_style (a_palette: POINTER) is
 		-- gtk_tool_palette_unset_style
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_unset_style"
		}"
		end


end -- class GTKTOOLPALETTE_EXTERNALS
