note
	description: "Arrays of arbitrary elements which grow automatically as elements are added."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$REvision:$"

			-- Description: G_ARRAYS are similar to standard C arrays,
			-- except that they grow automatically as elements are added.

			-- Array elements can be of any size (though all elements of
			-- one array are the same size), and the array can be
			-- automatically cleared to '0's and zero-terminated.

			-- To create a new array use g_array_new().
	
			-- To add elements to an array, use g_array_append_val(),
			-- g_array_append_vals(), g_array_prepend_val(), and
			-- g_array_prepend_vals().
	
			-- To access an element of an array, use g_array_index().

			-- To set the size of an array, use g_array_set_size().

			-- To free an array, use g_array_free().
	
			-- Example 3. Using a GArray to store gint values
	
			--   GArray *garray;
			--   gint i;
	
			--   /* We create a new array to store gint values.
			--      We don't want it zero-terminated or cleared to 0's. */
			--   garray = g_array_new (FALSE, FALSE, sizeof (gint));
			--   for (i = 0; i < 10000; i++)
			--     g_array_append_val (garray, i);
	
			--   for (i = 0; i < 10000; i++)
			--     if (g_array_index (garray, gint, i) != i)
			--       g_print ("ERROR: got %d instead of %d\n",
			--                g_array_index (garray, gint, i), i);
	
			--   g_array_free (garray, TRUE);
	
	
class G_ARRAY [ITEM->C_STRUCT]

inherit C_STRUCT
	-- TODO: make it a proper heir of ARRAY, FAST_ARRAY or
	-- ARRAYED_COLLECTION
	
insert WRAPPER_FACTORY [ITEM]

create {ANY} make, empty, from_external_pointer 

