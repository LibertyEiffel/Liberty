-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEMODULE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_type_module_get_type: NATURAL_32 is
 		-- g_type_module_get_type (node at line 489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_get_type()"
		}"
		end

	g_type_module_unuse (a_module: POINTER) is
 		-- g_type_module_unuse (node at line 1604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_unuse"
		}"
		end

	g_type_module_register_enum (a_module: POINTER; a_name: POINTER; a_const_static_values: POINTER): NATURAL_32 is
 		-- g_type_module_register_enum (node at line 2430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_register_enum"
		}"
		end

	g_type_module_register_flags (a_module: POINTER; a_name: POINTER; a_const_static_values: POINTER): NATURAL_32 is
 		-- g_type_module_register_flags (node at line 3602)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_register_flags"
		}"
		end

	g_type_module_use (a_module: POINTER): INTEGER_32 is
 		-- g_type_module_use (node at line 3719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_use"
		}"
		end

	g_type_module_set_name (a_module: POINTER; a_name: POINTER) is
 		-- g_type_module_set_name (node at line 5199)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_set_name"
		}"
		end

	g_type_module_register_type (a_module: POINTER; a_parent_type: NATURAL_32; a_type_name: POINTER; a_type_info: POINTER; a_flags: INTEGER): NATURAL_32 is
 		-- g_type_module_register_type (node at line 5523)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_register_type"
		}"
		end

	g_type_module_add_interface (a_module: POINTER; an_instance_type: NATURAL_32; an_interface_type: NATURAL_32; an_interface_info: POINTER) is
 		-- g_type_module_add_interface (node at line 6189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_add_interface"
		}"
		end


end -- class GTYPEMODULE_EXTERNALS
