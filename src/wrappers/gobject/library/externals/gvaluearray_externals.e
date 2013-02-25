-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GVALUEARRAY_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_value_array_remove (a_value_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_value_array_remove (node at line 235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_remove"
		}"
		end

	g_value_array_get_nth (a_value_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_value_array_get_nth (node at line 1470)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_get_nth"
		}"
		end

	g_value_array_copy (a_value_array: POINTER): POINTER is
 		-- g_value_array_copy (node at line 2142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_copy"
		}"
		end

	g_value_array_sort_with_data (a_value_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER): POINTER is
 		-- g_value_array_sort_with_data (node at line 4670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_sort_with_data"
		}"
		end

	g_value_array_sort (a_value_array: POINTER; a_compare_func: POINTER): POINTER is
 		-- g_value_array_sort (node at line 5037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_sort"
		}"
		end

	g_value_array_free (a_value_array: POINTER) is
 		-- g_value_array_free (node at line 6058)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_free"
		}"
		end

	g_value_array_new (a_n_prealloced: NATURAL_32): POINTER is
 		-- g_value_array_new (node at line 6310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_new"
		}"
		end

	g_value_array_prepend (a_value_array: POINTER; a_value: POINTER): POINTER is
 		-- g_value_array_prepend (node at line 7002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_prepend"
		}"
		end

	g_value_array_append (a_value_array: POINTER; a_value: POINTER): POINTER is
 		-- g_value_array_append (node at line 7654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_append"
		}"
		end

	g_value_array_insert (a_value_array: POINTER; an_index: NATURAL_32; a_value: POINTER): POINTER is
 		-- g_value_array_insert (node at line 7750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_value_array_insert"
		}"
		end


end -- class GVALUEARRAY_EXTERNALS
