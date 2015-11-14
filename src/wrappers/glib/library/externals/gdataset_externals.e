-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GDATASET_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_datalist_clear (a_datalist: POINTER) 
               -- g_datalist_clear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_clear"
               }"
               end

	g_datalist_foreach (a_datalist: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_datalist_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_foreach"
               }"
               end

	g_datalist_get_data (a_datalist: POINTER; a_key: POINTER): POINTER 
               -- g_datalist_get_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_get_data"
               }"
               end

	g_datalist_get_flags (a_datalist: POINTER): NATURAL 
               -- g_datalist_get_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_get_flags"
               }"
               end

	g_datalist_id_dup_data (a_datalist: POINTER; a_key_id: NATURAL; a_dup_func: POINTER; an_user_data: POINTER): POINTER 
               -- g_datalist_id_dup_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_id_dup_data"
               }"
               end

	g_datalist_id_get_data (a_datalist: POINTER; a_key_id: NATURAL): POINTER 
               -- g_datalist_id_get_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_id_get_data"
               }"
               end

	g_datalist_id_remove_no_notify (a_datalist: POINTER; a_key_id: NATURAL): POINTER 
               -- g_datalist_id_remove_no_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_id_remove_no_notify"
               }"
               end

	g_datalist_id_replace_data (a_datalist: POINTER; a_key_id: NATURAL; an_oldval: POINTER; a_newval: POINTER; a_destroy: POINTER; an_old_destroy: POINTER): INTEGER 
               -- g_datalist_id_replace_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_id_replace_data"
               }"
               end

	g_datalist_id_set_data_full (a_datalist: POINTER; a_key_id: NATURAL; a_data: POINTER; a_destroy_func: POINTER) 
               -- g_datalist_id_set_data_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_id_set_data_full"
               }"
               end

	g_datalist_init (a_datalist: POINTER) 
               -- g_datalist_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_init"
               }"
               end

	g_datalist_set_flags (a_datalist: POINTER; a_flags: NATURAL) 
               -- g_datalist_set_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_set_flags"
               }"
               end

	g_datalist_unset_flags (a_datalist: POINTER; a_flags: NATURAL) 
               -- g_datalist_unset_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_datalist_unset_flags"
               }"
               end

	g_dataset_destroy (a_dataset_location: POINTER) 
               -- g_dataset_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dataset_destroy"
               }"
               end

	g_dataset_foreach (a_dataset_location: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_dataset_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dataset_foreach"
               }"
               end

	g_dataset_id_get_data (a_dataset_location: POINTER; a_key_id: NATURAL): POINTER 
               -- g_dataset_id_get_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dataset_id_get_data"
               }"
               end

	g_dataset_id_remove_no_notify (a_dataset_location: POINTER; a_key_id: NATURAL): POINTER 
               -- g_dataset_id_remove_no_notify
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dataset_id_remove_no_notify"
               }"
               end

	g_dataset_id_set_data_full (a_dataset_location: POINTER; a_key_id: NATURAL; a_data: POINTER; a_destroy_func: POINTER) 
               -- g_dataset_id_set_data_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_dataset_id_set_data_full"
               }"
               end


end -- class GDATASET_EXTERNALS
