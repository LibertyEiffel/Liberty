-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accel_group_activate (an_accel_group: POINTER; an_accel_quark: NATURAL; an_acceleratable: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER): INTEGER is
 		-- gtk_accel_group_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_activate"
		}"
		end

	-- `hidden' function _gtk_accel_group_attach skipped.
	gtk_accel_group_connect (an_accel_group: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER; an_accel_flags: INTEGER; a_closure: POINTER) is
 		-- gtk_accel_group_connect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_connect"
		}"
		end

	gtk_accel_group_connect_by_path (an_accel_group: POINTER; an_accel_path: POINTER; a_closure: POINTER) is
 		-- gtk_accel_group_connect_by_path
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_connect_by_path"
		}"
		end

	-- `hidden' function _gtk_accel_group_detach skipped.
	gtk_accel_group_disconnect (an_accel_group: POINTER; a_closure: POINTER): INTEGER is
 		-- gtk_accel_group_disconnect
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_disconnect"
		}"
		end

	gtk_accel_group_disconnect_key (an_accel_group: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER): INTEGER is
 		-- gtk_accel_group_disconnect_key
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_disconnect_key"
		}"
		end

	gtk_accel_group_find (an_accel_group: POINTER; a_find_func: POINTER; a_data: POINTER): POINTER is
 		-- gtk_accel_group_find
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_find"
		}"
		end

	gtk_accel_group_from_accel_closure (a_closure: POINTER): POINTER is
 		-- gtk_accel_group_from_accel_closure
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_from_accel_closure"
		}"
		end

	gtk_accel_group_get_is_locked (an_accel_group: POINTER): INTEGER is
 		-- gtk_accel_group_get_is_locked
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_get_is_locked"
		}"
		end

	gtk_accel_group_get_modifier_mask (an_accel_group: POINTER): INTEGER is
 		-- gtk_accel_group_get_modifier_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_get_modifier_mask"
		}"
		end

	gtk_accel_group_get_type: like long_unsigned is
 		-- gtk_accel_group_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_get_type()"
		}"
		end

	gtk_accel_group_lock (an_accel_group: POINTER) is
 		-- gtk_accel_group_lock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_lock"
		}"
		end

	gtk_accel_group_new: POINTER is
 		-- gtk_accel_group_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_new()"
		}"
		end

	gtk_accel_group_query (an_accel_group: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER; a_n_entries: POINTER): POINTER is
 		-- gtk_accel_group_query
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_query"
		}"
		end

	-- `hidden' function _gtk_accel_group_reconnect skipped.
	gtk_accel_group_unlock (an_accel_group: POINTER) is
 		-- gtk_accel_group_unlock
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_unlock"
		}"
		end

	gtk_accel_groups_activate (an_object: POINTER; an_accel_key: NATURAL; an_accel_mods: INTEGER): INTEGER is
 		-- gtk_accel_groups_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_groups_activate"
		}"
		end

	gtk_accel_groups_from_object (an_object: POINTER): POINTER is
 		-- gtk_accel_groups_from_object
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_groups_from_object"
		}"
		end

	gtk_accelerator_get_default_mod_mask: NATURAL is
 		-- gtk_accelerator_get_default_mod_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_get_default_mod_mask()"
		}"
		end

	gtk_accelerator_get_label (an_accelerator_key: NATURAL; an_accelerator_mods: INTEGER): POINTER is
 		-- gtk_accelerator_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_get_label"
		}"
		end

	gtk_accelerator_name (an_accelerator_key: NATURAL; an_accelerator_mods: INTEGER): POINTER is
 		-- gtk_accelerator_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_name"
		}"
		end

	gtk_accelerator_parse (an_accelerator: POINTER; an_accelerator_key: POINTER; an_accelerator_mods: POINTER) is
 		-- gtk_accelerator_parse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_parse"
		}"
		end

	gtk_accelerator_set_default_mod_mask (a_default_mod_mask: INTEGER) is
 		-- gtk_accelerator_set_default_mod_mask
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_set_default_mod_mask"
		}"
		end

	gtk_accelerator_valid (a_keyval: NATURAL; a_modifiers: INTEGER): INTEGER is
 		-- gtk_accelerator_valid
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_valid"
		}"
		end


end -- class GTKACCELGROUP_EXTERNALS
