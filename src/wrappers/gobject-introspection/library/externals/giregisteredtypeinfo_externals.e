-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GIREGISTEREDTYPEINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_registered_type_info_get_g_type (an_info: POINTER): NATURAL_64 is
 		-- g_registered_type_info_get_g_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_registered_type_info_get_g_type"
		}"
		end

	g_registered_type_info_get_type_init (an_info: POINTER): POINTER is
 		-- g_registered_type_info_get_type_init
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_registered_type_info_get_type_init"
		}"
		end

	g_registered_type_info_get_type_name (an_info: POINTER): POINTER is
 		-- g_registered_type_info_get_type_name
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_registered_type_info_get_type_name"
		}"
		end


end -- class GIREGISTEREDTYPEINFO_EXTERNALS
