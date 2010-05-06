-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GQUARK_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_quark_from_static_string (a_string: POINTER): NATURAL_32 is
 		-- g_quark_from_static_string (node at line 263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_quark_from_static_string"
		}"
		end

	g_quark_try_string (a_string: POINTER): NATURAL_32 is
 		-- g_quark_try_string (node at line 515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_quark_try_string"
		}"
		end

	g_quark_from_string (a_string: POINTER): NATURAL_32 is
 		-- g_quark_from_string (node at line 4967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_quark_from_string"
		}"
		end

	g_intern_string (a_string: POINTER): POINTER is
 		-- g_intern_string (node at line 5410)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_intern_string"
		}"
		end

	g_quark_to_string (a_quark: NATURAL_32): POINTER is
 		-- g_quark_to_string (node at line 6235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_quark_to_string"
		}"
		end

	g_intern_static_string (a_string: POINTER): POINTER is
 		-- g_intern_static_string (node at line 6634)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_intern_static_string"
		}"
		end


end -- class GQUARK_EXTERNALS
