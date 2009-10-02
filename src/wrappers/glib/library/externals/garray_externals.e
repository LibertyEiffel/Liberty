-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GARRAY_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_ptr_array_unref (an_array: POINTER) is
 		-- g_ptr_array_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_unref"
		}"
		end

	g_array_remove_range (an_array: POINTER; an_index_: NATURAL_32; a_length: NATURAL_32): POINTER is
 		-- g_array_remove_range
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_remove_range"
		}"
		end

	g_ptr_array_new_with_free_func (an_element_free_func: POINTER): POINTER is
 		-- g_ptr_array_new_with_free_func
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_new_with_free_func"
		}"
		end

	g_byte_array_remove_range (an_array: POINTER; an_index_: NATURAL_32; a_length: NATURAL_32): POINTER is
 		-- g_byte_array_remove_range
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_remove_range"
		}"
		end

	g_array_free (an_array: POINTER; a_free_segment: INTEGER_32): POINTER is
 		-- g_array_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_free"
		}"
		end

	g_byte_array_append (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_byte_array_append
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_append"
		}"
		end

	g_array_unref (an_array: POINTER) is
 		-- g_array_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_unref"
		}"
		end

	g_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_array_sort_with_data
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_sort_with_data"
		}"
		end

	g_array_insert_vals (an_array: POINTER; an_index_: NATURAL_32; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_array_insert_vals
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_insert_vals"
		}"
		end

	g_array_new (a_zero_terminated: INTEGER_32; a_clear_: INTEGER_32; an_element_size: NATURAL_32): POINTER is
 		-- g_array_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_new"
		}"
		end

	g_array_remove_index_fast (an_array: POINTER; an_index_: NATURAL_32): POINTER is
 		-- g_array_remove_index_fast
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_remove_index_fast"
		}"
		end

	g_byte_array_unref (an_array: POINTER) is
 		-- g_byte_array_unref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_unref"
		}"
		end

	g_ptr_array_remove_range (an_array: POINTER; an_index_: NATURAL_32; a_length: NATURAL_32) is
 		-- g_ptr_array_remove_range
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_remove_range"
		}"
		end

	g_ptr_array_remove_index_fast (an_array: POINTER; an_index_: NATURAL_32): POINTER is
 		-- g_ptr_array_remove_index_fast
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_remove_index_fast"
		}"
		end

	g_ptr_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_ptr_array_sort_with_data
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_sort_with_data"
		}"
		end

	g_array_ref (an_array: POINTER): POINTER is
 		-- g_array_ref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_ref"
		}"
		end

	g_array_sized_new (a_zero_terminated: INTEGER_32; a_clear_: INTEGER_32; an_element_size: NATURAL_32; a_reserved_size: NATURAL_32): POINTER is
 		-- g_array_sized_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_sized_new"
		}"
		end

	g_byte_array_remove_index_fast (an_array: POINTER; an_index_: NATURAL_32): POINTER is
 		-- g_byte_array_remove_index_fast
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_remove_index_fast"
		}"
		end

	g_ptr_array_new: POINTER is
 		-- g_ptr_array_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_new"
		}"
		end

	g_byte_array_sort (an_array: POINTER; a_compare_func: POINTER) is
 		-- g_byte_array_sort
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_sort"
		}"
		end

	g_array_get_element_size (an_array: POINTER): NATURAL_32 is
 		-- g_array_get_element_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_get_element_size"
		}"
		end

	g_array_append_vals (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_array_append_vals
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_append_vals"
		}"
		end

	g_ptr_array_foreach (an_array: POINTER; a_func: POINTER; an_user_data: POINTER) is
 		-- g_ptr_array_foreach
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_foreach"
		}"
		end

	g_ptr_array_remove_index (an_array: POINTER; an_index_: NATURAL_32): POINTER is
 		-- g_ptr_array_remove_index
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_remove_index"
		}"
		end

	g_byte_array_new: POINTER is
 		-- g_byte_array_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_new"
		}"
		end

	g_byte_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) is
 		-- g_byte_array_sort_with_data
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_sort_with_data"
		}"
		end

	g_ptr_array_free (an_array: POINTER; a_free_seg: INTEGER_32): POINTER is
 		-- g_ptr_array_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_free"
		}"
		end

	g_byte_array_ref (an_array: POINTER): POINTER is
 		-- g_byte_array_ref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_ref"
		}"
		end

	g_byte_array_sized_new (a_reserved_size: NATURAL_32): POINTER is
 		-- g_byte_array_sized_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_sized_new"
		}"
		end

	g_array_remove_index (an_array: POINTER; an_index_: NATURAL_32): POINTER is
 		-- g_array_remove_index
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_remove_index"
		}"
		end

	g_ptr_array_set_size (an_array: POINTER; a_length: INTEGER_32) is
 		-- g_ptr_array_set_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_set_size"
		}"
		end

	g_byte_array_remove_index (an_array: POINTER; an_index_: NATURAL_32): POINTER is
 		-- g_byte_array_remove_index
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_remove_index"
		}"
		end

	g_ptr_array_remove (an_array: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_ptr_array_remove
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_remove"
		}"
		end

	g_ptr_array_add (an_array: POINTER; a_data: POINTER) is
 		-- g_ptr_array_add
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_add"
		}"
		end

	g_ptr_array_set_free_func (an_array: POINTER; an_element_free_func: POINTER) is
 		-- g_ptr_array_set_free_func
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_set_free_func"
		}"
		end

	g_byte_array_prepend (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_byte_array_prepend
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_prepend"
		}"
		end

	g_byte_array_free (an_array: POINTER; a_free_segment: INTEGER_32): POINTER is
 		-- g_byte_array_free
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_free"
		}"
		end

	g_byte_array_set_size (an_array: POINTER; a_length: NATURAL_32): POINTER is
 		-- g_byte_array_set_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_byte_array_set_size"
		}"
		end

	g_ptr_array_sort (an_array: POINTER; a_compare_func: POINTER) is
 		-- g_ptr_array_sort
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_sort"
		}"
		end

	g_ptr_array_sized_new (a_reserved_size: NATURAL_32): POINTER is
 		-- g_ptr_array_sized_new
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_sized_new"
		}"
		end

	g_array_set_size (an_array: POINTER; a_length: NATURAL_32): POINTER is
 		-- g_array_set_size
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_set_size"
		}"
		end

	g_ptr_array_ref (an_array: POINTER): POINTER is
 		-- g_ptr_array_ref
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_ref"
		}"
		end

	g_array_prepend_vals (an_array: POINTER; a_data: POINTER; a_len: NATURAL_32): POINTER is
 		-- g_array_prepend_vals
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_prepend_vals"
		}"
		end

	g_ptr_array_remove_fast (an_array: POINTER; a_data: POINTER): INTEGER_32 is
 		-- g_ptr_array_remove_fast
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_ptr_array_remove_fast"
		}"
		end

	g_array_sort (an_array: POINTER; a_compare_func: POINTER) is
 		-- g_array_sort
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_array_sort"
		}"
		end

end
