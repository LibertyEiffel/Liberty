-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GQUARK_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_quark_from_static_string (a_string: POINTER): NATURAL_32 is
 		-- g_quark_from_static_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_quark_from_static_string"
		}"
		end

	g_quark_try_string (a_string: POINTER): NATURAL_32 is
 		-- g_quark_try_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_quark_try_string"
		}"
		end

	g_quark_from_string (a_string: POINTER): NATURAL_32 is
 		-- g_quark_from_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_quark_from_string"
		}"
		end

	g_intern_string (a_string: POINTER): POINTER is
 		-- g_intern_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_intern_string"
		}"
		end

	g_quark_to_string (a_quark: NATURAL_32): POINTER is
 		-- g_quark_to_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_quark_to_string"
		}"
		end

	g_intern_static_string (a_string: POINTER): POINTER is
 		-- g_intern_static_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_intern_static_string"
		}"
		end

end
