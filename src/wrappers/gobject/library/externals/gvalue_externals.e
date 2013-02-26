-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVALUE_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_value_unset (a_value: POINTER) is
 		-- g_value_unset (node at line 257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_unset"
		}"
		end

	g_value_type_compatible (a_src_type: NATURAL_32; a_dest_type: NATURAL_32): INTEGER_32 is
 		-- g_value_type_compatible (node at line 546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_type_compatible"
		}"
		end

	g_value_register_transform_func (a_src_type: NATURAL_32; a_dest_type: NATURAL_32; a_transform_func: POINTER) is
 		-- g_value_register_transform_func (node at line 2197)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_register_transform_func"
		}"
		end

	g_value_set_instance (a_value: POINTER; an_instance: POINTER) is
 		-- g_value_set_instance (node at line 3057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_set_instance"
		}"
		end

	g_value_fits_pointer (a_value: POINTER): INTEGER_32 is
 		-- g_value_fits_pointer (node at line 3794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_fits_pointer"
		}"
		end

	g_value_init (a_value: POINTER; a_g_type: NATURAL_32): POINTER is
 		-- g_value_init (node at line 4330)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_init"
		}"
		end

	g_value_transform (a_src_value: POINTER; a_dest_value: POINTER): INTEGER_32 is
 		-- g_value_transform (node at line 4855)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_transform"
		}"
		end

	g_value_reset (a_value: POINTER): POINTER is
 		-- g_value_reset (node at line 5824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_reset"
		}"
		end

	g_value_copy (a_src_value: POINTER; a_dest_value: POINTER) is
 		-- g_value_copy (node at line 7190)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_copy"
		}"
		end

	g_value_type_transformable (a_src_type: NATURAL_32; a_dest_type: NATURAL_32): INTEGER_32 is
 		-- g_value_type_transformable (node at line 7781)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_type_transformable"
		}"
		end

	g_value_peek_pointer (a_value: POINTER): POINTER is
 		-- g_value_peek_pointer (node at line 8004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_peek_pointer"
		}"
		end


end -- class GVALUE_EXTERNALS
