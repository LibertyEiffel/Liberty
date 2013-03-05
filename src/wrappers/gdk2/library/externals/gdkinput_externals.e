-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKINPUT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_device_free_history (an_events: POINTER; a_n_events: INTEGER_32) is
 		-- gdk_device_free_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_free_history"
		}"
		end

	gdk_device_get_axis (a_device: POINTER; an_axes: POINTER; an_use: INTEGER; a_value: POINTER): INTEGER_32 is
 		-- gdk_device_get_axis
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_axis"
		}"
		end

	gdk_device_get_axis_use (a_device: POINTER; an_index: NATURAL_32): INTEGER is
 		-- gdk_device_get_axis_use
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_axis_use"
		}"
		end

	gdk_device_get_core_pointer: POINTER is
 		-- gdk_device_get_core_pointer
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_core_pointer()"
		}"
		end

	gdk_device_get_has_cursor (a_device: POINTER): INTEGER_32 is
 		-- gdk_device_get_has_cursor
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_has_cursor"
		}"
		end

	gdk_device_get_history (a_device: POINTER; a_window: POINTER; a_start: NATURAL_32; a_stop: NATURAL_32; an_events: POINTER; a_n_events: POINTER): INTEGER_32 is
 		-- gdk_device_get_history
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_history"
		}"
		end

	gdk_device_get_key (a_device: POINTER; an_index: NATURAL_32; a_keyval: POINTER; a_modifiers: POINTER) is
 		-- gdk_device_get_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_key"
		}"
		end

	gdk_device_get_mode (a_device: POINTER): INTEGER is
 		-- gdk_device_get_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_mode"
		}"
		end

	gdk_device_get_n_axes (a_device: POINTER): INTEGER_32 is
 		-- gdk_device_get_n_axes
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_n_axes"
		}"
		end

	gdk_device_get_n_keys (a_device: POINTER): INTEGER_32 is
 		-- gdk_device_get_n_keys
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_n_keys"
		}"
		end

	gdk_device_get_name (a_device: POINTER): POINTER is
 		-- gdk_device_get_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_name"
		}"
		end

	gdk_device_get_source (a_device: POINTER): INTEGER is
 		-- gdk_device_get_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_source"
		}"
		end

	gdk_device_get_state (a_device: POINTER; a_window: POINTER; an_axes: POINTER; a_mask: POINTER) is
 		-- gdk_device_get_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_state"
		}"
		end

	gdk_device_get_type: NATURAL_64 is
 		-- gdk_device_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_get_type()"
		}"
		end

	gdk_device_set_axis_use (a_device: POINTER; an_index: NATURAL_32; an_use: INTEGER) is
 		-- gdk_device_set_axis_use
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_set_axis_use"
		}"
		end

	gdk_device_set_key (a_device: POINTER; an_index: NATURAL_32; a_keyval: NATURAL_32; a_modifiers: INTEGER) is
 		-- gdk_device_set_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_set_key"
		}"
		end

	gdk_device_set_mode (a_device: POINTER; a_mode: INTEGER): INTEGER_32 is
 		-- gdk_device_set_mode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_set_mode"
		}"
		end

	gdk_device_set_source (a_device: POINTER; a_source: INTEGER) is
 		-- gdk_device_set_source
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_device_set_source"
		}"
		end

	gdk_devices_list: POINTER is
 		-- gdk_devices_list
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_devices_list()"
		}"
		end

	gdk_input_set_extension_events (a_window: POINTER; a_mask: INTEGER_32; a_mode: INTEGER) is
 		-- gdk_input_set_extension_events
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_input_set_extension_events"
		}"
		end


end -- class GDKINPUT_EXTERNALS
