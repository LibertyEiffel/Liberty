-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAM_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_param_spec_sink (a_pspec: POINTER) is
 		-- g_param_spec_sink (node at line 93)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_sink"
		}"
		end

	g_param_value_set_default (a_pspec: POINTER; a_value: POINTER) is
 		-- g_param_value_set_default (node at line 96)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_value_set_default"
		}"
		end

	g_param_spec_pool_list_owned (a_pool: POINTER; an_owner_type: NATURAL_32): POINTER is
 		-- g_param_spec_pool_list_owned (node at line 194)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pool_list_owned"
		}"
		end

	g_value_dup_param (a_value: POINTER): POINTER is
 		-- g_value_dup_param (node at line 600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_dup_param"
		}"
		end

	g_value_take_param (a_value: POINTER; a_param: POINTER) is
 		-- g_value_take_param (node at line 761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_take_param"
		}"
		end

	g_param_spec_steal_qdata (a_pspec: POINTER; a_quark: NATURAL_32): POINTER is
 		-- g_param_spec_steal_qdata (node at line 941)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_steal_qdata"
		}"
		end

	g_value_set_param (a_value: POINTER; a_param: POINTER) is
 		-- g_value_set_param (node at line 1149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_param"
		}"
		end

	g_param_spec_internal (a_param_type: NATURAL_32; a_name: POINTER; a_nick: POINTER; a_blurb: POINTER; a_flags: INTEGER): POINTER is
 		-- g_param_spec_internal (node at line 1165)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_internal"
		}"
		end

	g_param_type_register_static (a_name: POINTER; a_pspec_info: POINTER): NATURAL_32 is
 		-- g_param_type_register_static (node at line 1219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_type_register_static"
		}"
		end

	g_param_value_validate (a_pspec: POINTER; a_value: POINTER): INTEGER_32 is
 		-- g_param_value_validate (node at line 1451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_value_validate"
		}"
		end

	g_param_spec_ref_sink (a_pspec: POINTER): POINTER is
 		-- g_param_spec_ref_sink (node at line 1719)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_ref_sink"
		}"
		end

	g_param_spec_get_redirect_target (a_pspec: POINTER): POINTER is
 		-- g_param_spec_get_redirect_target (node at line 1740)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_get_redirect_target"
		}"
		end

	g_param_values_cmp (a_pspec: POINTER; a_value1: POINTER; a_value2: POINTER): INTEGER_32 is
 		-- g_param_values_cmp (node at line 1873)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_values_cmp"
		}"
		end

	g_param_spec_ref (a_pspec: POINTER): POINTER is
 		-- g_param_spec_ref (node at line 2231)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_ref"
		}"
		end

	g_param_spec_set_qdata (a_pspec: POINTER; a_quark: NATURAL_32; a_data: POINTER) is
 		-- g_param_spec_set_qdata (node at line 3210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_set_qdata"
		}"
		end

	g_value_get_param (a_value: POINTER): POINTER is
 		-- g_value_get_param (node at line 3249)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_param"
		}"
		end

	g_param_spec_pool_list (a_pool: POINTER; an_owner_type: NATURAL_32; a_n_pspecs_p: POINTER): POINTER is
 		-- g_param_spec_pool_list (node at line 3263)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pool_list"
		}"
		end

	g_param_spec_get_blurb (a_pspec: POINTER): POINTER is
 		-- g_param_spec_get_blurb (node at line 3506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_get_blurb"
		}"
		end

	g_value_set_param_take_ownership (a_value: POINTER; a_param: POINTER) is
 		-- g_value_set_param_take_ownership (node at line 3870)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_param_take_ownership"
		}"
		end

	g_param_spec_pool_remove (a_pool: POINTER; a_pspec: POINTER) is
 		-- g_param_spec_pool_remove (node at line 4127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pool_remove"
		}"
		end

	g_param_value_convert (a_pspec: POINTER; a_src_value: POINTER; a_dest_value: POINTER; a_strict_validation: INTEGER_32): INTEGER_32 is
 		-- g_param_value_convert (node at line 4982)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_value_convert"
		}"
		end

	g_param_spec_set_qdata_full (a_pspec: POINTER; a_quark: NATURAL_32; a_data: POINTER; a_destroy: POINTER) is
 		-- g_param_spec_set_qdata_full (node at line 4997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_set_qdata_full"
		}"
		end

	g_param_spec_pool_new (a_type_prefixing: INTEGER_32): POINTER is
 		-- g_param_spec_pool_new (node at line 5092)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pool_new"
		}"
		end

	g_param_spec_get_name (a_pspec: POINTER): POINTER is
 		-- g_param_spec_get_name (node at line 5169)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_get_name"
		}"
		end

	g_param_value_defaults (a_pspec: POINTER; a_value: POINTER): INTEGER_32 is
 		-- g_param_value_defaults (node at line 5362)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_value_defaults"
		}"
		end

	-- `hidden' function _g_param_type_register_static_constant skipped.
	g_param_spec_unref (a_pspec: POINTER) is
 		-- g_param_spec_unref (node at line 5570)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_unref"
		}"
		end

	g_param_spec_get_qdata (a_pspec: POINTER; a_quark: NATURAL_32): POINTER is
 		-- g_param_spec_get_qdata (node at line 6552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_get_qdata"
		}"
		end

	g_param_spec_pool_lookup (a_pool: POINTER; a_param_name: POINTER; an_owner_type: NATURAL_32; a_walk_ancestors: INTEGER_32): POINTER is
 		-- g_param_spec_pool_lookup (node at line 6708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pool_lookup"
		}"
		end

	g_param_spec_get_nick (a_pspec: POINTER): POINTER is
 		-- g_param_spec_get_nick (node at line 6797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_get_nick"
		}"
		end

	g_param_spec_pool_insert (a_pool: POINTER; a_pspec: POINTER; an_owner_type: NATURAL_32) is
 		-- g_param_spec_pool_insert (node at line 8123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_param_spec_pool_insert"
		}"
		end


end -- class GPARAM_EXTERNALS
