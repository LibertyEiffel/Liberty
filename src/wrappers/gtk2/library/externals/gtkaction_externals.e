-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_action_activate (an_action: POINTER) is
 		-- gtk_action_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_activate"
		}"
		end

	-- `hidden' function _gtk_action_add_to_proxy_list skipped.
	gtk_action_block_activate (an_action: POINTER) is
 		-- gtk_action_block_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_block_activate"
		}"
		end

	gtk_action_connect_accelerator (an_action: POINTER) is
 		-- gtk_action_connect_accelerator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_connect_accelerator"
		}"
		end

	gtk_action_create_icon (an_action: POINTER; an_icon_size: INTEGER): POINTER is
 		-- gtk_action_create_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_icon"
		}"
		end

	gtk_action_create_menu (an_action: POINTER): POINTER is
 		-- gtk_action_create_menu
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_menu"
		}"
		end

	gtk_action_create_menu_item (an_action: POINTER): POINTER is
 		-- gtk_action_create_menu_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_menu_item"
		}"
		end

	gtk_action_create_tool_item (an_action: POINTER): POINTER is
 		-- gtk_action_create_tool_item
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_tool_item"
		}"
		end

	gtk_action_disconnect_accelerator (an_action: POINTER) is
 		-- gtk_action_disconnect_accelerator
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_disconnect_accelerator"
		}"
		end

	-- `hidden' function _gtk_action_emit_activate skipped.
	gtk_action_get_accel_closure (an_action: POINTER): POINTER is
 		-- gtk_action_get_accel_closure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_accel_closure"
		}"
		end

	gtk_action_get_accel_path (an_action: POINTER): POINTER is
 		-- gtk_action_get_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_accel_path"
		}"
		end

	gtk_action_get_always_show_image (an_action: POINTER): INTEGER is
 		-- gtk_action_get_always_show_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_always_show_image"
		}"
		end

	gtk_action_get_gicon (an_action: POINTER): POINTER is
 		-- gtk_action_get_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_gicon"
		}"
		end

	gtk_action_get_icon_name (an_action: POINTER): POINTER is
 		-- gtk_action_get_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_icon_name"
		}"
		end

	gtk_action_get_is_important (an_action: POINTER): INTEGER is
 		-- gtk_action_get_is_important
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_is_important"
		}"
		end

	gtk_action_get_label (an_action: POINTER): POINTER is
 		-- gtk_action_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_label"
		}"
		end

	gtk_action_get_name (an_action: POINTER): POINTER is
 		-- gtk_action_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_name"
		}"
		end

	gtk_action_get_proxies (an_action: POINTER): POINTER is
 		-- gtk_action_get_proxies
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_proxies"
		}"
		end

	gtk_action_get_sensitive (an_action: POINTER): INTEGER is
 		-- gtk_action_get_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_sensitive"
		}"
		end

	gtk_action_get_short_label (an_action: POINTER): POINTER is
 		-- gtk_action_get_short_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_short_label"
		}"
		end

	gtk_action_get_stock_id (an_action: POINTER): POINTER is
 		-- gtk_action_get_stock_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_stock_id"
		}"
		end

	gtk_action_get_tooltip (an_action: POINTER): POINTER is
 		-- gtk_action_get_tooltip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_tooltip"
		}"
		end

	gtk_action_get_type: like long_unsigned is
 		-- gtk_action_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_type()"
		}"
		end

	gtk_action_get_visible (an_action: POINTER): INTEGER is
 		-- gtk_action_get_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible"
		}"
		end

	gtk_action_get_visible_horizontal (an_action: POINTER): INTEGER is
 		-- gtk_action_get_visible_horizontal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible_horizontal"
		}"
		end

	gtk_action_get_visible_vertical (an_action: POINTER): INTEGER is
 		-- gtk_action_get_visible_vertical
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible_vertical"
		}"
		end

	gtk_action_is_sensitive (an_action: POINTER): INTEGER is
 		-- gtk_action_is_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_is_sensitive"
		}"
		end

	gtk_action_is_visible (an_action: POINTER): INTEGER is
 		-- gtk_action_is_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_is_visible"
		}"
		end

	gtk_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_action_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_new"
		}"
		end

	-- `hidden' function _gtk_action_remove_from_proxy_list skipped.
	gtk_action_set_accel_group (an_action: POINTER; an_accel_group: POINTER) is
 		-- gtk_action_set_accel_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_accel_group"
		}"
		end

	gtk_action_set_accel_path (an_action: POINTER; an_accel_path: POINTER) is
 		-- gtk_action_set_accel_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_accel_path"
		}"
		end

	gtk_action_set_always_show_image (an_action: POINTER; an_always_show: INTEGER) is
 		-- gtk_action_set_always_show_image
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_always_show_image"
		}"
		end

	gtk_action_set_gicon (an_action: POINTER; an_icon: POINTER) is
 		-- gtk_action_set_gicon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_gicon"
		}"
		end

	gtk_action_set_icon_name (an_action: POINTER; an_icon_name: POINTER) is
 		-- gtk_action_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_icon_name"
		}"
		end

	gtk_action_set_is_important (an_action: POINTER; an_is_important: INTEGER) is
 		-- gtk_action_set_is_important
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_is_important"
		}"
		end

	gtk_action_set_label (an_action: POINTER; a_label: POINTER) is
 		-- gtk_action_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_label"
		}"
		end

	gtk_action_set_sensitive (an_action: POINTER; a_sensitive: INTEGER) is
 		-- gtk_action_set_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_sensitive"
		}"
		end

	gtk_action_set_short_label (an_action: POINTER; a_short_label: POINTER) is
 		-- gtk_action_set_short_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_short_label"
		}"
		end

	gtk_action_set_stock_id (an_action: POINTER; a_stock_id: POINTER) is
 		-- gtk_action_set_stock_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_stock_id"
		}"
		end

	gtk_action_set_tooltip (an_action: POINTER; a_tooltip: POINTER) is
 		-- gtk_action_set_tooltip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_tooltip"
		}"
		end

	gtk_action_set_visible (an_action: POINTER; a_visible: INTEGER) is
 		-- gtk_action_set_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible"
		}"
		end

	gtk_action_set_visible_horizontal (an_action: POINTER; a_visible_horizontal: INTEGER) is
 		-- gtk_action_set_visible_horizontal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible_horizontal"
		}"
		end

	gtk_action_set_visible_vertical (an_action: POINTER; a_visible_vertical: INTEGER) is
 		-- gtk_action_set_visible_vertical
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible_vertical"
		}"
		end

	-- `hidden' function _gtk_action_sync_menu_visible skipped.
	gtk_action_unblock_activate (an_action: POINTER) is
 		-- gtk_action_unblock_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_unblock_activate"
		}"
		end


end -- class GTKACTION_EXTERNALS
