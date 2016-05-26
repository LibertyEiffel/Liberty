-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVALUETYPES_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_gtype_get_type: like long_unsigned 

		-- function g_gtype_get_type (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_gtype_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_gtype_get_type()"
               }"
               end

	g_pointer_type_register_static (a_name: POINTER): like long_unsigned 

		-- function g_pointer_type_register_static (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_pointer_type_register_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_pointer_type_register_static"
               }"
               end

	g_strdup_value_contents (a_value: POINTER): POINTER 

		-- function g_strdup_value_contents (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_strdup_value_contents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_strdup_value_contents"
               }"
               end

	g_value_dup_string (a_value: POINTER): POINTER 

		-- function g_value_dup_string (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_dup_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_dup_string"
               }"
               end

	g_value_dup_variant (a_value: POINTER): POINTER 

		-- function g_value_dup_variant (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_dup_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_dup_variant"
               }"
               end

	g_value_get_boolean (a_value: POINTER): INTEGER 

		-- function g_value_get_boolean (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_boolean"
               }"
               end

	g_value_get_char (a_value: POINTER): CHARACTER 

		-- function g_value_get_char (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_char"
               }"
               end

	g_value_get_double (a_value: POINTER): REAL 

		-- function g_value_get_double (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_double"
               }"
               end

	g_value_get_float (a_value: POINTER): REAL_32 

		-- function g_value_get_float (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_float
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_float"
               }"
               end

	g_value_get_gtype (a_value: POINTER): like long_unsigned 

		-- function g_value_get_gtype (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_gtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_gtype"
               }"
               end

	g_value_get_int (a_value: POINTER): INTEGER 

		-- function g_value_get_int (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_int"
               }"
               end

	g_value_get_int64 (a_value: POINTER): like long 

		-- function g_value_get_int64 (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_int64"
               }"
               end

	g_value_get_long (a_value: POINTER): like long 

		-- function g_value_get_long (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_long
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_long"
               }"
               end

	g_value_get_pointer (a_value: POINTER): POINTER 

		-- function g_value_get_pointer (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_pointer"
               }"
               end

	g_value_get_schar (a_value: POINTER): CHARACTER 

		-- function g_value_get_schar (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_schar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_schar"
               }"
               end

	g_value_get_string (a_value: POINTER): POINTER 

		-- function g_value_get_string (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_string"
               }"
               end

	g_value_get_uchar (a_value: POINTER): CHARACTER 

		-- function g_value_get_uchar (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_uchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_uchar"
               }"
               end

	g_value_get_uint (a_value: POINTER): NATURAL 

		-- function g_value_get_uint (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_uint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_uint"
               }"
               end

	g_value_get_uint64 (a_value: POINTER): like long_unsigned 

		-- function g_value_get_uint64 (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_uint64"
               }"
               end

	g_value_get_ulong (a_value: POINTER): like long_unsigned 

		-- function g_value_get_ulong (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_ulong
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_ulong"
               }"
               end

	g_value_get_variant (a_value: POINTER): POINTER 

		-- function g_value_get_variant (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_get_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_variant"
               }"
               end

	g_value_set_boolean (a_value: POINTER; a_v_boolean: INTEGER) 

		-- function g_value_set_boolean (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_boolean
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_boolean"
               }"
               end

	g_value_set_char (a_value: POINTER; a_v_char: CHARACTER) 

		-- function g_value_set_char (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_char
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_char"
               }"
               end

	g_value_set_double (a_value: POINTER; a_v_double: REAL) 

		-- function g_value_set_double (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_double
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_double"
               }"
               end

	g_value_set_float (a_value: POINTER; a_v_float: REAL_32) 

		-- function g_value_set_float (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_float
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_float"
               }"
               end

	g_value_set_gtype (a_value: POINTER; a_v_gtype: like long_unsigned) 

		-- function g_value_set_gtype (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_gtype
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_gtype"
               }"
               end

	g_value_set_int (a_value: POINTER; a_v_int: INTEGER) 

		-- function g_value_set_int (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_int
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_int"
               }"
               end

	g_value_set_int64 (a_value: POINTER; a_v_int64: like long) 

		-- function g_value_set_int64 (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_int64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_int64"
               }"
               end

	g_value_set_long (a_value: POINTER; a_v_long: like long) 

		-- function g_value_set_long (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_long
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_long"
               }"
               end

	g_value_set_pointer (a_value: POINTER; a_v_pointer: POINTER) 

		-- function g_value_set_pointer (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_pointer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_pointer"
               }"
               end

	g_value_set_schar (a_value: POINTER; a_v_char: CHARACTER) 

		-- function g_value_set_schar (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_schar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_schar"
               }"
               end

	g_value_set_static_string (a_value: POINTER; a_v_string: POINTER) 

		-- function g_value_set_static_string (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_static_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_static_string"
               }"
               end

	g_value_set_string (a_value: POINTER; a_v_string: POINTER) 

		-- function g_value_set_string (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_string"
               }"
               end

	g_value_set_string_take_ownership (a_value: POINTER; a_v_string: POINTER) 

		-- function g_value_set_string_take_ownership (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_string_take_ownership
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_string_take_ownership"
               }"
               end

	g_value_set_uchar (a_value: POINTER; a_v_uchar: CHARACTER) 

		-- function g_value_set_uchar (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_uchar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_uchar"
               }"
               end

	g_value_set_uint (a_value: POINTER; a_v_uint: NATURAL) 

		-- function g_value_set_uint (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_uint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_uint"
               }"
               end

	g_value_set_uint64 (a_value: POINTER; a_v_uint64: like long_unsigned) 

		-- function g_value_set_uint64 (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_uint64
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_uint64"
               }"
               end

	g_value_set_ulong (a_value: POINTER; a_v_ulong: like long_unsigned) 

		-- function g_value_set_ulong (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_ulong
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_ulong"
               }"
               end

	g_value_set_variant (a_value: POINTER; a_variant_external: POINTER) 

		-- function g_value_set_variant (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_set_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_variant"
               }"
               end

	g_value_take_string (a_value: POINTER; a_v_string: POINTER) 

		-- function g_value_take_string (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_take_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_take_string"
               }"
               end

	g_value_take_variant (a_value: POINTER; a_variant_external: POINTER) 

		-- function g_value_take_variant (in `/usr/include/glib-2.0/gobject/gvaluetypes.h')
               -- g_value_take_variant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_take_variant"
               }"
               end


end -- class GVALUETYPES_EXTERNALS
