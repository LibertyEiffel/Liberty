-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEPLUGIN_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_type_plugin_complete_interface_info (a_plugin: POINTER; an_instance_type: NATURAL_64; an_interface_type: NATURAL_64; an_info: POINTER) is
 		-- g_type_plugin_complete_interface_info
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_plugin_complete_interface_info"
		}"
		end

	g_type_plugin_complete_type_info (a_plugin: POINTER; a_g_type: NATURAL_64; an_info: POINTER; a_value_table: POINTER) is
 		-- g_type_plugin_complete_type_info
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_plugin_complete_type_info"
		}"
		end

	g_type_plugin_get_type: NATURAL_64 is
 		-- g_type_plugin_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_plugin_get_type()"
		}"
		end

	g_type_plugin_unuse (a_plugin: POINTER) is
 		-- g_type_plugin_unuse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_plugin_unuse"
		}"
		end

	g_type_plugin_use (a_plugin: POINTER) is
 		-- g_type_plugin_use
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_plugin_use"
		}"
		end


end -- class GTYPEPLUGIN_EXTERNALS
