-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class GVALUEARRAY_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_value_array_append (a_value_array: POINTER; a_value: POINTER): POINTER 

		-- function g_value_array_append (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_append
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_append"
               }"
               end

	g_value_array_copy (a_value_array: POINTER): POINTER 

		-- function g_value_array_copy (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_copy"
               }"
               end

	g_value_array_free (a_value_array: POINTER) 

		-- function g_value_array_free (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_free"
               }"
               end

	g_value_array_get_nth (a_value_array: POINTER; an_index: NATURAL): POINTER 

		-- function g_value_array_get_nth (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_get_nth
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_get_nth"
               }"
               end

	g_value_array_get_type: like long_unsigned 

		-- function g_value_array_get_type (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_get_type()"
               }"
               end

	g_value_array_insert (a_value_array: POINTER; an_index: NATURAL; a_value: POINTER): POINTER 

		-- function g_value_array_insert (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_insert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_insert"
               }"
               end

	g_value_array_new (a_n_prealloced: NATURAL): POINTER 

		-- function g_value_array_new (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_new
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_new"
               }"
               end

	g_value_array_prepend (a_value_array: POINTER; a_value: POINTER): POINTER 

		-- function g_value_array_prepend (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_prepend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_prepend"
               }"
               end

	g_value_array_remove (a_value_array: POINTER; an_index: NATURAL): POINTER 

		-- function g_value_array_remove (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_remove
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_remove"
               }"
               end

	g_value_array_sort (a_value_array: POINTER; a_compare_func: POINTER): POINTER 

		-- function g_value_array_sort (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_sort
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_sort"
               }"
               end

	g_value_array_sort_with_data (a_value_array: POINTER; a_compare_func: POINTER; an_user_data: POINTER): POINTER 

		-- function g_value_array_sort_with_data (in `/usr/include/glib-2.0/gobject/gvaluearray.h')
               -- g_value_array_sort_with_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_value_array_sort_with_data"
               }"
               end


end -- class GVALUEARRAY_EXTERNALS
