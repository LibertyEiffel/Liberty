-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GDATASET_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_dataset_id_remove_no_notify (a_dataset_location: POINTER; a_key_id: NATURAL_32): POINTER is
 		-- g_dataset_id_remove_no_notify (node at line 267)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dataset_id_remove_no_notify"
		}"
		end

	g_datalist_id_remove_no_notify (a_datalist: POINTER; a_key_id: NATURAL_32): POINTER is
 		-- g_datalist_id_remove_no_notify (node at line 963)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_id_remove_no_notify"
		}"
		end

	g_datalist_id_get_data (a_datalist: POINTER; a_key_id: NATURAL_32): POINTER is
 		-- g_datalist_id_get_data (node at line 2037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_id_get_data"
		}"
		end

	g_datalist_clear (a_datalist: POINTER) is
 		-- g_datalist_clear (node at line 2403)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_clear"
		}"
		end

	g_datalist_id_set_data_full (a_datalist: POINTER; a_key_id: NATURAL_32; a_data: POINTER; a_destroy_func: POINTER) is
 		-- g_datalist_id_set_data_full (node at line 2500)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_id_set_data_full"
		}"
		end

	g_datalist_foreach (a_datalist: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_datalist_foreach (node at line 4104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_foreach"
		}"
		end

	g_datalist_init (a_datalist: POINTER) is
 		-- g_datalist_init (node at line 4454)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_init"
		}"
		end

	g_datalist_unset_flags (a_datalist: POINTER; a_flags: NATURAL_32) is
 		-- g_datalist_unset_flags (node at line 4825)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_unset_flags"
		}"
		end

	g_dataset_foreach (a_dataset_location: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_dataset_foreach (node at line 5190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dataset_foreach"
		}"
		end

	g_dataset_id_set_data_full (a_dataset_location: POINTER; a_key_id: NATURAL_32; a_data: POINTER; a_destroy_func: POINTER) is
 		-- g_dataset_id_set_data_full (node at line 5213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dataset_id_set_data_full"
		}"
		end

	g_dataset_destroy (a_dataset_location: POINTER) is
 		-- g_dataset_destroy (node at line 5493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dataset_destroy"
		}"
		end

	g_datalist_set_flags (a_datalist: POINTER; a_flags: NATURAL_32) is
 		-- g_datalist_set_flags (node at line 5496)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_set_flags"
		}"
		end

	g_datalist_get_flags (a_datalist: POINTER): NATURAL_32 is
 		-- g_datalist_get_flags (node at line 6013)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_datalist_get_flags"
		}"
		end

	g_dataset_id_get_data (a_dataset_location: POINTER; a_key_id: NATURAL_32): POINTER is
 		-- g_dataset_id_get_data (node at line 6352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_dataset_id_get_data"
		}"
		end


end -- class GDATASET_EXTERNALS
