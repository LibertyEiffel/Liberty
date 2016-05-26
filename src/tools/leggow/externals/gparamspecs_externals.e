-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAMSPECS_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_param_spec_boolean (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_default_value: INTEGER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_boolean (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_boolean"
               }"
               end

	g_param_spec_boxed (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_boxed_type: like long_unsigned; a_flags: INTEGER): POINTER 

		-- function g_param_spec_boxed (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_boxed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_boxed"
               }"
               end

	g_param_spec_char (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: CHARACTER; a_maximum: CHARACTER; a_default_value: CHARACTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_char (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_char"
               }"
               end

	g_param_spec_double (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: REAL; a_maximum: REAL; a_default_value: REAL; a_flags: INTEGER): POINTER 

		-- function g_param_spec_double (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_double"
               }"
               end

	g_param_spec_enum (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_enum_type: like long_unsigned; a_default_value: INTEGER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_enum (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_enum
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_enum"
               }"
               end

	g_param_spec_flags (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_flags_type: like long_unsigned; a_default_value: NATURAL; a_flags: INTEGER): POINTER 

		-- function g_param_spec_flags (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_flags
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_flags"
               }"
               end

	g_param_spec_float (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: REAL_32; a_maximum: REAL_32; a_default_value: REAL_32; a_flags: INTEGER): POINTER 

		-- function g_param_spec_float (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_float
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_float"
               }"
               end

	g_param_spec_gtype (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_is_a_type: like long_unsigned; a_flags: INTEGER): POINTER 

		-- function g_param_spec_gtype (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_gtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_gtype"
               }"
               end

	g_param_spec_int (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: INTEGER; a_maximum: INTEGER; a_default_value: INTEGER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_int (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_int"
               }"
               end

	g_param_spec_int64 (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: like long; a_maximum: like long; a_default_value: like long; a_flags: INTEGER): POINTER 

		-- function g_param_spec_int64 (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_int64"
               }"
               end

	g_param_spec_long (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: like long; a_maximum: like long; a_default_value: like long; a_flags: INTEGER): POINTER 

		-- function g_param_spec_long (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_long
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_long"
               }"
               end

	g_param_spec_object (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_object_type: like long_unsigned; a_flags: INTEGER): POINTER 

		-- function g_param_spec_object (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_object
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_object"
               }"
               end

	g_param_spec_override (a_name: POINTER; an_overridden: POINTER): POINTER 

		-- function g_param_spec_override (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_override
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_override"
               }"
               end

	g_param_spec_param (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_param_type: like long_unsigned; a_flags: INTEGER): POINTER 

		-- function g_param_spec_param (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_param
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_param"
               }"
               end

	g_param_spec_pointer (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_pointer (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pointer"
               }"
               end

	g_param_spec_string (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_default_value: POINTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_string (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_string"
               }"
               end

	g_param_spec_types: POINTER
               -- g_param_spec_types
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_types"
               }"
               end

       address_of_g_param_spec_types: POINTER
               -- Address of g_param_spec_types
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "&g_param_spec_types"
               }"
               end

       set_g_param_spec_types (a_value: POINTER)
               -- Set variable g_param_spec_types value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "set_g_param_spec_types"
               }"
               end

	g_param_spec_uchar (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: CHARACTER; a_maximum: CHARACTER; a_default_value: CHARACTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_uchar (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_uchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_uchar"
               }"
               end

	g_param_spec_uint (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: NATURAL; a_maximum: NATURAL; a_default_value: NATURAL; a_flags: INTEGER): POINTER 

		-- function g_param_spec_uint (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_uint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_uint"
               }"
               end

	g_param_spec_uint64 (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: like long_unsigned; a_maximum: like long_unsigned; a_default_value: like long_unsigned; a_flags: INTEGER): POINTER 

		-- function g_param_spec_uint64 (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_uint64"
               }"
               end

	g_param_spec_ulong (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_minimum: like long_unsigned; a_maximum: like long_unsigned; a_default_value: like long_unsigned; a_flags: INTEGER): POINTER 

		-- function g_param_spec_ulong (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_ulong
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_ulong"
               }"
               end

	g_param_spec_unichar (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_default_value: NATURAL; a_flags: INTEGER): POINTER 

		-- function g_param_spec_unichar (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_unichar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_unichar"
               }"
               end

	g_param_spec_value_array (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; an_element_spec: POINTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_value_array (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_value_array
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_value_array"
               }"
               end

	g_param_spec_variant (a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_type: POINTER; a_default_value: POINTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_variant (in `/usr/include/glib-2.0/gobject/gparamspecs.h')
               -- g_param_spec_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_variant"
               }"
               end


end -- class GPARAMSPECS_EXTERNALS
