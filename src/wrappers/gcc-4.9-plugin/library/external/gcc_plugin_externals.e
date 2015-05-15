-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCC_PLUGIN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	default_plugin_dir_name (): POINTER 
               -- default_plugin_dir_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	get_event_last (): INTEGER 
               -- get_event_last
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	get_named_event_id (a_name: POINTER; an_insert_external: INTEGER): INTEGER 
               -- get_named_event_id
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	plugin_default_version_check (an_argument_l2823_c7: POINTER; an_argument_l2824_c7: POINTER): INTEGER_8 
               -- plugin_default_version_check
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	plugin_event_name: POINTER
               -- plugin_event_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "plugin_event_name"
               }"
               end

       address_of_plugin_event_name: POINTER
               -- Address of plugin_event_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&plugin_event_name"
               }"
               end

       set_plugin_event_name (a_value: POINTER)
               -- Set variable plugin_event_name value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_plugin_event_name"
               }"
               end

	plugin_init (a_plugin_info: POINTER; a_version: POINTER): INTEGER 
               -- plugin_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	plugin_is_gpl_compatible: INTEGER
               -- plugin_is_gpl_compatible
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "plugin_is_GPL_compatible"
               }"
               end

       address_of_plugin_is_gpl_compatible: POINTER
               -- Address of plugin_is_gpl_compatible
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&plugin_is_GPL_compatible"
               }"
               end

       set_plugin_is_gpl_compatible (a_value: INTEGER)
               -- Set variable plugin_is_gpl_compatible value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_plugin_is_GPL_compatible"
               }"
               end

	register_callback (a_plugin_name: POINTER; an_event: INTEGER; a_callback: POINTER; an_user_data: POINTER) 
               -- register_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end

	unregister_callback (a_plugin_name: POINTER; an_event: INTEGER): INTEGER 
               -- unregister_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "Void"
               }"
               end


end -- class GCC_PLUGIN_EXTERNALS
