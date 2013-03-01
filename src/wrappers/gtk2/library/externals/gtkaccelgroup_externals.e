-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELGROUP_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_accel_group_lock (an_accel_group: POINTER) is
 		-- gtk_accel_group_lock (node at line 429)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_lock"
		}"
		end

	gtk_accel_group_get_modifier_mask (an_accel_group: POINTER): INTEGER is
 		-- gtk_accel_group_get_modifier_mask (node at line 1270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_get_modifier_mask"
		}"
		end

	gtk_accel_group_find (an_accel_group: POINTER; a_find_func: POINTER; a_data: POINTER): POINTER is
 		-- gtk_accel_group_find (node at line 3371)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_find"
		}"
		end

	gtk_accel_group_disconnect_key (an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER): INTEGER_32 is
 		-- gtk_accel_group_disconnect_key (node at line 3788)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_disconnect_key"
		}"
		end

	-- `hidden' function _gtk_accel_group_attach skipped.
	gtk_accel_groups_from_object (an_object: POINTER): POINTER is
 		-- gtk_accel_groups_from_object (node at line 6412)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_groups_from_object"
		}"
		end

	gtk_accelerator_parse (an_accelerator: POINTER; an_accelerator_key: POINTER; an_accelerator_mods: POINTER) is
 		-- gtk_accelerator_parse (node at line 7089)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_parse"
		}"
		end

	gtk_accel_group_new: POINTER is
 		-- gtk_accel_group_new (node at line 9563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_new()"
		}"
		end

	gtk_accel_group_connect_by_path (an_accel_group: POINTER; an_accel_path: POINTER; a_closure: POINTER) is
 		-- gtk_accel_group_connect_by_path (node at line 10213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_connect_by_path"
		}"
		end

	gtk_accel_groups_activate (an_object: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER): INTEGER_32 is
 		-- gtk_accel_groups_activate (node at line 11075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_groups_activate"
		}"
		end

	gtk_accelerator_get_label (an_accelerator_key: NATURAL_32; an_accelerator_mods: INTEGER): POINTER is
 		-- gtk_accelerator_get_label (node at line 12600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_get_label"
		}"
		end

	gtk_accel_group_connect (an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER; an_accel_flags: INTEGER; a_closure: POINTER) is
 		-- gtk_accel_group_connect (node at line 12773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_connect"
		}"
		end

	gtk_accelerator_get_default_mod_mask: NATURAL_32 is
 		-- gtk_accelerator_get_default_mod_mask (node at line 18739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_get_default_mod_mask()"
		}"
		end

	gtk_accel_group_unlock (an_accel_group: POINTER) is
 		-- gtk_accel_group_unlock (node at line 22212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_unlock"
		}"
		end

	gtk_accelerator_valid (a_keyval: NATURAL_32; a_modifiers: INTEGER): INTEGER_32 is
 		-- gtk_accelerator_valid (node at line 26727)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_valid"
		}"
		end

	-- `hidden' function _gtk_accel_group_detach skipped.
	-- `hidden' function _gtk_accel_group_reconnect skipped.
	gtk_accel_group_activate (an_accel_group: POINTER; an_accel_quark: NATURAL_32; an_acceleratable: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER): INTEGER_32 is
 		-- gtk_accel_group_activate (node at line 34511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_activate"
		}"
		end

	gtk_accel_group_disconnect (an_accel_group: POINTER; a_closure: POINTER): INTEGER_32 is
 		-- gtk_accel_group_disconnect (node at line 34611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_disconnect"
		}"
		end

	gtk_accel_group_from_accel_closure (a_closure: POINTER): POINTER is
 		-- gtk_accel_group_from_accel_closure (node at line 35059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_from_accel_closure"
		}"
		end

	gtk_accelerator_set_default_mod_mask (a_default_mod_mask: INTEGER) is
 		-- gtk_accelerator_set_default_mod_mask (node at line 36381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_set_default_mod_mask"
		}"
		end

	gtk_accelerator_name (an_accelerator_key: NATURAL_32; an_accelerator_mods: INTEGER): POINTER is
 		-- gtk_accelerator_name (node at line 36418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accelerator_name"
		}"
		end

	gtk_accel_group_get_is_locked (an_accel_group: POINTER): INTEGER_32 is
 		-- gtk_accel_group_get_is_locked (node at line 36506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_get_is_locked"
		}"
		end

	gtk_accel_group_get_type: NATURAL_64 is
 		-- gtk_accel_group_get_type (node at line 38626)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_get_type()"
		}"
		end

	gtk_accel_group_query (an_accel_group: POINTER; an_accel_key: NATURAL_32; an_accel_mods: INTEGER; a_n_entries: POINTER): POINTER is
 		-- gtk_accel_group_query (node at line 39375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_query"
		}"
		end


end -- class GTKACCELGROUP_EXTERNALS
