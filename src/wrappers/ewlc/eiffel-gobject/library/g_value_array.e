note
	description: "Value array - A container structure to maintain an array of generic values."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class G_VALUE_ARRAY
	-- A container to maintain an array of generic values.
	
	-- The prime purpose of a GValueArray is for it to be used as an
	-- object property that holds an array of values. A GValueArray
	-- wraps an array of GValue elements in order for it to be used as
	-- a boxed type through G_TYPE_VALUE_ARRAY.
	
inherit
	C_STRUCT
		redefine copy
		end
	
create {ANY} make

feature {} -- Creation
	make (n_prealloced: INTEGER)
			-- Allocate and initialize a new GValueArray, optionally
			-- preserve space for `n_prealloced' elements. New arrays
			-- always contain 0 elements, regardless of the value of
			-- n_prealloced.
		require positive_prealloced: n_prealloced>0
		do
			handle := g_value_array_new (n_prealloced);
		end

feature {ANY} 
	dispose
		do
			g_value_array_free (handle)
			handle:=default_pointer
		end

feature {ANY} -- Duplication
	copy (a_source: like Current)
			-- Construct an exact copy of a GValueArray by duplicating
			-- all its contents.
		require else valid_source: a_source /= Void
		do
			handle := g_value_array_copy (a_source.handle)
		end

feature {ANY} -- Array-like features
	to_external: POINTER
			-- Gives C access into the internal `storage' of the G_VALUE_ARRAY.
		do
			Result:=get_values (handle)
		end

	count: INTEGER
			-- Number of available indices.
		do
			Result := get_n_values(handle)
		ensure positive: Result >= 0
		end

	item (an_index: INTEGER): G_VALUE
			-- the value at `an_index' contained in Current.
		require
			positive_integer: an_index >= 0
			correct_index: an_index < count
		do
			create Result.from_external_pointer (g_value_array_get_nth (handle, an_index))
		end

	append (a_value: G_VALUE)
			-- Insert a copy of `a_value' as last element of Current.
		require valid_value: a_value/=Void
		do
			handle := g_value_array_append (handle, a_value.handle)
		ensure number_increased: count = old count + 1
		end

	prepend (a_value: G_VALUE)
			-- Insert a copy of `a_value' as firsr element of Current.
		require valid_value: a_value/=Void
		do
			handle := g_value_array_prepend (handle, a_value.handle)
		ensure number_increased: count = old count + 1
		end

	insert (an_index: INTEGER; a_value: G_VALUE)
			-- Insert a copy of `a_value' at `an_index' position of
			-- Current.
		require
			valid_index: an_index.in_range (0,count-1)
			valid_value: a_value/=Void
		do
			handle:=g_value_array_insert(handle,an_index, a_value.handle)
		ensure number_increased: count = old count + 1
		end

	remove (an_index: INTEGER)
			-- Remove the value at position `an_index'.
		require valid_index: an_index.in_range (0,count-1)
		do
			handle := g_value_array_remove (handle, an_index)
		ensure number_decreased: count = old count - 1
		end
	
	-- TODO: g_value_array_sort ()

	-- GValueArray* g_value_array_sort             (GValueArray *value_array,
	--                                              GCompareFunc compare_func);

	-- Sort value_array using compare_func to compare the elements accoring to the semantics of GCompareFunc.

	-- The current implementation uses Quick-Sort as sorting algorithm.
	-- value_array : 	GValueArray to sort
	-- compare_func : 	function to compare elements
	-- Returns : 	the GValueArray passed in as value_array

	
	-- TODO: g_value_array_sort_with_data ()

	-- GValueArray* g_value_array_sort_with_data   (GValueArray *value_array,
	--                                              GCompareDataFunc compare_func,
	--                                              gpointer user_data);

	-- Sort value_array using compare_func to compare the elements accoring to the semantics of GCompareDataFunc.
		
	-- The current implementation uses Quick-Sort as sorting algorithm.
	-- value_array : 	GValueArray to sort
	-- compare_func : 	function to compare elements
	-- user_data : 	extra data argument provided for compare_func
	-- Returns : 	the GValueArray passed in as value_array

feature {} -- External calls
	g_value_array_get_nth (a_value_array: POINTER; an_index: INTEGER): POINTER is -- GValue
			-- Note: an_index is a guint, a NATURAL
		external "C use <glib-object.h>"
		end

	g_value_array_new (n_prealloced: INTEGER): POINTER is -- GValueArray
			-- Note: n_prealloced is a guint, a NATURAL
		external "C use <glib-object.h>"
		end
	
	g_value_array_copy (a_value_array: POINTER): POINTER is -- GValueArray
			-- Note: a_value_array is a const POINTER
		external "C use <glib-object.h>"
		end
	
	g_value_array_free (a_value_array: POINTER)
			-- Actually it is g_value_array_free
		external "C use <glib-object.h>"
		end
	
	g_value_array_append (a_value_array, a_value: POINTER): POINTER is -- GValueArray
		external "C use <glib-object.h>"
		end

	g_value_array_prepend (a_value_array, a_value: POINTER): POINTER is -- GValueArray
		external "C use <glib-object.h>"
		end

	g_value_array_insert (a_value_array: POINTER; an_index: INTEGER; a_value: POINTER): POINTER is -- GValueArray
			-- Note: an_index is a guint, a NATURAL
		external "C use <glib-object.h>"
		end

	g_value_array_remove (a_value_array: POINTER; an_index: INTEGER): POINTER is -- GValueArray
		-- Note: an_index is a guint
		external "C use <glib-object.h>"
		end

	g_value_array_sort (a_value_array, a_compare_func: POINTER): POINTER is -- GValueArray
		external "C use <glib-object.h>"
		end
	
	g_value_array_sort_with_data (a_value_array, a_compare_func, user_data: POINTER): POINTER is -- GValueArray
		external "C use <glib-object.h>"
		end

feature {} -- GValueArray struct

	get_n_values (a_gvalue_array: POINTER): INTEGER
			-- Get n_values from a GValueArray struct. It is a guint, the
			-- number of values contained in the array
		external "C struct get n_values use <glib-object.h>"
		ensure positive: Result >= 0
		end

	get_values (a_gvalue_array: POINTER): POINTER
			-- Get values from a GValueArray struct. It is C pointer to 
			-- the array of values
		external "C struct get values use <glib-object.h>"
		end
	
feature {ANY} -- Size
	struct_size: INTEGER
		external "C inline use <glib-object.h>"
		alias "sizeof(GValueArray)"
		end
end
