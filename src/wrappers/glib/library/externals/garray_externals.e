-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GARRAY_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_ptr_array_unref (an_array: POINTER) is
 		-- g_ptr_array_unref (node at line 118)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_unref"
		}"
		end

	g_array_remove_range (an_array: POINTER; an_index: NATURAL_32; a_length: NATURAL_32): POINTER is
 		-- g_array_remove_range (node at line 233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_remove_range"
		}"
		end

	g_ptr_array_new_with_free_func (an_element_free_func: POINTER): POINTER is
 		-- g_ptr_array_new_with_free_func (node at line 241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_new_with_free_func"
		}"
		end

	g_byte_array_remove_range (an_array: POINTER; an_index: NATURAL_32; a_length: NATURAL_32): POINTER is
 		-- g_byte_array_remove_range (node at line 603)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_remove_range"
		}"
		end

	g_array_free (an_array: POINTER; a_free_segment: INTEGER_32): POINTER is
 		-- g_array_free (node at line 753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_free"
		}"
		end

	g_byte_array_append (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_byte_array_append (node at line 1041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_append"
		}"
		end

	g_array_unref (an_array: POINTER) is
 		-- g_array_unref (node at line 1160)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_unref"
		}"
		end

	g_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_array_sort_with_data (node at line 1171)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_sort_with_data"
		}"
		end

	g_array_insert_vals (an_array: POINTER; an_index: NATURAL_32; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_array_insert_vals (node at line 1654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_insert_vals"
		}"
		end

	g_array_new (a_zero_terminated: INTEGER_32; a_clear: INTEGER_32; an_element_size: NATURAL_32): POINTER is
 		-- g_array_new (node at line 1749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_new"
		}"
		end

	g_array_remove_index_fast (an_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_array_remove_index_fast (node at line 1785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_remove_index_fast"
		}"
		end

	g_byte_array_unref (an_array: POINTER) is
 		-- g_byte_array_unref (node at line 1838)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_unref"
		}"
		end

	g_ptr_array_remove_range (an_array: POINTER; an_index: NATURAL_32; a_length: NATURAL_32) is
 		-- g_ptr_array_remove_range (node at line 2084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_remove_range"
		}"
		end

	g_ptr_array_remove_index_fast (an_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_ptr_array_remove_index_fast (node at line 2212)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_remove_index_fast"
		}"
		end

	g_ptr_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_ptr_array_sort_with_data (node at line 2257)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_sort_with_data"
		}"
		end

	g_array_ref (an_array: POINTER): POINTER is
 		-- g_array_ref (node at line 2339)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_ref"
		}"
		end

	g_array_sized_new (a_zero_terminated: INTEGER_32; a_clear: INTEGER_32; an_element_size: NATURAL_32; a_reserved_size: NATURAL_32): POINTER is
 		-- g_array_sized_new (node at line 2593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_sized_new"
		}"
		end

	g_byte_array_remove_index_fast (an_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_byte_array_remove_index_fast (node at line 2724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_remove_index_fast"
		}"
		end

	g_ptr_array_new: POINTER is
 		-- g_ptr_array_new (node at line 2728)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_new()"
		}"
		end

	g_byte_array_sort (an_array: POINTER; a_compare_func: POINTER) is
 		-- g_byte_array_sort (node at line 2760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_sort"
		}"
		end

	g_array_get_element_size (an_array: POINTER): NATURAL_32 is
 		-- g_array_get_element_size (node at line 3006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_get_element_size"
		}"
		end

	g_array_append_vals (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_array_append_vals (node at line 3031)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_append_vals"
		}"
		end

	g_ptr_array_foreach (an_array: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_ptr_array_foreach (node at line 3071)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_foreach"
		}"
		end

	g_ptr_array_remove_index (an_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_ptr_array_remove_index (node at line 3186)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_remove_index"
		}"
		end

	g_byte_array_new: POINTER is
 		-- g_byte_array_new (node at line 3196)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_new()"
		}"
		end

	g_byte_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_byte_array_sort_with_data (node at line 3480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_sort_with_data"
		}"
		end

	g_ptr_array_free (an_array: POINTER; a_free_seg: INTEGER_32): POINTER is
 		-- g_ptr_array_free (node at line 3653)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_free"
		}"
		end

	g_byte_array_ref (an_array: POINTER): POINTER is
 		-- g_byte_array_ref (node at line 3925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_ref"
		}"
		end

	g_byte_array_sized_new (a_reserved_size: NATURAL_32): POINTER is
 		-- g_byte_array_sized_new (node at line 3945)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_sized_new"
		}"
		end

	g_array_remove_index (an_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_array_remove_index (node at line 4113)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_remove_index"
		}"
		end

	g_ptr_array_set_size (an_array: POINTER; a_length: INTEGER_32) is
 		-- g_ptr_array_set_size (node at line 4475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_set_size"
		}"
		end

	g_byte_array_remove_index (an_array: POINTER; an_index: NATURAL_32): POINTER is
 		-- g_byte_array_remove_index (node at line 4507)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_remove_index"
		}"
		end

	g_ptr_array_remove (an_array: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_ptr_array_remove (node at line 4736)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_remove"
		}"
		end

	g_ptr_array_add (an_array: POINTER; a_data: POINTER) is
 		-- g_ptr_array_add (node at line 5764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_add"
		}"
		end

	g_ptr_array_set_free_func (an_array: POINTER; an_element_free_func: POINTER) is
 		-- g_ptr_array_set_free_func (node at line 5921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_set_free_func"
		}"
		end

	g_byte_array_prepend (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_byte_array_prepend (node at line 5976)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_prepend"
		}"
		end

	g_byte_array_free (an_array: POINTER; a_free_segment: INTEGER_32): POINTER is
 		-- g_byte_array_free (node at line 5987)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_free"
		}"
		end

	g_byte_array_set_size (an_array: POINTER; a_length: NATURAL_32): POINTER is
 		-- g_byte_array_set_size (node at line 6393)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_byte_array_set_size"
		}"
		end

	g_ptr_array_sort (an_array: POINTER; a_compare_func: POINTER) is
 		-- g_ptr_array_sort (node at line 6418)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_sort"
		}"
		end

	g_ptr_array_sized_new (a_reserved_size: NATURAL_32): POINTER is
 		-- g_ptr_array_sized_new (node at line 6422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_sized_new"
		}"
		end

	g_array_set_size (an_array: POINTER; a_length: NATURAL_32): POINTER is
 		-- g_array_set_size (node at line 6506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_set_size"
		}"
		end

	g_ptr_array_ref (an_array: POINTER): POINTER is
 		-- g_ptr_array_ref (node at line 6651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_ref"
		}"
		end

	g_array_prepend_vals (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_array_prepend_vals (node at line 6722)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_prepend_vals"
		}"
		end

	g_ptr_array_remove_fast (an_array: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_ptr_array_remove_fast (node at line 6826)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_ptr_array_remove_fast"
		}"
		end

	g_array_sort (an_array: POINTER; a_compare_func: POINTER) is
 		-- g_array_sort (node at line 6841)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_array_sort"
		}"
		end


end -- class GARRAY_EXTERNALS
