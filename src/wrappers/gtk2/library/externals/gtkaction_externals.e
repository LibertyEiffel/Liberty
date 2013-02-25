-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACTION_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_action_get_type: NATURAL_64 is
 		-- gtk_action_get_type (node at line 508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_type()"
		}"
		end

	-- `hidden' function _gtk_action_add_to_proxy_list skipped.
	gtk_action_set_label (an_action: POINTER; a_label: POINTER) is
 		-- gtk_action_set_label (node at line 6323)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_label"
		}"
		end

	gtk_action_disconnect_accelerator (an_action: POINTER) is
 		-- gtk_action_disconnect_accelerator (node at line 6840)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_disconnect_accelerator"
		}"
		end

	gtk_action_unblock_activate (an_action: POINTER) is
 		-- gtk_action_unblock_activate (node at line 8090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_unblock_activate"
		}"
		end

	gtk_action_create_menu (an_action: POINTER): POINTER is
 		-- gtk_action_create_menu (node at line 8674)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_menu"
		}"
		end

	gtk_action_block_activate (an_action: POINTER) is
 		-- gtk_action_block_activate (node at line 9465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_block_activate"
		}"
		end

	gtk_action_set_tooltip (an_action: POINTER; a_tooltip: POINTER) is
 		-- gtk_action_set_tooltip (node at line 9620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_tooltip"
		}"
		end

	gtk_action_set_accel_group (an_action: POINTER; an_accel_group: POINTER) is
 		-- gtk_action_set_accel_group (node at line 10198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_accel_group"
		}"
		end

	gtk_action_get_visible_vertical (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_visible_vertical (node at line 10362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible_vertical"
		}"
		end

	gtk_action_get_icon_name (an_action: POINTER): POINTER is
 		-- gtk_action_get_icon_name (node at line 11423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_icon_name"
		}"
		end

	-- `hidden' function _gtk_action_remove_from_proxy_list skipped.
	gtk_action_get_gicon (an_action: POINTER): POINTER is
 		-- gtk_action_get_gicon (node at line 13319)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_gicon"
		}"
		end

	gtk_action_set_icon_name (an_action: POINTER; an_icon_name: POINTER) is
 		-- gtk_action_set_icon_name (node at line 15824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_icon_name"
		}"
		end

	gtk_action_new (a_name: POINTER; a_label: POINTER; a_tooltip: POINTER; a_stock_id: POINTER): POINTER is
 		-- gtk_action_new (node at line 18017)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_new"
		}"
		end

	gtk_action_get_visible_horizontal (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_visible_horizontal (node at line 18829)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible_horizontal"
		}"
		end

	gtk_action_get_sensitive (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_sensitive (node at line 18877)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_sensitive"
		}"
		end

	gtk_action_is_sensitive (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_is_sensitive (node at line 20445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_is_sensitive"
		}"
		end

	gtk_action_set_visible_horizontal (an_action: POINTER; a_visible_horizontal: INTEGER_32) is
 		-- gtk_action_set_visible_horizontal (node at line 21297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible_horizontal"
		}"
		end

	gtk_action_get_is_important (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_is_important (node at line 22324)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_is_important"
		}"
		end

	gtk_action_set_gicon (an_action: POINTER; an_icon: POINTER) is
 		-- gtk_action_set_gicon (node at line 22929)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_gicon"
		}"
		end

	gtk_action_get_accel_closure (an_action: POINTER): POINTER is
 		-- gtk_action_get_accel_closure (node at line 23720)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_accel_closure"
		}"
		end

	gtk_action_get_always_show_image (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_always_show_image (node at line 26180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_always_show_image"
		}"
		end

	gtk_action_get_tooltip (an_action: POINTER): POINTER is
 		-- gtk_action_get_tooltip (node at line 26879)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_tooltip"
		}"
		end

	-- `hidden' function _gtk_action_emit_activate skipped.
	gtk_action_set_short_label (an_action: POINTER; a_short_label: POINTER) is
 		-- gtk_action_set_short_label (node at line 27751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_short_label"
		}"
		end

	gtk_action_get_visible (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_get_visible (node at line 28022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_visible"
		}"
		end

	gtk_action_set_visible_vertical (an_action: POINTER; a_visible_vertical: INTEGER_32) is
 		-- gtk_action_set_visible_vertical (node at line 28244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible_vertical"
		}"
		end

	gtk_action_set_stock_id (an_action: POINTER; a_stock_id: POINTER) is
 		-- gtk_action_set_stock_id (node at line 28248)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_stock_id"
		}"
		end

	gtk_action_get_stock_id (an_action: POINTER): POINTER is
 		-- gtk_action_get_stock_id (node at line 29525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_stock_id"
		}"
		end

	gtk_action_create_icon (an_action: POINTER; an_icon_size: INTEGER): POINTER is
 		-- gtk_action_create_icon (node at line 29891)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_icon"
		}"
		end

	gtk_action_set_always_show_image (an_action: POINTER; an_always_show: INTEGER_32) is
 		-- gtk_action_set_always_show_image (node at line 31304)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_always_show_image"
		}"
		end

	gtk_action_is_visible (an_action: POINTER): INTEGER_32 is
 		-- gtk_action_is_visible (node at line 32779)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_is_visible"
		}"
		end

	gtk_action_get_accel_path (an_action: POINTER): POINTER is
 		-- gtk_action_get_accel_path (node at line 33232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_accel_path"
		}"
		end

	gtk_action_set_visible (an_action: POINTER; a_visible: INTEGER_32) is
 		-- gtk_action_set_visible (node at line 34932)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_visible"
		}"
		end

	gtk_action_get_name (an_action: POINTER): POINTER is
 		-- gtk_action_get_name (node at line 35234)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_name"
		}"
		end

	gtk_action_connect_accelerator (an_action: POINTER) is
 		-- gtk_action_connect_accelerator (node at line 36028)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_connect_accelerator"
		}"
		end

	gtk_action_activate (an_action: POINTER) is
 		-- gtk_action_activate (node at line 37751)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_activate"
		}"
		end

	gtk_action_get_label (an_action: POINTER): POINTER is
 		-- gtk_action_get_label (node at line 38062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_label"
		}"
		end

	gtk_action_set_accel_path (an_action: POINTER; an_accel_path: POINTER) is
 		-- gtk_action_set_accel_path (node at line 38608)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_accel_path"
		}"
		end

	gtk_action_set_sensitive (an_action: POINTER; a_sensitive: INTEGER_32) is
 		-- gtk_action_set_sensitive (node at line 39173)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_sensitive"
		}"
		end

	gtk_action_create_tool_item (an_action: POINTER): POINTER is
 		-- gtk_action_create_tool_item (node at line 39841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_tool_item"
		}"
		end

	gtk_action_create_menu_item (an_action: POINTER): POINTER is
 		-- gtk_action_create_menu_item (node at line 39864)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_create_menu_item"
		}"
		end

	gtk_action_get_proxies (an_action: POINTER): POINTER is
 		-- gtk_action_get_proxies (node at line 39898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_proxies"
		}"
		end

	gtk_action_set_is_important (an_action: POINTER; an_is_important: INTEGER_32) is
 		-- gtk_action_set_is_important (node at line 40857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_set_is_important"
		}"
		end

	-- `hidden' function _gtk_action_sync_menu_visible skipped.
	gtk_action_get_short_label (an_action: POINTER): POINTER is
 		-- gtk_action_get_short_label (node at line 41204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_action_get_short_label"
		}"
		end


end -- class GTKACTION_EXTERNALS
