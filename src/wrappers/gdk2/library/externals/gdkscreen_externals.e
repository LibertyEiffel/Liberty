-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKSCREEN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_screen_broadcast_client_message (a_screen: POINTER; an_event: POINTER) is
 		-- gdk_screen_broadcast_client_message
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_broadcast_client_message"
		}"
		end

	gdk_screen_get_active_window (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_active_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_active_window"
		}"
		end

	gdk_screen_get_default: POINTER is
 		-- gdk_screen_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_default()"
		}"
		end

	gdk_screen_get_default_colormap (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_default_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_default_colormap"
		}"
		end

	gdk_screen_get_display (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_display"
		}"
		end

	gdk_screen_get_font_options (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_font_options
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_font_options"
		}"
		end

	gdk_screen_get_height (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_height
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_height"
		}"
		end

	gdk_screen_get_height_mm (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_height_mm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_height_mm"
		}"
		end

	gdk_screen_get_monitor_at_point (a_screen: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- gdk_screen_get_monitor_at_point
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_monitor_at_point"
		}"
		end

	gdk_screen_get_monitor_at_window (a_screen: POINTER; a_window: POINTER): INTEGER_32 is
 		-- gdk_screen_get_monitor_at_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_monitor_at_window"
		}"
		end

	gdk_screen_get_monitor_geometry (a_screen: POINTER; a_monitor_num: INTEGER_32; a_dest: POINTER) is
 		-- gdk_screen_get_monitor_geometry
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_monitor_geometry"
		}"
		end

	gdk_screen_get_monitor_height_mm (a_screen: POINTER; a_monitor_num: INTEGER_32): INTEGER_32 is
 		-- gdk_screen_get_monitor_height_mm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_monitor_height_mm"
		}"
		end

	gdk_screen_get_monitor_plug_name (a_screen: POINTER; a_monitor_num: INTEGER_32): POINTER is
 		-- gdk_screen_get_monitor_plug_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_monitor_plug_name"
		}"
		end

	gdk_screen_get_monitor_width_mm (a_screen: POINTER; a_monitor_num: INTEGER_32): INTEGER_32 is
 		-- gdk_screen_get_monitor_width_mm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_monitor_width_mm"
		}"
		end

	gdk_screen_get_n_monitors (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_n_monitors
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_n_monitors"
		}"
		end

	gdk_screen_get_number (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_number
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_number"
		}"
		end

	gdk_screen_get_primary_monitor (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_primary_monitor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_primary_monitor"
		}"
		end

	gdk_screen_get_resolution (a_screen: POINTER): REAL_64 is
 		-- gdk_screen_get_resolution
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_resolution"
		}"
		end

	gdk_screen_get_rgb_colormap (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_rgb_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_rgb_colormap"
		}"
		end

	gdk_screen_get_rgb_visual (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_rgb_visual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_rgb_visual"
		}"
		end

	gdk_screen_get_rgba_colormap (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_rgba_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_rgba_colormap"
		}"
		end

	gdk_screen_get_rgba_visual (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_rgba_visual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_rgba_visual"
		}"
		end

	gdk_screen_get_root_window (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_root_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_root_window"
		}"
		end

	gdk_screen_get_setting (a_screen: POINTER; a_name: POINTER; a_value: POINTER): INTEGER_32 is
 		-- gdk_screen_get_setting
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_setting"
		}"
		end

	gdk_screen_get_system_colormap (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_system_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_system_colormap"
		}"
		end

	gdk_screen_get_system_visual (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_system_visual
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_system_visual"
		}"
		end

	gdk_screen_get_toplevel_windows (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_toplevel_windows
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_toplevel_windows"
		}"
		end

	gdk_screen_get_type: NATURAL_64 is
 		-- gdk_screen_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_type()"
		}"
		end

	gdk_screen_get_width (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_width
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_width"
		}"
		end

	gdk_screen_get_width_mm (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_get_width_mm
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_width_mm"
		}"
		end

	gdk_screen_get_window_stack (a_screen: POINTER): POINTER is
 		-- gdk_screen_get_window_stack
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_get_window_stack"
		}"
		end

	gdk_screen_is_composited (a_screen: POINTER): INTEGER_32 is
 		-- gdk_screen_is_composited
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_is_composited"
		}"
		end

	gdk_screen_list_visuals (a_screen: POINTER): POINTER is
 		-- gdk_screen_list_visuals
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_list_visuals"
		}"
		end

	gdk_screen_make_display_name (a_screen: POINTER): POINTER is
 		-- gdk_screen_make_display_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_make_display_name"
		}"
		end

	gdk_screen_set_default_colormap (a_screen: POINTER; a_colormap: POINTER) is
 		-- gdk_screen_set_default_colormap
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_set_default_colormap"
		}"
		end

	gdk_screen_set_font_options (a_screen: POINTER; an_options: POINTER) is
 		-- gdk_screen_set_font_options
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_set_font_options"
		}"
		end

	gdk_screen_set_resolution (a_screen: POINTER; a_dpi: REAL_64) is
 		-- gdk_screen_set_resolution
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_screen_set_resolution"
		}"
		end


end -- class GDKSCREEN_EXTERNALS
