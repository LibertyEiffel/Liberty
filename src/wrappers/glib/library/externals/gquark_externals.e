-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GQUARK_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_intern_static_string (a_string: POINTER): POINTER 
               -- g_intern_static_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_intern_static_string"
               }"
               end

	g_intern_string (a_string: POINTER): POINTER 
               -- g_intern_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_intern_string"
               }"
               end

	g_quark_from_static_string (a_string: POINTER): NATURAL 
               -- g_quark_from_static_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_quark_from_static_string"
               }"
               end

	g_quark_from_string (a_string: POINTER): NATURAL 
               -- g_quark_from_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_quark_from_string"
               }"
               end

	g_quark_to_string (a_quark: NATURAL): POINTER 
               -- g_quark_to_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_quark_to_string"
               }"
               end

	g_quark_try_string (a_string: POINTER): NATURAL 
               -- g_quark_try_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_quark_try_string"
               }"
               end


end -- class GQUARK_EXTERNALS
