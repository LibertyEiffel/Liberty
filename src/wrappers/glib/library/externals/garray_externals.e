-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GARRAY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_array_append_vals (an_array: POINTER; a_data: POINTER; a_len: NATURAL): POINTER 
               -- g_array_append_vals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_append_vals"
               }"
               end

	g_array_free (an_array: POINTER; a_free_segment: INTEGER): POINTER 
               -- g_array_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_free"
               }"
               end

	g_array_get_element_size (an_array: POINTER): NATURAL 
               -- g_array_get_element_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_get_element_size"
               }"
               end

	g_array_insert_vals (an_array: POINTER; an_index: NATURAL; a_data: POINTER; a_len: NATURAL): POINTER 
               -- g_array_insert_vals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_insert_vals"
               }"
               end

	g_array_new (a_zero_terminated: INTEGER; a_clear: INTEGER; an_element_size: NATURAL): POINTER 
               -- g_array_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_new"
               }"
               end

	g_array_prepend_vals (an_array: POINTER; a_data: POINTER; a_len: NATURAL): POINTER 
               -- g_array_prepend_vals
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_prepend_vals"
               }"
               end

	g_array_ref (an_array: POINTER): POINTER 
               -- g_array_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_ref"
               }"
               end

	g_array_remove_index (an_array: POINTER; an_index: NATURAL): POINTER 
               -- g_array_remove_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_remove_index"
               }"
               end

	g_array_remove_index_fast (an_array: POINTER; an_index: NATURAL): POINTER 
               -- g_array_remove_index_fast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_remove_index_fast"
               }"
               end

	g_array_remove_range (an_array: POINTER; an_index: NATURAL; a_length: NATURAL): POINTER 
               -- g_array_remove_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_remove_range"
               }"
               end

	g_array_set_clear_func (an_array: POINTER; a_clear_func: POINTER) 
               -- g_array_set_clear_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_set_clear_func"
               }"
               end

	g_array_set_size (an_array: POINTER; a_length: NATURAL): POINTER 
               -- g_array_set_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_set_size"
               }"
               end

	g_array_sized_new (a_zero_terminated: INTEGER; a_clear: INTEGER; an_element_size: NATURAL; a_reserved_size: NATURAL): POINTER 
               -- g_array_sized_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_sized_new"
               }"
               end

	g_array_sort (an_array: POINTER; a_compare_func: POINTER) 
               -- g_array_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_sort"
               }"
               end

	g_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) 
               -- g_array_sort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_sort_with_data"
               }"
               end

	g_array_unref (an_array: POINTER) 
               -- g_array_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_array_unref"
               }"
               end

	g_byte_array_append (an_array: POINTER; a_data: POINTER; a_len: NATURAL): POINTER 
               -- g_byte_array_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_append"
               }"
               end

	g_byte_array_free (an_array: POINTER; a_free_segment: INTEGER): POINTER 
               -- g_byte_array_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_free"
               }"
               end

	g_byte_array_free_to_bytes (an_array: POINTER): POINTER 
               -- g_byte_array_free_to_bytes
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_free_to_bytes"
               }"
               end

	g_byte_array_new: POINTER 
               -- g_byte_array_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_new"
               }"
               end

	g_byte_array_new_take (a_data: POINTER; a_len: like long_unsigned): POINTER 
               -- g_byte_array_new_take
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_new_take"
               }"
               end

	g_byte_array_prepend (an_array: POINTER; a_data: POINTER; a_len: NATURAL): POINTER 
               -- g_byte_array_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_prepend"
               }"
               end

	g_byte_array_ref (an_array: POINTER): POINTER 
               -- g_byte_array_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_ref"
               }"
               end

	g_byte_array_remove_index (an_array: POINTER; an_index: NATURAL): POINTER 
               -- g_byte_array_remove_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_remove_index"
               }"
               end

	g_byte_array_remove_index_fast (an_array: POINTER; an_index: NATURAL): POINTER 
               -- g_byte_array_remove_index_fast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_remove_index_fast"
               }"
               end

	g_byte_array_remove_range (an_array: POINTER; an_index: NATURAL; a_length: NATURAL): POINTER 
               -- g_byte_array_remove_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_remove_range"
               }"
               end

	g_byte_array_set_size (an_array: POINTER; a_length: NATURAL): POINTER 
               -- g_byte_array_set_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_set_size"
               }"
               end

	g_byte_array_sized_new (a_reserved_size: NATURAL): POINTER 
               -- g_byte_array_sized_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_sized_new"
               }"
               end

	g_byte_array_sort (an_array: POINTER; a_compare_func: POINTER) 
               -- g_byte_array_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_sort"
               }"
               end

	g_byte_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) 
               -- g_byte_array_sort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_sort_with_data"
               }"
               end

	g_byte_array_unref (an_array: POINTER) 
               -- g_byte_array_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_byte_array_unref"
               }"
               end

	g_ptr_array_add (an_array: POINTER; a_data: POINTER) 
               -- g_ptr_array_add
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_add"
               }"
               end

	g_ptr_array_foreach (an_array: POINTER; a_func: POINTER; an_user_data: POINTER) 
               -- g_ptr_array_foreach
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_foreach"
               }"
               end

	g_ptr_array_free (an_array: POINTER; a_free_seg: INTEGER): POINTER 
               -- g_ptr_array_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_free"
               }"
               end

	g_ptr_array_insert (an_array: POINTER; an_index: INTEGER; a_data: POINTER) 
               -- g_ptr_array_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_insert"
               }"
               end

	g_ptr_array_new: POINTER 
               -- g_ptr_array_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_new"
               }"
               end

	g_ptr_array_new_full (a_reserved_size: NATURAL; an_element_free_func: POINTER): POINTER 
               -- g_ptr_array_new_full
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_new_full"
               }"
               end

	g_ptr_array_new_with_free_func (an_element_free_func: POINTER): POINTER 
               -- g_ptr_array_new_with_free_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_new_with_free_func"
               }"
               end

	g_ptr_array_ref (an_array: POINTER): POINTER 
               -- g_ptr_array_ref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_ref"
               }"
               end

	g_ptr_array_remove (an_array: POINTER; a_data: POINTER): INTEGER 
               -- g_ptr_array_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_remove"
               }"
               end

	g_ptr_array_remove_fast (an_array: POINTER; a_data: POINTER): INTEGER 
               -- g_ptr_array_remove_fast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_remove_fast"
               }"
               end

	g_ptr_array_remove_index (an_array: POINTER; an_index: NATURAL): POINTER 
               -- g_ptr_array_remove_index
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_remove_index"
               }"
               end

	g_ptr_array_remove_index_fast (an_array: POINTER; an_index: NATURAL): POINTER 
               -- g_ptr_array_remove_index_fast
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_remove_index_fast"
               }"
               end

	g_ptr_array_remove_range (an_array: POINTER; an_index: NATURAL; a_length: NATURAL): POINTER 
               -- g_ptr_array_remove_range
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_remove_range"
               }"
               end

	g_ptr_array_set_free_func (an_array: POINTER; an_element_free_func: POINTER) 
               -- g_ptr_array_set_free_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_set_free_func"
               }"
               end

	g_ptr_array_set_size (an_array: POINTER; a_length: INTEGER) 
               -- g_ptr_array_set_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_set_size"
               }"
               end

	g_ptr_array_sized_new (a_reserved_size: NATURAL): POINTER 
               -- g_ptr_array_sized_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_sized_new"
               }"
               end

	g_ptr_array_sort (an_array: POINTER; a_compare_func: POINTER) 
               -- g_ptr_array_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_sort"
               }"
               end

	g_ptr_array_sort_with_data (an_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER) 
               -- g_ptr_array_sort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_sort_with_data"
               }"
               end

	g_ptr_array_unref (an_array: POINTER) 
               -- g_ptr_array_unref
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_ptr_array_unref"
               }"
               end


end -- class GARRAY_EXTERNALS
