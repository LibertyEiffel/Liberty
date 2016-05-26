-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GPARAM_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_param_spec_get_blurb (a_pspec: POINTER): POINTER 

		-- function g_param_spec_get_blurb (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_blurb
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_blurb"
               }"
               end

	g_param_spec_get_default_value (a_pspec: POINTER): POINTER 

		-- function g_param_spec_get_default_value (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_default_value
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_default_value"
               }"
               end

	g_param_spec_get_name (a_pspec: POINTER): POINTER 

		-- function g_param_spec_get_name (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_name"
               }"
               end

	g_param_spec_get_name_quark (a_pspec: POINTER): NATURAL 

		-- function g_param_spec_get_name_quark (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_name_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_name_quark"
               }"
               end

	g_param_spec_get_nick (a_pspec: POINTER): POINTER 

		-- function g_param_spec_get_nick (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_nick
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_nick"
               }"
               end

	g_param_spec_get_qdata (a_pspec: POINTER; a_quark: NATURAL): POINTER 

		-- function g_param_spec_get_qdata (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_qdata"
               }"
               end

	g_param_spec_get_redirect_target (a_pspec: POINTER): POINTER 

		-- function g_param_spec_get_redirect_target (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_get_redirect_target
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_get_redirect_target"
               }"
               end

	g_param_spec_internal (a_param_type: like long_unsigned; a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_flags: INTEGER): POINTER 

		-- function g_param_spec_internal (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_internal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_internal"
               }"
               end

	g_param_spec_pool_insert (a_pool: POINTER; a_pspec: POINTER; an_owner_type: like long_unsigned) 

		-- function g_param_spec_pool_insert (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_pool_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pool_insert"
               }"
               end

	g_param_spec_pool_list (a_pool: POINTER; an_owner_type: like long_unsigned; a_n_pspecs_p: POINTER): POINTER 

		-- function g_param_spec_pool_list (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_pool_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pool_list"
               }"
               end

	g_param_spec_pool_list_owned (a_pool: POINTER; an_owner_type: like long_unsigned): POINTER 

		-- function g_param_spec_pool_list_owned (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_pool_list_owned
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pool_list_owned"
               }"
               end

	g_param_spec_pool_lookup (a_pool: POINTER; a_param_name: POINTER; an_owner_type: like long_unsigned; a_walk_ancestors: INTEGER): POINTER 

		-- function g_param_spec_pool_lookup (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_pool_lookup
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pool_lookup"
               }"
               end

	g_param_spec_pool_new (a_type_prefixing: INTEGER): POINTER 

		-- function g_param_spec_pool_new (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_pool_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pool_new"
               }"
               end

	g_param_spec_pool_remove (a_pool: POINTER; a_pspec: POINTER) 

		-- function g_param_spec_pool_remove (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_pool_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_pool_remove"
               }"
               end

	g_param_spec_ref (a_pspec: POINTER): POINTER 

		-- function g_param_spec_ref (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_ref"
               }"
               end

	g_param_spec_ref_sink (a_pspec: POINTER): POINTER 

		-- function g_param_spec_ref_sink (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_ref_sink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_ref_sink"
               }"
               end

	g_param_spec_set_qdata (a_pspec: POINTER; a_quark: NATURAL; a_data: POINTER) 

		-- function g_param_spec_set_qdata (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_set_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_set_qdata"
               }"
               end

	g_param_spec_set_qdata_full (a_pspec: POINTER; a_quark: NATURAL; a_data: POINTER; a_destroy: POINTER) 

		-- function g_param_spec_set_qdata_full (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_set_qdata_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_set_qdata_full"
               }"
               end

	g_param_spec_sink (a_pspec: POINTER) 

		-- function g_param_spec_sink (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_sink
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_sink"
               }"
               end

	g_param_spec_steal_qdata (a_pspec: POINTER; a_quark: NATURAL): POINTER 

		-- function g_param_spec_steal_qdata (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_steal_qdata
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_steal_qdata"
               }"
               end

	g_param_spec_unref (a_pspec: POINTER) 

		-- function g_param_spec_unref (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_spec_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_spec_unref"
               }"
               end

	g_param_type_register_static (a_name: POINTER; a_pspec_info: POINTER): like long_unsigned 

		-- function g_param_type_register_static (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_type_register_static
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_type_register_static"
               }"
               end

	-- `hidden' function _g_param_type_register_static_constant skipped.
	g_param_value_convert (a_pspec: POINTER; a_src_value: POINTER; a_dest_value: POINTER; a_strict_validation: INTEGER): INTEGER 

		-- function g_param_value_convert (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_value_convert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_value_convert"
               }"
               end

	g_param_value_defaults (a_pspec: POINTER; a_value: POINTER): INTEGER 

		-- function g_param_value_defaults (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_value_defaults
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_value_defaults"
               }"
               end

	g_param_value_set_default (a_pspec: POINTER; a_value: POINTER) 

		-- function g_param_value_set_default (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_value_set_default
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_value_set_default"
               }"
               end

	g_param_value_validate (a_pspec: POINTER; a_value: POINTER): INTEGER 

		-- function g_param_value_validate (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_value_validate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_value_validate"
               }"
               end

	g_param_values_cmp (a_pspec: POINTER; a_value1: POINTER; a_value2: POINTER): INTEGER 

		-- function g_param_values_cmp (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_param_values_cmp
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_param_values_cmp"
               }"
               end

	g_value_dup_param (a_value: POINTER): POINTER 

		-- function g_value_dup_param (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_value_dup_param
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_dup_param"
               }"
               end

	g_value_get_param (a_value: POINTER): POINTER 

		-- function g_value_get_param (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_value_get_param
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_get_param"
               }"
               end

	g_value_set_param (a_value: POINTER; a_param: POINTER) 

		-- function g_value_set_param (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_value_set_param
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_param"
               }"
               end

	g_value_set_param_take_ownership (a_value: POINTER; a_param: POINTER) 

		-- function g_value_set_param_take_ownership (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_value_set_param_take_ownership
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_set_param_take_ownership"
               }"
               end

	g_value_take_param (a_value: POINTER; a_param: POINTER) 

		-- function g_value_take_param (in `/usr/include/glib-2.0/gobject/gparam.h')
               -- g_value_take_param
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_take_param"
               }"
               end


end -- class GPARAM_EXTERNALS
