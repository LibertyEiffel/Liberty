-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTION_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_action_get_type: NATURAL_32 is
 		-- gtk_action_get_type (node at line 519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_type()"
		}"
		end

	-- `hidden' function _gtk_action_add_to_proxy_list skipped.
	gtk_action_set_label (an_action: POINTER; a_label: POINTER) is
 		-- gtk_action_set_label (node at line 5983)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_label"
		}"
		end

	gtk_action_disconnect_accelerator (an_action: POINTER) is
 		-- gtk_action_disconnect_accelerator (node at line 6240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_disconnect_accelerator"
		}"
		end

	gtk_action_unblock_activate (an_action: POINTER) is
 		-- gtk_action_unblock_activate (node at line 7404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_unblock_activate"
		}"
		end

	gtk_action_create_menu (an_action: POINTER): POINTER is
 		-- gtk_action_create_menu (node at line 7959)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_menu"
		}"
		end

	gtk_action_block_activate (an_action: POINTER) is
 		-- gtk_action_block_activate (node at line 8720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_block_activate"
		}"
		end

	gtk_action_set_accel_group (an_action: POINTER; an_accel_group: POINTER) is
 		-- gtk_action_set_accel_group (node at line 9442)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_accel_group"
		}"
		end

	gtk_action_get_visible_vertical (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_visible_vertical (node at line 9582)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible_vertical"
		}"
		end

	gtk_action_get_icon_name (an_action: POINTER): POINTER is
 		-- gtk_action_get_icon_name (node at line 10511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_icon_name"
		}"
		end

	-- `hidden' function _gtk_action_remove_from_proxy_list skipped.
	gtk_action_get_gicon (an_action: POINTER): POINTER is
 		-- gtk_action_get_gicon (node at line 12241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_gicon"
		}"
		end

	gtk_action_set_icon_name (an_action: POINTER; an_icon_name: POINTER) is
 		-- gtk_action_set_icon_name (node at line 14636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_icon_name"
		}"
		end

	gtk_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_action_new (node at line 16552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_new"
		}"
		end

	gtk_action_get_visible_horizontal (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_visible_horizontal (node at line 17209)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible_horizontal"
		}"
		end

	gtk_action_get_sensitive (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_sensitive (node at line 17261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_sensitive"
		}"
		end

	gtk_action_is_sensitive (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_is_sensitive (node at line 18738)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_is_sensitive"
		}"
		end

	gtk_action_set_visible_horizontal (an_action: POINTER; a_visible_horizontal: INTEGER_32) is
 		-- gtk_action_set_visible_horizontal (node at line 19407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible_horizontal"
		}"
		end

	gtk_action_get_is_important (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_is_important (node at line 20255)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_is_important"
		}"
		end

	gtk_action_set_gicon (an_action: POINTER; an_icon: POINTER) is
 		-- gtk_action_set_gicon (node at line 20813)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_gicon"
		}"
		end

	gtk_action_connect_proxy (an_action: POINTER; a_proxy: POINTER) is
 		-- gtk_action_connect_proxy (node at line 20951)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_connect_proxy"
		}"
		end

	gtk_action_get_accel_closure (an_action: POINTER): POINTER is
 		-- gtk_action_get_accel_closure (node at line 21519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_accel_closure"
		}"
		end

	gtk_action_disconnect_proxy (an_action: POINTER; a_proxy: POINTER) is
 		-- gtk_action_disconnect_proxy (node at line 22290)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_disconnect_proxy"
		}"
		end

	gtk_action_unblock_activate_from (an_action: POINTER; a_proxy: POINTER) is
 		-- gtk_action_unblock_activate_from (node at line 22472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_unblock_activate_from"
		}"
		end

	gtk_action_get_always_show_image (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_always_show_image (node at line 23723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_always_show_image"
		}"
		end

	gtk_action_get_tooltip (an_action: POINTER): POINTER is
 		-- gtk_action_get_tooltip (node at line 24337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_tooltip"
		}"
		end

	-- `hidden' function _gtk_action_emit_activate skipped.
	gtk_action_set_short_label (an_action: POINTER; a_short_label: POINTER) is
 		-- gtk_action_set_short_label (node at line 25033)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_short_label"
		}"
		end

	gtk_action_get_visible (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_visible (node at line 25283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible"
		}"
		end

	gtk_action_set_stock_id (an_action: POINTER; a_stock_id: POINTER) is
 		-- gtk_action_set_stock_id (node at line 25458)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_stock_id"
		}"
		end

	gtk_action_get_stock_id (an_action: POINTER): POINTER is
 		-- gtk_action_get_stock_id (node at line 26739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_stock_id"
		}"
		end

	gtk_action_create_icon (an_action: POINTER; an_icon_size: INTEGER): POINTER is
 		-- gtk_action_create_icon (node at line 27083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_icon"
		}"
		end

	gtk_action_set_always_show_image (an_action: POINTER; an_always_show: INTEGER_32) is
 		-- gtk_action_set_always_show_image (node at line 28254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_always_show_image"
		}"
		end

	gtk_action_is_visible (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_is_visible (node at line 29737)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_is_visible"
		}"
		end

	gtk_action_get_accel_path (an_action: POINTER): POINTER is
 		-- gtk_action_get_accel_path (node at line 30124)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_accel_path"
		}"
		end

	gtk_action_set_tooltip (an_action: POINTER; a_tooltip: POINTER) is
 		-- gtk_action_set_tooltip (node at line 30537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_tooltip"
		}"
		end

	gtk_action_set_visible (an_action: POINTER; a_visible: INTEGER_32) is
 		-- gtk_action_set_visible (node at line 31579)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible"
		}"
		end

	gtk_action_get_name (an_action: POINTER): POINTER is
 		-- gtk_action_get_name (node at line 31883)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_name"
		}"
		end

	gtk_widget_get_action (a_widget: POINTER): POINTER is
 		-- gtk_widget_get_action (node at line 32323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_widget_get_action"
		}"
		end

	gtk_action_connect_accelerator (an_action: POINTER) is
 		-- gtk_action_connect_accelerator (node at line 32658)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_connect_accelerator"
		}"
		end

	gtk_action_block_activate_from (an_action: POINTER; a_proxy: POINTER) is
 		-- gtk_action_block_activate_from (node at line 33114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_block_activate_from"
		}"
		end

	gtk_action_activate (an_action: POINTER) is
 		-- gtk_action_activate (node at line 34200)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_activate"
		}"
		end

	gtk_action_get_label (an_action: POINTER): POINTER is
 		-- gtk_action_get_label (node at line 34535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_label"
		}"
		end

	gtk_action_set_accel_path (an_action: POINTER; an_accel_path: POINTER) is
 		-- gtk_action_set_accel_path (node at line 35010)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_accel_path"
		}"
		end

	gtk_action_set_visible_vertical (an_action: POINTER; a_visible_vertical: INTEGER_32) is
 		-- gtk_action_set_visible_vertical (node at line 35438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible_vertical"
		}"
		end

	gtk_action_set_sensitive (an_action: POINTER; a_sensitive: INTEGER_32) is
 		-- gtk_action_set_sensitive (node at line 35603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_sensitive"
		}"
		end

	gtk_action_create_tool_item (an_action: POINTER): POINTER is
 		-- gtk_action_create_tool_item (node at line 36223)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_tool_item"
		}"
		end

	gtk_action_create_menu_item (an_action: POINTER): POINTER is
 		-- gtk_action_create_menu_item (node at line 36246)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_menu_item"
		}"
		end

	gtk_action_get_proxies (an_action: POINTER): POINTER is
 		-- gtk_action_get_proxies (node at line 36274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_proxies"
		}"
		end

	gtk_action_set_is_important (an_action: POINTER; an_is_important: INTEGER_32) is
 		-- gtk_action_set_is_important (node at line 37173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_is_important"
		}"
		end

	-- `hidden' function _gtk_action_sync_menu_visible skipped.
	gtk_action_get_short_label (an_action: POINTER): POINTER is
 		-- gtk_action_get_short_label (node at line 37522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_short_label"
		}"
		end


end -- class GTKACTION_EXTERNALS
