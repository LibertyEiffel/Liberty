-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKWINDOW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_get_default_root_window: POINTER is
 		-- gdk_get_default_root_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_get_default_root_window()"
		}"
		end

	gdk_offscreen_window_get_embedder (a_window: POINTER): POINTER is
 		-- gdk_offscreen_window_get_embedder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_offscreen_window_get_embedder"
		}"
		end

	gdk_offscreen_window_get_pixmap (a_window: POINTER): POINTER is
 		-- gdk_offscreen_window_get_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_offscreen_window_get_pixmap"
		}"
		end

	gdk_offscreen_window_set_embedder (a_window: POINTER; an_embedder: POINTER) is
 		-- gdk_offscreen_window_set_embedder
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_offscreen_window_set_embedder"
		}"
		end

	gdk_window_add_filter (a_window: POINTER; a_function: POINTER; a_data: POINTER) is
 		-- gdk_window_add_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_add_filter"
		}"
		end

	gdk_window_at_pointer (a_win_x: POINTER; a_win_y: POINTER): POINTER is
 		-- gdk_window_at_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_at_pointer"
		}"
		end

	gdk_window_beep (a_window: POINTER) is
 		-- gdk_window_beep
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_beep"
		}"
		end

	gdk_window_begin_move_drag (a_window: POINTER; a_button: INTEGER_32; a_root_x: INTEGER_32; a_root_y: INTEGER_32; a_timestamp: NATURAL_32) is
 		-- gdk_window_begin_move_drag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_begin_move_drag"
		}"
		end

	gdk_window_begin_paint_rect (a_window: POINTER; a_rectangle: POINTER) is
 		-- gdk_window_begin_paint_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_begin_paint_rect"
		}"
		end

	gdk_window_begin_paint_region (a_window: POINTER; a_region: POINTER) is
 		-- gdk_window_begin_paint_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_begin_paint_region"
		}"
		end

	gdk_window_begin_resize_drag (a_window: POINTER; an_edge: INTEGER; a_button: INTEGER_32; a_root_x: INTEGER_32; a_root_y: INTEGER_32; a_timestamp: NATURAL_32) is
 		-- gdk_window_begin_resize_drag
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_begin_resize_drag"
		}"
		end

	gdk_window_clear (a_window: POINTER) is
 		-- gdk_window_clear
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_clear"
		}"
		end

	gdk_window_clear_area (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gdk_window_clear_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_clear_area"
		}"
		end

	gdk_window_clear_area_e (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gdk_window_clear_area_e
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_clear_area_e"
		}"
		end

	gdk_window_configure_finished (a_window: POINTER) is
 		-- gdk_window_configure_finished
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_configure_finished"
		}"
		end

	gdk_window_constrain_size (a_geometry: POINTER; a_flags: NATURAL_32; a_width: INTEGER_32; a_height: INTEGER_32; a_new_width: POINTER; a_new_height: POINTER) is
 		-- gdk_window_constrain_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_constrain_size"
		}"
		end

	gdk_window_coords_from_parent (a_window: POINTER; a_parent_x: REAL_64; a_parent_y: REAL_64; a_x: POINTER; a_y: POINTER) is
 		-- gdk_window_coords_from_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_coords_from_parent"
		}"
		end

	gdk_window_coords_to_parent (a_window: POINTER; a_x: REAL_64; a_y: REAL_64; a_parent_x: POINTER; a_parent_y: POINTER) is
 		-- gdk_window_coords_to_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_coords_to_parent"
		}"
		end

	gdk_window_create_similar_surface (a_window: POINTER; a_content: INTEGER; a_width: INTEGER_32; a_height: INTEGER_32): POINTER is
 		-- gdk_window_create_similar_surface
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_create_similar_surface"
		}"
		end

	gdk_window_deiconify (a_window: POINTER) is
 		-- gdk_window_deiconify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_deiconify"
		}"
		end

	gdk_window_destroy (a_window: POINTER) is
 		-- gdk_window_destroy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_destroy"
		}"
		end

	gdk_window_enable_synchronized_configure (a_window: POINTER) is
 		-- gdk_window_enable_synchronized_configure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_enable_synchronized_configure"
		}"
		end

	gdk_window_end_paint (a_window: POINTER) is
 		-- gdk_window_end_paint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_end_paint"
		}"
		end

	gdk_window_ensure_native (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_ensure_native
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_ensure_native"
		}"
		end

	gdk_window_flush (a_window: POINTER) is
 		-- gdk_window_flush
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_flush"
		}"
		end

	gdk_window_focus (a_window: POINTER; a_timestamp: NATURAL_32) is
 		-- gdk_window_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_focus"
		}"
		end

	gdk_window_freeze_toplevel_updates_libgtk_only (a_window: POINTER) is
 		-- gdk_window_freeze_toplevel_updates_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_freeze_toplevel_updates_libgtk_only"
		}"
		end

	gdk_window_freeze_updates (a_window: POINTER) is
 		-- gdk_window_freeze_updates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_freeze_updates"
		}"
		end

	gdk_window_fullscreen (a_window: POINTER) is
 		-- gdk_window_fullscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_fullscreen"
		}"
		end

	gdk_window_geometry_changed (a_window: POINTER) is
 		-- gdk_window_geometry_changed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_geometry_changed"
		}"
		end

	gdk_window_get_accept_focus (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_get_accept_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_accept_focus"
		}"
		end

	gdk_window_get_background_pattern (a_window: POINTER): POINTER is
 		-- gdk_window_get_background_pattern
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_background_pattern"
		}"
		end

	gdk_window_get_children (a_window: POINTER): POINTER is
 		-- gdk_window_get_children
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_children"
		}"
		end

	gdk_window_get_composited (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_get_composited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_composited"
		}"
		end

	gdk_window_get_cursor (a_window: POINTER): POINTER is
 		-- gdk_window_get_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_cursor"
		}"
		end

	gdk_window_get_decorations (a_window: POINTER; a_decorations: POINTER): INTEGER_32 is
 		-- gdk_window_get_decorations
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_decorations"
		}"
		end

	gdk_window_get_display (a_window: POINTER): POINTER is
 		-- gdk_window_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_display"
		}"
		end

	gdk_window_get_effective_parent (a_window: POINTER): POINTER is
 		-- gdk_window_get_effective_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_effective_parent"
		}"
		end

	gdk_window_get_effective_toplevel (a_window: POINTER): POINTER is
 		-- gdk_window_get_effective_toplevel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_effective_toplevel"
		}"
		end

	gdk_window_get_events (a_window: POINTER): INTEGER is
 		-- gdk_window_get_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_events"
		}"
		end

	gdk_window_get_focus_on_map (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_get_focus_on_map
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_focus_on_map"
		}"
		end

	gdk_window_get_frame_extents (a_window: POINTER; a_rect: POINTER) is
 		-- gdk_window_get_frame_extents
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_frame_extents"
		}"
		end

	gdk_window_get_geometry (a_window: POINTER; a_x: POINTER; a_y: POINTER; a_width: POINTER; a_height: POINTER; a_depth: POINTER) is
 		-- gdk_window_get_geometry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_geometry"
		}"
		end

	gdk_window_get_group (a_window: POINTER): POINTER is
 		-- gdk_window_get_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_group"
		}"
		end

	gdk_window_get_height (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_get_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_height"
		}"
		end

	gdk_window_get_internal_paint_info (a_window: POINTER; a_real_drawable: POINTER; a_x_offset: POINTER; a_y_offset: POINTER) is
 		-- gdk_window_get_internal_paint_info
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_internal_paint_info"
		}"
		end

	gdk_window_get_modal_hint (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_get_modal_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_modal_hint"
		}"
		end

	gdk_window_get_origin (a_window: POINTER; a_x: POINTER; a_y: POINTER): INTEGER_32 is
 		-- gdk_window_get_origin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_origin"
		}"
		end

	gdk_window_get_parent (a_window: POINTER): POINTER is
 		-- gdk_window_get_parent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_parent"
		}"
		end

	gdk_window_get_pointer (a_window: POINTER; a_x: POINTER; a_y: POINTER; a_mask: POINTER): POINTER is
 		-- gdk_window_get_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_pointer"
		}"
		end

	gdk_window_get_position (a_window: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gdk_window_get_position
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_position"
		}"
		end

	gdk_window_get_root_coords (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_root_x: POINTER; a_root_y: POINTER) is
 		-- gdk_window_get_root_coords
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_root_coords"
		}"
		end

	gdk_window_get_root_origin (a_window: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- gdk_window_get_root_origin
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_root_origin"
		}"
		end

	gdk_window_get_screen (a_window: POINTER): POINTER is
 		-- gdk_window_get_screen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_screen"
		}"
		end

	gdk_window_get_state (a_window: POINTER): INTEGER is
 		-- gdk_window_get_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_state"
		}"
		end

	gdk_window_get_toplevel (a_window: POINTER): POINTER is
 		-- gdk_window_get_toplevel
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_toplevel"
		}"
		end

	gdk_window_get_type_hint (a_window: POINTER): INTEGER is
 		-- gdk_window_get_type_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_type_hint"
		}"
		end

	gdk_window_get_update_area (a_window: POINTER): POINTER is
 		-- gdk_window_get_update_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_update_area"
		}"
		end

	gdk_window_get_user_data (a_window: POINTER; a_data: POINTER) is
 		-- gdk_window_get_user_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_user_data"
		}"
		end

	gdk_window_get_visual (a_window: POINTER): POINTER is
 		-- gdk_window_get_visual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_visual"
		}"
		end

	gdk_window_get_width (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_get_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_width"
		}"
		end

	gdk_window_get_window_type (a_window: POINTER): INTEGER is
 		-- gdk_window_get_window_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_get_window_type"
		}"
		end

	gdk_window_has_native (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_has_native
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_has_native"
		}"
		end

	gdk_window_hide (a_window: POINTER) is
 		-- gdk_window_hide
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_hide"
		}"
		end

	gdk_window_iconify (a_window: POINTER) is
 		-- gdk_window_iconify
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_iconify"
		}"
		end

	gdk_window_input_shape_combine_mask (a_window: POINTER; a_mask: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gdk_window_input_shape_combine_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_input_shape_combine_mask"
		}"
		end

	gdk_window_input_shape_combine_region (a_window: POINTER; a_shape_region: POINTER; an_offset_x: INTEGER_32; an_offset_y: INTEGER_32) is
 		-- gdk_window_input_shape_combine_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_input_shape_combine_region"
		}"
		end

	gdk_window_invalidate_maybe_recurse (a_window: POINTER; a_region: POINTER; a_child_func: POINTER; an_user_data: POINTER) is
 		-- gdk_window_invalidate_maybe_recurse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_invalidate_maybe_recurse"
		}"
		end

	gdk_window_invalidate_rect (a_window: POINTER; a_rect: POINTER; an_invalidate_children: INTEGER_32) is
 		-- gdk_window_invalidate_rect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_invalidate_rect"
		}"
		end

	gdk_window_invalidate_region (a_window: POINTER; a_region: POINTER; an_invalidate_children: INTEGER_32) is
 		-- gdk_window_invalidate_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_invalidate_region"
		}"
		end

	gdk_window_is_destroyed (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_is_destroyed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_is_destroyed"
		}"
		end

	gdk_window_is_input_only (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_is_input_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_is_input_only"
		}"
		end

	gdk_window_is_shaped (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_is_shaped
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_is_shaped"
		}"
		end

	gdk_window_is_viewable (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_is_viewable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_is_viewable"
		}"
		end

	gdk_window_is_visible (a_window: POINTER): INTEGER_32 is
 		-- gdk_window_is_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_is_visible"
		}"
		end

	gdk_window_lower (a_window: POINTER) is
 		-- gdk_window_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_lower"
		}"
		end

	gdk_window_maximize (a_window: POINTER) is
 		-- gdk_window_maximize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_maximize"
		}"
		end

	gdk_window_merge_child_input_shapes (a_window: POINTER) is
 		-- gdk_window_merge_child_input_shapes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_merge_child_input_shapes"
		}"
		end

	gdk_window_merge_child_shapes (a_window: POINTER) is
 		-- gdk_window_merge_child_shapes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_merge_child_shapes"
		}"
		end

	gdk_window_move (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gdk_window_move
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_move"
		}"
		end

	gdk_window_move_region (a_window: POINTER; a_region: POINTER; a_dx: INTEGER_32; a_dy: INTEGER_32) is
 		-- gdk_window_move_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_move_region"
		}"
		end

	gdk_window_move_resize (a_window: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gdk_window_move_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_move_resize"
		}"
		end

	gdk_window_new (a_parent: POINTER; an_attributes: POINTER; an_attributes_mask: INTEGER_32): POINTER is
 		-- gdk_window_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_new"
		}"
		end

	gdk_window_object_get_type: NATURAL_64 is
 		-- gdk_window_object_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_object_get_type()"
		}"
		end

	gdk_window_peek_children (a_window: POINTER): POINTER is
 		-- gdk_window_peek_children
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_peek_children"
		}"
		end

	gdk_window_process_all_updates is
 		-- gdk_window_process_all_updates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_process_all_updates()"
		}"
		end

	gdk_window_process_updates (a_window: POINTER; an_update_children: INTEGER_32) is
 		-- gdk_window_process_updates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_process_updates"
		}"
		end

	gdk_window_raise (a_window: POINTER) is
 		-- gdk_window_raise
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_raise"
		}"
		end

	gdk_window_redirect_to_drawable (a_window: POINTER; a_drawable: POINTER; a_src_x: INTEGER_32; a_src_y: INTEGER_32; a_dest_x: INTEGER_32; a_dest_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gdk_window_redirect_to_drawable
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_redirect_to_drawable"
		}"
		end

	gdk_window_register_dnd (a_window: POINTER) is
 		-- gdk_window_register_dnd
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_register_dnd"
		}"
		end

	gdk_window_remove_filter (a_window: POINTER; a_function: POINTER; a_data: POINTER) is
 		-- gdk_window_remove_filter
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_remove_filter"
		}"
		end

	gdk_window_remove_redirection (a_window: POINTER) is
 		-- gdk_window_remove_redirection
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_remove_redirection"
		}"
		end

	gdk_window_reparent (a_window: POINTER; a_new_parent: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gdk_window_reparent
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_reparent"
		}"
		end

	gdk_window_resize (a_window: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gdk_window_resize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_resize"
		}"
		end

	gdk_window_restack (a_window: POINTER; a_sibling: POINTER; an_above: INTEGER_32) is
 		-- gdk_window_restack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_restack"
		}"
		end

	gdk_window_scroll (a_window: POINTER; a_dx: INTEGER_32; a_dy: INTEGER_32) is
 		-- gdk_window_scroll
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_scroll"
		}"
		end

	gdk_window_set_accept_focus (a_window: POINTER; an_accept_focus: INTEGER_32) is
 		-- gdk_window_set_accept_focus
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_accept_focus"
		}"
		end

	gdk_window_set_back_pixmap (a_window: POINTER; a_pixmap: POINTER; a_parent_relative: INTEGER_32) is
 		-- gdk_window_set_back_pixmap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_back_pixmap"
		}"
		end

	gdk_window_set_background (a_window: POINTER; a_color: POINTER) is
 		-- gdk_window_set_background
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_background"
		}"
		end

	gdk_window_set_child_input_shapes (a_window: POINTER) is
 		-- gdk_window_set_child_input_shapes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_child_input_shapes"
		}"
		end

	gdk_window_set_child_shapes (a_window: POINTER) is
 		-- gdk_window_set_child_shapes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_child_shapes"
		}"
		end

	gdk_window_set_composited (a_window: POINTER; a_composited: INTEGER_32) is
 		-- gdk_window_set_composited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_composited"
		}"
		end

	gdk_window_set_cursor (a_window: POINTER; a_cursor: POINTER) is
 		-- gdk_window_set_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_cursor"
		}"
		end

	gdk_window_set_debug_updates (a_setting: INTEGER_32) is
 		-- gdk_window_set_debug_updates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_debug_updates"
		}"
		end

	gdk_window_set_decorations (a_window: POINTER; a_decorations: INTEGER) is
 		-- gdk_window_set_decorations
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_decorations"
		}"
		end

	gdk_window_set_events (a_window: POINTER; an_event_mask: INTEGER) is
 		-- gdk_window_set_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_events"
		}"
		end

	gdk_window_set_focus_on_map (a_window: POINTER; a_focus_on_map: INTEGER_32) is
 		-- gdk_window_set_focus_on_map
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_focus_on_map"
		}"
		end

	gdk_window_set_functions (a_window: POINTER; a_functions: INTEGER) is
 		-- gdk_window_set_functions
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_functions"
		}"
		end

	gdk_window_set_geometry_hints (a_window: POINTER; a_geometry: POINTER; a_geom_mask: INTEGER) is
 		-- gdk_window_set_geometry_hints
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_geometry_hints"
		}"
		end

	gdk_window_set_group (a_window: POINTER; a_leader: POINTER) is
 		-- gdk_window_set_group
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_group"
		}"
		end

	gdk_window_set_icon (a_window: POINTER; an_icon_window: POINTER; a_pixmap: POINTER; a_mask: POINTER) is
 		-- gdk_window_set_icon
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_icon"
		}"
		end

	gdk_window_set_icon_list (a_window: POINTER; a_pixbufs: POINTER) is
 		-- gdk_window_set_icon_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_icon_list"
		}"
		end

	gdk_window_set_icon_name (a_window: POINTER; a_name: POINTER) is
 		-- gdk_window_set_icon_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_icon_name"
		}"
		end

	gdk_window_set_keep_above (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gdk_window_set_keep_above
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_keep_above"
		}"
		end

	gdk_window_set_keep_below (a_window: POINTER; a_setting: INTEGER_32) is
 		-- gdk_window_set_keep_below
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_keep_below"
		}"
		end

	gdk_window_set_modal_hint (a_window: POINTER; a_modal: INTEGER_32) is
 		-- gdk_window_set_modal_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_modal_hint"
		}"
		end

	gdk_window_set_opacity (a_window: POINTER; an_opacity: REAL_64) is
 		-- gdk_window_set_opacity
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_opacity"
		}"
		end

	gdk_window_set_override_redirect (a_window: POINTER; an_override_redirect: INTEGER_32) is
 		-- gdk_window_set_override_redirect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_override_redirect"
		}"
		end

	gdk_window_set_role (a_window: POINTER; a_role: POINTER) is
 		-- gdk_window_set_role
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_role"
		}"
		end

	gdk_window_set_skip_pager_hint (a_window: POINTER; a_skips_pager: INTEGER_32) is
 		-- gdk_window_set_skip_pager_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_skip_pager_hint"
		}"
		end

	gdk_window_set_skip_taskbar_hint (a_window: POINTER; a_skips_taskbar: INTEGER_32) is
 		-- gdk_window_set_skip_taskbar_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_skip_taskbar_hint"
		}"
		end

	gdk_window_set_startup_id (a_window: POINTER; a_startup_id: POINTER) is
 		-- gdk_window_set_startup_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_startup_id"
		}"
		end

	gdk_window_set_static_gravities (a_window: POINTER; an_use_static: INTEGER_32): INTEGER_32 is
 		-- gdk_window_set_static_gravities
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_static_gravities"
		}"
		end

	gdk_window_set_title (a_window: POINTER; a_title: POINTER) is
 		-- gdk_window_set_title
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_title"
		}"
		end

	gdk_window_set_transient_for (a_window: POINTER; a_parent: POINTER) is
 		-- gdk_window_set_transient_for
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_transient_for"
		}"
		end

	gdk_window_set_type_hint (a_window: POINTER; a_hint: INTEGER) is
 		-- gdk_window_set_type_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_type_hint"
		}"
		end

	gdk_window_set_urgency_hint (a_window: POINTER; an_urgent: INTEGER_32) is
 		-- gdk_window_set_urgency_hint
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_urgency_hint"
		}"
		end

	gdk_window_set_user_data (a_window: POINTER; an_user_data: POINTER) is
 		-- gdk_window_set_user_data
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_set_user_data"
		}"
		end

	gdk_window_shape_combine_mask (a_window: POINTER; a_mask: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gdk_window_shape_combine_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_shape_combine_mask"
		}"
		end

	gdk_window_shape_combine_region (a_window: POINTER; a_shape_region: POINTER; an_offset_x: INTEGER_32; an_offset_y: INTEGER_32) is
 		-- gdk_window_shape_combine_region
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_shape_combine_region"
		}"
		end

	gdk_window_show (a_window: POINTER) is
 		-- gdk_window_show
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_show"
		}"
		end

	gdk_window_show_unraised (a_window: POINTER) is
 		-- gdk_window_show_unraised
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_show_unraised"
		}"
		end

	gdk_window_stick (a_window: POINTER) is
 		-- gdk_window_stick
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_stick"
		}"
		end

	gdk_window_thaw_toplevel_updates_libgtk_only (a_window: POINTER) is
 		-- gdk_window_thaw_toplevel_updates_libgtk_only
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_thaw_toplevel_updates_libgtk_only"
		}"
		end

	gdk_window_thaw_updates (a_window: POINTER) is
 		-- gdk_window_thaw_updates
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_thaw_updates"
		}"
		end

	gdk_window_unfullscreen (a_window: POINTER) is
 		-- gdk_window_unfullscreen
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_unfullscreen"
		}"
		end

	gdk_window_unmaximize (a_window: POINTER) is
 		-- gdk_window_unmaximize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_unmaximize"
		}"
		end

	gdk_window_unstick (a_window: POINTER) is
 		-- gdk_window_unstick
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_unstick"
		}"
		end

	gdk_window_withdraw (a_window: POINTER) is
 		-- gdk_window_withdraw
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_window_withdraw"
		}"
		end


end -- class GDKWINDOW_EXTERNALS
