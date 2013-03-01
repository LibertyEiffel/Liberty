-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDND_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_drag_set_icon_pixmap (a_context: POINTER; a_colormap: POINTER; a_pixmap: POINTER; a_mask: POINTER; a_hot_x: INTEGER_32; a_hot_y: INTEGER_32) is
 		-- gtk_drag_set_icon_pixmap (node at line 107)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_pixmap"
		}"
		end

	gtk_drag_dest_set_proxy (a_widget: POINTER; a_proxy_window: POINTER; a_protocol: INTEGER; an_use_coordinates: INTEGER_32) is
 		-- gtk_drag_dest_set_proxy (node at line 833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set_proxy"
		}"
		end

	gtk_drag_dest_get_target_list (a_widget: POINTER): POINTER is
 		-- gtk_drag_dest_get_target_list (node at line 4038)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_get_target_list"
		}"
		end

	gtk_drag_dest_add_uri_targets (a_widget: POINTER) is
 		-- gtk_drag_dest_add_uri_targets (node at line 4057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_add_uri_targets"
		}"
		end

	-- `hidden' function _gtk_drag_dest_handle_event skipped.
	gtk_drag_set_icon_widget (a_context: POINTER; a_widget: POINTER; a_hot_x: INTEGER_32; a_hot_y: INTEGER_32) is
 		-- gtk_drag_set_icon_widget (node at line 6404)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_widget"
		}"
		end

	gtk_drag_get_data (a_widget: POINTER; a_context: POINTER; a_target: POINTER; a_time: NATURAL_32) is
 		-- gtk_drag_get_data (node at line 7254)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_get_data"
		}"
		end

	gtk_drag_dest_find_target (a_widget: POINTER; a_context: POINTER; a_target_list: POINTER): POINTER is
 		-- gtk_drag_dest_find_target (node at line 7663)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_find_target"
		}"
		end

	gtk_drag_source_add_text_targets (a_widget: POINTER) is
 		-- gtk_drag_source_add_text_targets (node at line 10426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_add_text_targets"
		}"
		end

	gtk_drag_set_icon_default (a_context: POINTER) is
 		-- gtk_drag_set_icon_default (node at line 10923)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_default"
		}"
		end

	gtk_drag_set_icon_pixbuf (a_context: POINTER; a_pixbuf: POINTER; a_hot_x: INTEGER_32; a_hot_y: INTEGER_32) is
 		-- gtk_drag_set_icon_pixbuf (node at line 12110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_pixbuf"
		}"
		end

	gtk_drag_source_unset (a_widget: POINTER) is
 		-- gtk_drag_source_unset (node at line 12988)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_unset"
		}"
		end

	gtk_drag_dest_set_track_motion (a_widget: POINTER; a_track_motion: INTEGER_32) is
 		-- gtk_drag_dest_set_track_motion (node at line 13718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set_track_motion"
		}"
		end

	gtk_drag_source_set_icon_pixbuf (a_widget: POINTER; a_pixbuf: POINTER) is
 		-- gtk_drag_source_set_icon_pixbuf (node at line 14791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon_pixbuf"
		}"
		end

	gtk_drag_source_set_target_list (a_widget: POINTER; a_target_list: POINTER) is
 		-- gtk_drag_source_set_target_list (node at line 16603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_target_list"
		}"
		end

	gtk_drag_source_set_icon_stock (a_widget: POINTER; a_stock_id: POINTER) is
 		-- gtk_drag_source_set_icon_stock (node at line 17208)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon_stock"
		}"
		end

	gtk_drag_dest_add_text_targets (a_widget: POINTER) is
 		-- gtk_drag_dest_add_text_targets (node at line 18644)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_add_text_targets"
		}"
		end

	-- `hidden' function _gtk_drag_source_handle_event skipped.
	gtk_drag_dest_set_target_list (a_widget: POINTER; a_target_list: POINTER) is
 		-- gtk_drag_dest_set_target_list (node at line 23822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set_target_list"
		}"
		end

	gtk_drag_source_get_target_list (a_widget: POINTER): POINTER is
 		-- gtk_drag_source_get_target_list (node at line 25226)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_get_target_list"
		}"
		end

	gtk_drag_source_add_uri_targets (a_widget: POINTER) is
 		-- gtk_drag_source_add_uri_targets (node at line 25259)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_add_uri_targets"
		}"
		end

	gtk_drag_dest_set (a_widget: POINTER; a_flags: INTEGER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_drag_dest_set (node at line 25559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set"
		}"
		end

	gtk_drag_check_threshold (a_widget: POINTER; a_start_x: INTEGER_32; a_start_y: INTEGER_32; a_current_x: INTEGER_32; a_current_y: INTEGER_32): INTEGER_32 is
 		-- gtk_drag_check_threshold (node at line 28013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_check_threshold"
		}"
		end

	gtk_drag_set_icon_name (a_context: POINTER; an_icon_name: POINTER; a_hot_x: INTEGER_32; a_hot_y: INTEGER_32) is
 		-- gtk_drag_set_icon_name (node at line 28684)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_name"
		}"
		end

	gtk_drag_source_set_icon (a_widget: POINTER; a_colormap: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_drag_source_set_icon (node at line 31391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon"
		}"
		end

	gtk_drag_dest_get_track_motion (a_widget: POINTER): INTEGER_32 is
 		-- gtk_drag_dest_get_track_motion (node at line 31827)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_get_track_motion"
		}"
		end

	gtk_drag_source_add_image_targets (a_widget: POINTER) is
 		-- gtk_drag_source_add_image_targets (node at line 33603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_add_image_targets"
		}"
		end

	gtk_drag_get_source_widget (a_context: POINTER): POINTER is
 		-- gtk_drag_get_source_widget (node at line 34487)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_get_source_widget"
		}"
		end

	gtk_drag_highlight (a_widget: POINTER) is
 		-- gtk_drag_highlight (node at line 35509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_highlight"
		}"
		end

	gtk_drag_begin (a_widget: POINTER; a_targets: POINTER; an_actions: INTEGER; a_button: INTEGER_32; an_event: POINTER): POINTER is
 		-- gtk_drag_begin (node at line 37529)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_begin"
		}"
		end

	gtk_drag_dest_add_image_targets (a_widget: POINTER) is
 		-- gtk_drag_dest_add_image_targets (node at line 37822)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_add_image_targets"
		}"
		end

	gtk_drag_source_set (a_widget: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER_32; an_actions: INTEGER) is
 		-- gtk_drag_source_set (node at line 38117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set"
		}"
		end

	gtk_drag_dest_unset (a_widget: POINTER) is
 		-- gtk_drag_dest_unset (node at line 38287)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_unset"
		}"
		end

	gtk_drag_finish (a_context: POINTER; a_success: INTEGER_32; a_del: INTEGER_32; a_time: NATURAL_32) is
 		-- gtk_drag_finish (node at line 39289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_finish"
		}"
		end

	gtk_drag_set_icon_stock (a_context: POINTER; a_stock_id: POINTER; a_hot_x: INTEGER_32; a_hot_y: INTEGER_32) is
 		-- gtk_drag_set_icon_stock (node at line 39758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_stock"
		}"
		end

	gtk_drag_unhighlight (a_widget: POINTER) is
 		-- gtk_drag_unhighlight (node at line 40283)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_unhighlight"
		}"
		end

	gtk_drag_source_set_icon_name (a_widget: POINTER; an_icon_name: POINTER) is
 		-- gtk_drag_source_set_icon_name (node at line 40712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon_name"
		}"
		end


end -- class GTKDND_EXTERNALS
