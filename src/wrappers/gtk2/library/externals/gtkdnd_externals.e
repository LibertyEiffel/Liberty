-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKDND_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_drag_begin (a_widget: POINTER; a_targets: POINTER; an_actions: INTEGER; a_button: INTEGER; an_event: POINTER): POINTER is
 		-- gtk_drag_begin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_begin"
		}"
		end

	gtk_drag_check_threshold (a_widget: POINTER; a_start_x: INTEGER; a_start_y: INTEGER; a_current_x: INTEGER; a_current_y: INTEGER): INTEGER is
 		-- gtk_drag_check_threshold
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_check_threshold"
		}"
		end

	gtk_drag_dest_add_image_targets (a_widget: POINTER) is
 		-- gtk_drag_dest_add_image_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_add_image_targets"
		}"
		end

	gtk_drag_dest_add_text_targets (a_widget: POINTER) is
 		-- gtk_drag_dest_add_text_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_add_text_targets"
		}"
		end

	gtk_drag_dest_add_uri_targets (a_widget: POINTER) is
 		-- gtk_drag_dest_add_uri_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_add_uri_targets"
		}"
		end

	gtk_drag_dest_find_target (a_widget: POINTER; a_context: POINTER; a_target_list: POINTER): POINTER is
 		-- gtk_drag_dest_find_target
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_find_target"
		}"
		end

	gtk_drag_dest_get_target_list (a_widget: POINTER): POINTER is
 		-- gtk_drag_dest_get_target_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_get_target_list"
		}"
		end

	gtk_drag_dest_get_track_motion (a_widget: POINTER): INTEGER is
 		-- gtk_drag_dest_get_track_motion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_get_track_motion"
		}"
		end

	-- `hidden' function _gtk_drag_dest_handle_event skipped.
	gtk_drag_dest_set (a_widget: POINTER; a_flags: INTEGER; a_targets: POINTER; a_n_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_drag_dest_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set"
		}"
		end

	gtk_drag_dest_set_proxy (a_widget: POINTER; a_proxy_window: POINTER; a_protocol: INTEGER; an_use_coordinates: INTEGER) is
 		-- gtk_drag_dest_set_proxy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set_proxy"
		}"
		end

	gtk_drag_dest_set_target_list (a_widget: POINTER; a_target_list: POINTER) is
 		-- gtk_drag_dest_set_target_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set_target_list"
		}"
		end

	gtk_drag_dest_set_track_motion (a_widget: POINTER; a_track_motion: INTEGER) is
 		-- gtk_drag_dest_set_track_motion
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_set_track_motion"
		}"
		end

	gtk_drag_dest_unset (a_widget: POINTER) is
 		-- gtk_drag_dest_unset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_dest_unset"
		}"
		end

	gtk_drag_finish (a_context: POINTER; a_success: INTEGER; a_del: INTEGER; a_time: NATURAL) is
 		-- gtk_drag_finish
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_finish"
		}"
		end

	gtk_drag_get_data (a_widget: POINTER; a_context: POINTER; a_target: POINTER; a_time: NATURAL) is
 		-- gtk_drag_get_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_get_data"
		}"
		end

	gtk_drag_get_source_widget (a_context: POINTER): POINTER is
 		-- gtk_drag_get_source_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_get_source_widget"
		}"
		end

	gtk_drag_highlight (a_widget: POINTER) is
 		-- gtk_drag_highlight
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_highlight"
		}"
		end

	gtk_drag_set_icon_default (a_context: POINTER) is
 		-- gtk_drag_set_icon_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_default"
		}"
		end

	gtk_drag_set_icon_name (a_context: POINTER; an_icon_name: POINTER; a_hot_x: INTEGER; a_hot_y: INTEGER) is
 		-- gtk_drag_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_name"
		}"
		end

	gtk_drag_set_icon_pixbuf (a_context: POINTER; a_pixbuf: POINTER; a_hot_x: INTEGER; a_hot_y: INTEGER) is
 		-- gtk_drag_set_icon_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_pixbuf"
		}"
		end

	gtk_drag_set_icon_pixmap (a_context: POINTER; a_colormap: POINTER; a_pixmap: POINTER; a_mask: POINTER; a_hot_x: INTEGER; a_hot_y: INTEGER) is
 		-- gtk_drag_set_icon_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_pixmap"
		}"
		end

	gtk_drag_set_icon_stock (a_context: POINTER; a_stock_id: POINTER; a_hot_x: INTEGER; a_hot_y: INTEGER) is
 		-- gtk_drag_set_icon_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_stock"
		}"
		end

	gtk_drag_set_icon_widget (a_context: POINTER; a_widget: POINTER; a_hot_x: INTEGER; a_hot_y: INTEGER) is
 		-- gtk_drag_set_icon_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_set_icon_widget"
		}"
		end

	gtk_drag_source_add_image_targets (a_widget: POINTER) is
 		-- gtk_drag_source_add_image_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_add_image_targets"
		}"
		end

	gtk_drag_source_add_text_targets (a_widget: POINTER) is
 		-- gtk_drag_source_add_text_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_add_text_targets"
		}"
		end

	gtk_drag_source_add_uri_targets (a_widget: POINTER) is
 		-- gtk_drag_source_add_uri_targets
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_add_uri_targets"
		}"
		end

	gtk_drag_source_get_target_list (a_widget: POINTER): POINTER is
 		-- gtk_drag_source_get_target_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_get_target_list"
		}"
		end

	-- `hidden' function _gtk_drag_source_handle_event skipped.
	gtk_drag_source_set (a_widget: POINTER; a_start_button_mask: INTEGER; a_targets: POINTER; a_n_targets: INTEGER; an_actions: INTEGER) is
 		-- gtk_drag_source_set
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set"
		}"
		end

	gtk_drag_source_set_icon (a_widget: POINTER; a_colormap: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gtk_drag_source_set_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon"
		}"
		end

	gtk_drag_source_set_icon_name (a_widget: POINTER; an_icon_name: POINTER) is
 		-- gtk_drag_source_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon_name"
		}"
		end

	gtk_drag_source_set_icon_pixbuf (a_widget: POINTER; a_pixbuf: POINTER) is
 		-- gtk_drag_source_set_icon_pixbuf
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon_pixbuf"
		}"
		end

	gtk_drag_source_set_icon_stock (a_widget: POINTER; a_stock_id: POINTER) is
 		-- gtk_drag_source_set_icon_stock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_icon_stock"
		}"
		end

	gtk_drag_source_set_target_list (a_widget: POINTER; a_target_list: POINTER) is
 		-- gtk_drag_source_set_target_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_set_target_list"
		}"
		end

	gtk_drag_source_unset (a_widget: POINTER) is
 		-- gtk_drag_source_unset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_source_unset"
		}"
		end

	gtk_drag_unhighlight (a_widget: POINTER) is
 		-- gtk_drag_unhighlight
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_drag_unhighlight"
		}"
		end


end -- class GTKDND_EXTERNALS