feature {} -- Creation

	make (zero_terminated, cleared: BOOLEAN)
			-- Creates a new G_ARRAY. `zero_terminated' is True when the
			-- array should have an extra element at the end which is set
			-- to 0. `cleared' is True if elements should be
			-- automatically cleared to 0 when they are allocated.
		local element_size: INTEGER
		do
			-- element_size is the size of each element in bytes.
			from_external_pointer 
			(g_array_new (zero_terminated.to_integer,
							  cleared.to_integer,
							  element_size))
		end

	with_capacity (a_capacity: INTEGER)
			-- Creates a new GArray with `a_capacity' elements
			-- preallocated. This avoids frequent reallocation, if you
			-- are going to add many elements to the array. Note however
			-- that the size of the array is still 0. Note: (low level
			-- details) the array will be zero terminated, i.e. il will
			-- have an extra element at the end with all bits
			-- cleared. The allocated memory will be not cleared.
		require positive_capacity:
			-- a_capacity > 0
		local element_size: INTEGER
		do
			from_external_pointer
			(g_array_sized_new (1, -- zero_terminated,
									  0, -- clear_,
									  element_size, 
									  a_capacity))
		end

feature {ANY} 
	append (an_item: like first)
			-- Adds the value on to the end of the array. The array will
			-- grow in size automatically if necessary.
		require item_not_void: an_item /= Void
		do
			g_array_append_val(handle,a_value.handle)
			-- Note: g_array_append_val() is a macro which uses a
			-- reference to the value parameter v. This means that you cannot use
			-- it with literal values such as "27". You must use variables.
		end

	append_values (some_items: ARRAY[ITEM])
			-- Adds `some_elements' onto the end of the array.
		require 
			items_not_void: some_items /= Void
			items_not_empty: not some_items.is_empty
		local ptr: POINTER
		do
			ptr:=g_array_append_vals (handle, some_items.to_external, some_items.count)
			check
				-- g_array_prepend_vals should return the pointer to the GArray
				ptr = handle 
			end
		end

	prepend (an_item: like first)
			-- Adds `an_item' on to the start of the array. The array
			-- will grow in size automatically if necessary.
		
			-- This operation is slower than `append' since the existing
			-- elements in the array have to be moved to make space for
			-- the new element.
		require item_not_void: an_item /= Void
		do
			g_array_prepend_val (handle,an_item.handle)
			-- Note: g_array_prepend_val() is a macro which uses a
			-- reference to the value parameter v. This means that you
			-- cannot use it with literal values such as "27". You must
			-- use variables. 
		end

	prepend_values (some_items: ARRAY[ITEM])
			-- Adds `some_items' onto the start of the array.

			-- This operation is slower than `append_values' since the
			-- existing elements in the array have to be moved to make
			-- space for the new elements.
		require 
			items_not_void: some_items /= Void
			items_not_empty: not some_items.is_empty
		local ptr: POINTER
		do
			ptr:=g_array_prepend_vals (handle, some_items.to_external, some_items.count)
			check
				-- g_array_prepend_vals should return the pointer to the GArray
				ptr = handle 
			end
		end

	insert_value (an_item: ITEM; an_index: INTEGER)
			-- Inserts `an_item' into Current array at `an_index'.
		require
			item_not_void: an_item /= Void
			valid_index: is_valid_index (an_index)
		local ptr: POINTER
		do
			ptr:=g_array_insert_val (handle, an_index, an_item.handle)
			check 
				ptr_is_c_garray: ptr = handle 
			end
			-- Note: g_array_insert_val() is a macro which uses a
			-- reference to the value parameter v. This means that you
			-- cannot use it with literal values such as "27". You must
			-- use variables.
		ensure -- TODO: value_put
		end

	insert_values (some_values: ARRAY[ITEM]; an_index: INTEGER)
			-- Inserts `some_values' into Current GArray at `an_index'.
		require
			values_not_void: some_values /= Void
			values_not_empty: not some_values.is_empty
		local ptr: POINTER
		do
			ptr:=g_array_insert_vals(handle, an_index,
											 some_values.to_external,
											 some_values.count)
			check 
				ptr_is_c_garray: ptr = handle 
			end
		end

	remove_index (an_index: INTEGER)
			-- Removes the element at `an_index' from Current GArray. The
			-- following elements are moved down one place.
		require valid_index: is_valid_index (an_index)
		local ptr: POINTER
		do
			ptr:=g_array_remove_index(handle,an_index)
			check 
				ptr_is_c_garray: ptr = handle 
			end
		ensure count_decreased: count = old count - 1 
		end

	remove_index_fast (an_index: INTEGER)
			-- Removes the element at `an_index' from Current GArray. The
			-- last element in the array is used to fill in the space, so
			-- this function does not preserve the order of the
			-- GArray. But it is faster than `remove_index'.
		require valid_index: is_valid_index (an_index)
		local ptr: POINTER
		do
			ptr:=g_array_remove_index_fast(handle,an_index)
			check 
				ptr_is_c_garray: ptr = handle 
			end
		ensure 
			count_decreased: count = old count - 1 
			last_moved_to_an_index: old last = item(an_index)
		end

	remove_range (an_index, a_number: INTEGER)
			-- Removes `a_number' elements starting at `an_index' from a
			-- GArray. The following elements are moved to close the gap.
		require 
			valid_index: is_valid_index (an_index)
			valid_range: is_valid_index (an_index+a_lenght-1)
		local ptr: POINTER
		do
			ptr:=g_array_remove_range(handle,an_index,a_lenght)
			check 
				ptr_is_c_garray: ptr = handle 
			end
		ensure 
			count_decreased: count = old count - a_number 
		end

	-- TODO: sort ()

	-- void g_array_sort (GArray *array, GCompareFunc compare_func);

	-- Sorts a GArray using compare_func which should be a
	-- qsort()-style comparison function (returns -1 for first arg is
	-- less than second arg, 0 for equal, 1 if first arg is greater
	-- than second arg).  array : a GArray.  compare_func : comparison
	-- function.  g_array_sort_with_data ()

	-- void g_array_sort_with_data (GArray *array, GCompareDataFunc
	-- compare_func, gpointer user_data);
	
	-- Like g_array_sort(), but the comparison function receives a user
	-- data argument.  array : a GArray.  compare_func : comparison
	-- function.  user_data : data to pass to compare_func.

	item (an_index: INTEGER): ITEM
			-- the element of Current GArray at `an_index'. 

			-- Example 4. Getting a pointer to an element in a GArray

			-- EDayViewEvent *event; /* This gets a pointer to the 3rd
			-- element in the array of EDayViewEvent structs. */ event =
			-- &g_array_index (events, EDayViewEvent, 3);
		local ptr: POINTER
		do
			ptr := g_array_index(handle,an_index)
			-- The return value is cast to the given type.
		ensure implemented: False
		end

	set_size (a_length: INTEGER)
			-- Sets the size of the array, expanding it if necessary. If the array
			-- was created with `cleared' set to True, the new elements are
			-- set to Void.
		require positive_length: a_length >= 0
		local ptr: POINTER
		do
			ptr:=g_array_set_size(handle,a_length)
		end

	dispose
		local p: POINTER
		do
			-- g_array_free frees the memory allocated for the GArray. If
			-- free_segment is TRUE it frees the memory block holding the
			-- elements as well. Pass FALSE if you want to free the
			-- GArray wrapper but preserve the underlying array for use
			-- elsewhere.  free_segment : if TRUE the actual element data
			-- is freed as well. 
			p:=g_array_free (handle, 
								  0 -- free_segment=False, i.e. do not
								  -- free the actual data
								  )
			unstore_eiffel_wrapper
			handle:=default_pointer
		end

