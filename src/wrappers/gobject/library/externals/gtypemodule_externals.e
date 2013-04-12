-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEMODULE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_type_module_add_interface (a_module: POINTER; an_instance_type: like long_unsigned; an_interface_type: like long_unsigned; an_interface_info: POINTER) is
 		-- g_type_module_add_interface
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_add_interface"
		}"
		end

	g_type_module_get_type: like long_unsigned is
 		-- g_type_module_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_get_type()"
		}"
		end

	g_type_module_register_enum (a_module: POINTER; a_name: POINTER; a_const_static_values: POINTER): like long_unsigned is
 		-- g_type_module_register_enum
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_register_enum"
		}"
		end

	g_type_module_register_flags (a_module: POINTER; a_name: POINTER; a_const_static_values: POINTER): like long_unsigned is
 		-- g_type_module_register_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_register_flags"
		}"
		end

	g_type_module_register_type (a_module: POINTER; a_parent_type: like long_unsigned; a_type_name: POINTER; a_type_info: POINTER; a_flags: INTEGER): like long_unsigned is
 		-- g_type_module_register_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_register_type"
		}"
		end

	g_type_module_set_name (a_module: POINTER; a_name: POINTER) is
 		-- g_type_module_set_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_set_name"
		}"
		end

	g_type_module_unuse (a_module: POINTER) is
 		-- g_type_module_unuse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_unuse"
		}"
		end

	g_type_module_use (a_module: POINTER): INTEGER is
 		-- g_type_module_use
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_type_module_use"
		}"
		end


end -- class GTYPEMODULE_EXTERNALS
