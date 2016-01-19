-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GTYPEPLUGIN_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_type_plugin_complete_interface_info (a_plugin: POINTER; an_instance_type: like long_unsigned; an_interface_type: like long_unsigned; an_info: POINTER) 
               -- g_type_plugin_complete_interface_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_plugin_complete_interface_info"
               }"
               end

	g_type_plugin_complete_type_info (a_plugin: POINTER; a_g_type: like long_unsigned; an_info: POINTER; a_value_table: POINTER) 
               -- g_type_plugin_complete_type_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_plugin_complete_type_info"
               }"
               end

	g_type_plugin_get_type: like long_unsigned 
               -- g_type_plugin_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_plugin_get_type"
               }"
               end

	g_type_plugin_unuse (a_plugin: POINTER) 
               -- g_type_plugin_unuse
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_plugin_unuse"
               }"
               end

	g_type_plugin_use (a_plugin: POINTER) 
               -- g_type_plugin_use
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_type_plugin_use"
               }"
               end


end -- class GTYPEPLUGIN_EXTERNALS
