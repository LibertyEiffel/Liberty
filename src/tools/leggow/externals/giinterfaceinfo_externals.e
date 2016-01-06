-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GIINTERFACEINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_interface_info_find_method (an_info: POINTER; a_name: POINTER): POINTER 
               -- g_interface_info_find_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_find_method"
               }"
               end

	g_interface_info_find_signal (an_info: POINTER; a_name: POINTER): POINTER 
               -- g_interface_info_find_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_find_signal"
               }"
               end

	g_interface_info_find_vfunc (an_info: POINTER; a_name: POINTER): POINTER 
               -- g_interface_info_find_vfunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_find_vfunc"
               }"
               end

	g_interface_info_get_constant (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_interface_info_get_constant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_constant"
               }"
               end

	g_interface_info_get_iface_struct (an_info: POINTER): POINTER 
               -- g_interface_info_get_iface_struct
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_iface_struct"
               }"
               end

	g_interface_info_get_method (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_interface_info_get_method
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_method"
               }"
               end

	g_interface_info_get_n_constants (an_info: POINTER): INTEGER 
               -- g_interface_info_get_n_constants
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_n_constants"
               }"
               end

	g_interface_info_get_n_methods (an_info: POINTER): INTEGER 
               -- g_interface_info_get_n_methods
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_n_methods"
               }"
               end

	g_interface_info_get_n_prerequisites (an_info: POINTER): INTEGER 
               -- g_interface_info_get_n_prerequisites
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_n_prerequisites"
               }"
               end

	g_interface_info_get_n_properties (an_info: POINTER): INTEGER 
               -- g_interface_info_get_n_properties
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_n_properties"
               }"
               end

	g_interface_info_get_n_signals (an_info: POINTER): INTEGER 
               -- g_interface_info_get_n_signals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_n_signals"
               }"
               end

	g_interface_info_get_n_vfuncs (an_info: POINTER): INTEGER 
               -- g_interface_info_get_n_vfuncs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_n_vfuncs"
               }"
               end

	g_interface_info_get_prerequisite (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_interface_info_get_prerequisite
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_prerequisite"
               }"
               end

	g_interface_info_get_property (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_interface_info_get_property
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_property"
               }"
               end

	g_interface_info_get_signal (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_interface_info_get_signal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_signal"
               }"
               end

	g_interface_info_get_vfunc (an_info: POINTER; a_n: INTEGER): POINTER 
               -- g_interface_info_get_vfunc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_interface_info_get_vfunc"
               }"
               end


end -- class GIINTERFACEINFO_EXTERNALS
