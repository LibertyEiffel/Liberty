-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GENUMS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_enum_complete_type_info (a_g_enum_type: like long_unsigned; an_info: POINTER; a_const_values: POINTER) 

		-- function g_enum_complete_type_info (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_enum_complete_type_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_complete_type_info"
               }"
               end

	g_enum_get_value (an_enum_class: POINTER; a_value: INTEGER): POINTER 

		-- function g_enum_get_value (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_enum_get_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_get_value"
               }"
               end

	g_enum_get_value_by_name (an_enum_class: POINTER; a_name: POINTER): POINTER 

		-- function g_enum_get_value_by_name (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_enum_get_value_by_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_get_value_by_name"
               }"
               end

	g_enum_get_value_by_nick (an_enum_class: POINTER; a_nick: POINTER): POINTER 

		-- function g_enum_get_value_by_nick (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_enum_get_value_by_nick
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_get_value_by_nick"
               }"
               end

	g_enum_register_static (a_name: POINTER; a_const_static_values: POINTER): like long_unsigned 

		-- function g_enum_register_static (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_enum_register_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_enum_register_static"
               }"
               end

	g_flags_complete_type_info (a_g_flags_type: like long_unsigned; an_info: POINTER; a_const_values: POINTER) 

		-- function g_flags_complete_type_info (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_flags_complete_type_info
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_flags_complete_type_info"
               }"
               end

	g_flags_get_first_value (a_flags_class: POINTER; a_value: NATURAL): POINTER 

		-- function g_flags_get_first_value (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_flags_get_first_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_flags_get_first_value"
               }"
               end

	g_flags_get_value_by_name (a_flags_class: POINTER; a_name: POINTER): POINTER 

		-- function g_flags_get_value_by_name (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_flags_get_value_by_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_flags_get_value_by_name"
               }"
               end

	g_flags_get_value_by_nick (a_flags_class: POINTER; a_nick: POINTER): POINTER 

		-- function g_flags_get_value_by_nick (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_flags_get_value_by_nick
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_flags_get_value_by_nick"
               }"
               end

	g_flags_register_static (a_name: POINTER; a_const_static_values: POINTER): like long_unsigned 

		-- function g_flags_register_static (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_flags_register_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_flags_register_static"
               }"
               end

	g_value_get_enum (a_value: POINTER): INTEGER 

		-- function g_value_get_enum (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_value_get_enum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_enum"
               }"
               end

	g_value_get_flags (a_value: POINTER): NATURAL 

		-- function g_value_get_flags (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_value_get_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_flags"
               }"
               end

	g_value_set_enum (a_value: POINTER; a_v_enum: INTEGER) 

		-- function g_value_set_enum (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_value_set_enum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_enum"
               }"
               end

	g_value_set_flags (a_value: POINTER; a_v_flags: NATURAL) 

		-- function g_value_set_flags (in `/usr/include/glib-2.0/gobject/genums.h')
               -- g_value_set_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_flags"
               }"
               end


end -- class GENUMS_EXTERNALS
