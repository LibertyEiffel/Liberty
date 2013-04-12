-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDKKEYS_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gdk_keymap_add_virtual_modifiers (a_keymap: POINTER; a_state: POINTER) is
 		-- gdk_keymap_add_virtual_modifiers
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_add_virtual_modifiers"
		}"
		end

	gdk_keymap_get_caps_lock_state (a_keymap: POINTER): INTEGER_32 is
 		-- gdk_keymap_get_caps_lock_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_caps_lock_state"
		}"
		end

	gdk_keymap_get_default: POINTER is
 		-- gdk_keymap_get_default
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_default()"
		}"
		end

	gdk_keymap_get_direction (a_keymap: POINTER): INTEGER is
 		-- gdk_keymap_get_direction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_direction"
		}"
		end

	gdk_keymap_get_entries_for_keycode (a_keymap: POINTER; a_hardware_keycode: NATURAL_32; a_keys: POINTER; a_keyvals: POINTER; a_n_entries: POINTER): INTEGER_32 is
 		-- gdk_keymap_get_entries_for_keycode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_entries_for_keycode"
		}"
		end

	gdk_keymap_get_entries_for_keyval (a_keymap: POINTER; a_keyval: NATURAL_32; a_keys: POINTER; a_n_keys: POINTER): INTEGER_32 is
 		-- gdk_keymap_get_entries_for_keyval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_entries_for_keyval"
		}"
		end

	gdk_keymap_get_for_display (a_display: POINTER): POINTER is
 		-- gdk_keymap_get_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_for_display"
		}"
		end

	gdk_keymap_get_type: NATURAL_64 is
 		-- gdk_keymap_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_get_type()"
		}"
		end

	gdk_keymap_have_bidi_layouts (a_keymap: POINTER): INTEGER_32 is
 		-- gdk_keymap_have_bidi_layouts
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_have_bidi_layouts"
		}"
		end

	gdk_keymap_lookup_key (a_keymap: POINTER; a_key: POINTER): NATURAL_32 is
 		-- gdk_keymap_lookup_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_lookup_key"
		}"
		end

	gdk_keymap_map_virtual_modifiers (a_keymap: POINTER; a_state: POINTER): INTEGER_32 is
 		-- gdk_keymap_map_virtual_modifiers
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_map_virtual_modifiers"
		}"
		end

	gdk_keymap_translate_keyboard_state (a_keymap: POINTER; a_hardware_keycode: NATURAL_32; a_state: INTEGER; a_group: INTEGER_32; a_keyval: POINTER; an_effective_group: POINTER; a_level: POINTER; a_consumed_modifiers: POINTER): INTEGER_32 is
 		-- gdk_keymap_translate_keyboard_state
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keymap_translate_keyboard_state"
		}"
		end

	gdk_keyval_convert_case (a_symbol: NATURAL_32; a_lower: POINTER; an_upper: POINTER) is
 		-- gdk_keyval_convert_case
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_convert_case"
		}"
		end

	gdk_keyval_from_name (a_keyval_name: POINTER): NATURAL_32 is
 		-- gdk_keyval_from_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_from_name"
		}"
		end

	gdk_keyval_is_lower (a_keyval: NATURAL_32): INTEGER_32 is
 		-- gdk_keyval_is_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_is_lower"
		}"
		end

	gdk_keyval_is_upper (a_keyval: NATURAL_32): INTEGER_32 is
 		-- gdk_keyval_is_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_is_upper"
		}"
		end

	gdk_keyval_name (a_keyval: NATURAL_32): POINTER is
 		-- gdk_keyval_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_name"
		}"
		end

	gdk_keyval_to_lower (a_keyval: NATURAL_32): NATURAL_32 is
 		-- gdk_keyval_to_lower
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_to_lower"
		}"
		end

	gdk_keyval_to_unicode (a_keyval: NATURAL_32): NATURAL_32 is
 		-- gdk_keyval_to_unicode
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_to_unicode"
		}"
		end

	gdk_keyval_to_upper (a_keyval: NATURAL_32): NATURAL_32 is
 		-- gdk_keyval_to_upper
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_keyval_to_upper"
		}"
		end

	gdk_unicode_to_keyval (a_wc: NATURAL_32): NATURAL_32 is
 		-- gdk_unicode_to_keyval
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gdk_unicode_to_keyval"
		}"
		end


end -- class GDKKEYS_EXTERNALS
