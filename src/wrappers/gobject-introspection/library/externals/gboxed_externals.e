-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GBOXED_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_boxed_copy (a_boxed_type: NATURAL_64; a_src_boxed: POINTER): POINTER is
 		-- g_boxed_copy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_copy"
		}"
		end

	g_boxed_free (a_boxed_type: NATURAL_64; a_boxed: POINTER) is
 		-- g_boxed_free
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_free"
		}"
		end

	g_boxed_type_register_static (a_name: POINTER; a_boxed_copy: POINTER; a_boxed_free: POINTER): NATURAL_64 is
 		-- g_boxed_type_register_static
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_boxed_type_register_static"
		}"
		end

	g_closure_get_type: NATURAL_64 is
 		-- g_closure_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_closure_get_type()"
		}"
		end

	g_value_dup_boxed (a_value: POINTER): POINTER is
 		-- g_value_dup_boxed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_dup_boxed"
		}"
		end

	g_value_get_boxed (a_value: POINTER): POINTER is
 		-- g_value_get_boxed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_boxed"
		}"
		end

	g_value_get_type: NATURAL_64 is
 		-- g_value_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_get_type()"
		}"
		end

	g_value_set_boxed (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_set_boxed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_boxed"
		}"
		end

	g_value_set_boxed_take_ownership (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_set_boxed_take_ownership
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_boxed_take_ownership"
		}"
		end

	g_value_set_static_boxed (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_set_static_boxed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_static_boxed"
		}"
		end

	g_value_take_boxed (a_value: POINTER; a_v_boxed: POINTER) is
 		-- g_value_take_boxed
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_take_boxed"
		}"
		end


end -- class GBOXED_EXTERNALS