feature {} -- External calls
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GArray)"
		end

	g_array_new (zero_terminated_bool, clear_bool, an_element_size: INTEGER): POINTER
			-- GArray* g_array_new (gboolean zero_terminated, gboolean
			-- clear_, guint element_size);
		
			-- TODO: an_element_size should be NATURAL
		external "C use <glib.h>"
		end

	g_array_sized_new (zero_terminated_bool, clear_bool, an_element_size, a_reserverd_size: INTEGER): POINTER
			-- GArray* g_array_sized_new (gboolean zero_terminated, gboolean clear_, guint element_size, guint reserved_size);

			-- TODO: an_element_size should be NATURAL
			-- TODO: a_reserved_size should be NATURAL
		external "C use <glib.h>"
		end

	g_array_append_val (a,v: POINTER)
			-- #define g_array_append_val (a,v)
		external "C macro use <glib.h>"
		end

	g_array_append_vals (an_array, some_data: INTEGER; a_len: INTEGER): POINTER
			-- GArray* g_array_append_vals (GArray *array, gconstpointer
			-- data, guint len);

			-- TODO: a_len should be NATURAL
		external "C use <glib.h>"
		end

	g_array_prepend_val (a,v: POINTER)
			-- #define g_array_prepend_val (a,v)
		external "C macro use <glib.h>"
		end

	g_array_prepend_vals (an_array, some_data: POINTER; a_len: INTEGER): POINTER
			-- GArray* g_array_prepend_vals (GArray *array, gconstpointer
			-- data, guint len);

			-- TODO: a_len should be NATURAL
		external "C use <glib.h>"
		end
	
	g_array_insert_val (an_array: POINTER; an_index: INTEGER; a_value: POINTER)
		-- #define g_array_insert_val (a,i,v)
		external "C macro use <glib.h>"
		end
	
	g_array_insert_vals (an_array: POINTER; guint_index: INTEGER; some_data: POINTER; guint_len: INTEGER): POINTER
			-- GArray* g_array_insert_vals (GArray *array, guint index_,
			-- gconstpointer data, guint len);

			-- TODO: guint_index and guint_len should be NATURALs
		external "C use <glib.h>"
		end

	g_array_remove_index (an_array: POINTER; guint_index: INTEGER): POINTER
			-- GArray* g_array_remove_index (GArray *array, guint
			-- index_);

			-- TODO: guint_index should be NATURAL		
		external "C use <glib.h>"
		end

	g_array_remove_index_fast (an_array: POINTER; guint_index: INTEGER): POINTER
			-- GArray* g_array_remove_index_fast (GArray *array, guint
			-- index_);

			-- TODO: guint_index should be NATURAL		
		
		external "C use <glib.h>"
		end

	g_array_remove_range (an_array: POINTER; guint_index, guint_length: INTEGER): POINTER
			-- GArray* g_array_remove_range (GArray *array, guint index_,
			-- guint length);

			-- TODO: guint_index and guint_len should be NATURALs
		external "C use <glib.h>"
		end

	g_array_sort (an_array, a_compare_func: POINTER)
			-- void g_array_sort (GArray *array, GCompareFunc compare_func);
		external "C use <glib.h>"
		end

	g_array_sort_with_data (an_array, a_compare_func, some_data: POINTER)
			-- void g_array_sort_with_data (GArray *array,
			-- GCompareDataFunc compare_func, gpointer user_data);
		external "C use <glib.h>"
		end
	
	g_array_index (an_array: POINTER; an_index: INTEGER): POINTER
			-- #define g_array_index (a,t,i)
		external "C macro use <glib.h>"
		alias "g_array_index ($an_array, (void *), $an_index)"
		end
	
	g_array_set_size (an_array: POINTER; a_length): POINTER
			-- GArray* g_array_set_size (GArray *array, guint length);

			-- TODO: a_length should be NATURAL
		external "C use <glib.h>"
		end
	
	g_array_free (an_array: POINTER; free_segment_bool: INTEGER): POINTER
			-- gchar* g_array_free (GArray *array, gboolean free_segment);
		external "C use <glib.h>"
		end
	
feature {} -- Struct access
-- GArray

-- typedef struct {
-- gchar *data;
-- guint len;
-- } GArray;

-- Contains the public fields of an Array.
-- gchar *data; a pointer to the element data. The data may be moved as elements are added to the GArray.
-- guint len; the number of elements in the GArray.
end
