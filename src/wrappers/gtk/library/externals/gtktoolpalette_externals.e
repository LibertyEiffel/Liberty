-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTOOLPALETTE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_tool_palette_get_exclusive (a_palette: POINTER; a_group: POINTER): INTEGER_32 is
 		-- gtk_tool_palette_get_exclusive (node at line 50)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_exclusive"
		}"
		end

	gtk_tool_palette_get_type: NATURAL_32 is
 		-- gtk_tool_palette_get_type (node at line 836)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_type()"
		}"
		end

	gtk_tool_palette_set_exclusive (a_palette: POINTER; a_group: POINTER; an_exclusive: INTEGER_32) is
 		-- gtk_tool_palette_set_exclusive (node at line 4622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_exclusive"
		}"
		end

	gtk_tool_palette_get_drop_item (a_palette: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gtk_tool_palette_get_drop_item (node at line 6345)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drop_item"
		}"
		end

	gtk_tool_palette_get_hadjustment (a_palette: POINTER): POINTER is
 		-- gtk_tool_palette_get_hadjustment (node at line 7809)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_hadjustment"
		}"
		end

	gtk_tool_palette_set_icon_size (a_palette: POINTER; an_icon_size: INTEGER) is
 		-- gtk_tool_palette_set_icon_size (node at line 9911)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_icon_size"
		}"
		end

	gtk_tool_palette_get_group_position (a_palette: POINTER; a_group: POINTER): INTEGER_32 is
 		-- gtk_tool_palette_get_group_position (node at line 11303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_group_position"
		}"
		end

	gtk_tool_palette_get_drop_group (a_palette: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): POINTER is
 		-- gtk_tool_palette_get_drop_group (node at line 13542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drop_group"
		}"
		end

	gtk_tool_palette_get_icon_size (a_palette: POINTER): INTEGER is
 		-- gtk_tool_palette_get_icon_size (node at line 13983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_icon_size"
		}"
		end

	gtk_tool_palette_get_expand (a_palette: POINTER; a_group: POINTER): INTEGER_32 is
 		-- gtk_tool_palette_get_expand (node at line 14824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_expand"
		}"
		end

	gtk_tool_palette_set_expand (a_palette: POINTER; a_group: POINTER; an_expand: INTEGER_32) is
 		-- gtk_tool_palette_set_expand (node at line 15528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_expand"
		}"
		end

	gtk_tool_palette_add_drag_dest (a_palette: POINTER; a_widget: POINTER; a_flags: INTEGER; a_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_tool_palette_add_drag_dest (node at line 17060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_add_drag_dest"
		}"
		end

	gtk_tool_palette_new: POINTER is
 		-- gtk_tool_palette_new (node at line 18683)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_new()"
		}"
		end

	gtk_tool_palette_get_drag_item (a_palette: POINTER; a_selection: POINTER): POINTER is
 		-- gtk_tool_palette_get_drag_item (node at line 18720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drag_item"
		}"
		end

	gtk_tool_palette_get_drag_target_group: POINTER is
 		-- gtk_tool_palette_get_drag_target_group (node at line 20852)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drag_target_group()"
		}"
		end

	gtk_tool_palette_get_vadjustment (a_palette: POINTER): POINTER is
 		-- gtk_tool_palette_get_vadjustment (node at line 23347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_vadjustment"
		}"
		end

	gtk_tool_palette_get_style (a_palette: POINTER): INTEGER is
 		-- gtk_tool_palette_get_style (node at line 26475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_style"
		}"
		end

	gtk_tool_palette_unset_style (a_palette: POINTER) is
 		-- gtk_tool_palette_unset_style (node at line 31894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_unset_style"
		}"
		end

	gtk_tool_palette_unset_icon_size (a_palette: POINTER) is
 		-- gtk_tool_palette_unset_icon_size (node at line 32361)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_unset_icon_size"
		}"
		end

	gtk_tool_palette_get_drag_target_item: POINTER is
 		-- gtk_tool_palette_get_drag_target_item (node at line 34222)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_get_drag_target_item()"
		}"
		end

	gtk_tool_palette_set_group_position (a_palette: POINTER; a_group: POINTER; a_position: INTEGER_32) is
 		-- gtk_tool_palette_set_group_position (node at line 34287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_group_position"
		}"
		end

	gtk_tool_palette_set_style (a_palette: POINTER; a_style: INTEGER) is
 		-- gtk_tool_palette_set_style (node at line 34749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_style"
		}"
		end

	gtk_tool_palette_set_drag_source (a_palette: POINTER; a_targets: INTEGER) is
 		-- gtk_tool_palette_set_drag_source (node at line 37432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_palette_set_drag_source"
		}"
		end


end -- class GTKTOOLPALETTE_EXTERNALS
