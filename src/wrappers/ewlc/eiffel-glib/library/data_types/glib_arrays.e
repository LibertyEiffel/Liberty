note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_ARRAYS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Arrays

-- Arrays %GÅ‚Äî%@ arrays of arbitrary elements which grow automatically as elements are added.
	
-- Synopsis

-- #include <glib.h>


--             GArray;
-- GArray*     g_array_new                     (gboolean zero_terminated,
--                                              gboolean clear_,
--                                              guint element_size);
-- GArray*     g_array_sized_new               (gboolean zero_terminated,
--                                              gboolean clear_,
--                                              guint element_size,
--                                              guint reserved_size);
-- #define     g_array_append_val              (a,v)
-- GArray*     g_array_append_vals             (GArray *array,
--                                              gconstpointer data,
--                                              guint len);
-- #define     g_array_prepend_val             (a,v)
-- GArray*     g_array_prepend_vals            (GArray *array,
--                                              gconstpointer data,
--                                              guint len);
-- #define     g_array_insert_val              (a,i,v)
-- GArray*     g_array_insert_vals             (GArray *array,
--                                              guint index_,
--                                              gconstpointer data,
--                                              guint len);
-- GArray*     g_array_remove_index            (GArray *array,
--                                              guint index_);
-- GArray*     g_array_remove_index_fast       (GArray *array,
--                                              guint index_);
-- GArray*     g_array_remove_range            (GArray *array,
--                                              guint index_,
--                                              guint length);
-- void        g_array_sort                    (GArray *array,
--                                              GCompareFunc compare_func);
-- void        g_array_sort_with_data          (GArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);
-- #define     g_array_index                   (a,t,i)
-- GArray*     g_array_set_size                (GArray *array,
--                                              guint length);
-- gchar*      g_array_free                    (GArray *array,
--                                              gboolean free_segment);

-- Description

-- Arrays are similar to standard C arrays, except that they grow automatically as elements are added.

-- Array elements can be of any size (though all elements of one array are the same size), and the array can be automatically cleared to '0's and zero-terminated.

-- To create a new array use g_array_new().

-- To add elements to an array, use g_array_append_val(), g_array_append_vals(), g_array_prepend_val(), and g_array_prepend_vals().

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

-- Details
-- GArray

-- typedef struct {
--   gchar *data;
--   guint len;
-- } GArray;

-- Contains the public fields of an Array.
-- gchar *data; 	a pointer to the element data. The data may be moved as elements are added to the GArray.
-- guint len; 	the number of elements in the GArray.
-- g_array_new ()

-- GArray*     g_array_new                     (gboolean zero_terminated,
--                                              gboolean clear_,
--                                              guint element_size);

-- Creates a new GArray.
-- zero_terminated : 	TRUE if the array should have an extra element at the end which is set to 0.
-- clear_ : 	TRUE if GArray elements should be automatically cleared to 0 when they are allocated.
-- element_size : 	the size of each element in bytes.
-- Returns : 	the new GArray.
-- g_array_sized_new ()

-- GArray*     g_array_sized_new               (gboolean zero_terminated,
--                                              gboolean clear_,
--                                              guint element_size,
--                                              guint reserved_size);

-- Creates a new GArray with reserved_size elements preallocated. This avoids frequent reallocation, if you are going to add many elements to the array. Note however that the size of the array is still 0.
-- zero_terminated : 	TRUE if the array should have an extra element at the end with all bits cleared.
-- clear_ : 	TRUE if all bits in the array should be cleared to 0 on allocation.
-- element_size : 	size of each element in the array.
-- reserved_size : 	number of elements preallocated.
-- Returns : 	the new GArray.
-- g_array_append_val()

-- #define     g_array_append_val(a,v)

-- Adds the value on to the end of the array. The array will grow in size automatically if necessary.
-- Note

-- g_array_append_val() is a macro which uses a reference to the value parameter v. This means that you cannot use it with literal values such as "27". You must use variables.
-- a : 	a GArray.
-- v : 	the value to append to the GArray.
-- Returns : 	the GArray.
-- g_array_append_vals ()

-- GArray*     g_array_append_vals             (GArray *array,
--                                              gconstpointer data,
--                                              guint len);

-- Adds len elements onto the end of the array.
-- array : 	a GArray.
-- data : 	a pointer to the elements to append to the end of the array.
-- len : 	the number of elements to append.
-- Returns : 	the GArray.
-- g_array_prepend_val()

-- #define     g_array_prepend_val(a,v)

-- Adds the value on to the start of the array. The array will grow in size automatically if necessary.

-- This operation is slower than g_array_append_val() since the existing elements in the array have to be moved to make space for the new element.
-- Note

-- g_array_prepend_val() is a macro which uses a reference to the value parameter v. This means that you cannot use it with literal values such as "27". You must use variables.
-- a : 	a GArray.
-- v : 	the value to prepend to the GArray.
-- Returns : 	the GArray.
-- g_array_prepend_vals ()

-- GArray*     g_array_prepend_vals            (GArray *array,
--                                              gconstpointer data,
--                                              guint len);

-- Adds len elements onto the start of the array.

-- This operation is slower than g_array_append_vals() since the existing elements in the array have to be moved to make space for the new elements.
-- array : 	a GArray.
-- data : 	a pointer to the elements to prepend to the start of the array.
-- len : 	the number of elements to prepend.
-- Returns : 	the GArray.
-- g_array_insert_val()

-- #define     g_array_insert_val(a,i,v)

-- Inserts an element into an array at the given index.
-- Note

-- g_array_insert_val() is a macro which uses a reference to the value parameter v. This means that you cannot use it with literal values such as "27". You must use variables.
-- a : 	a GArray.
-- i : 	the index to place the element at.
-- v : 	the value to insert into the array.
-- Returns : 	the GArray.
-- g_array_insert_vals ()

-- GArray*     g_array_insert_vals             (GArray *array,
--                                              guint index_,
--                                              gconstpointer data,
--                                              guint len);

-- Inserts len elements into a GArray at the given index.
-- array : 	a GArray.
-- index_ : 	the index to place the elements at.
-- data : 	a pointer to the elements to insert.
-- len : 	the number of elements to insert.
-- Returns : 	the GArray.
-- g_array_remove_index ()

-- GArray*     g_array_remove_index            (GArray *array,
--                                              guint index_);

-- Removes the element at the given index from a GArray. The following elements are moved down one place.
-- array : 	a GArray.
-- index_ : 	the index of the element to remove.
-- Returns : 	the GArray.
-- g_array_remove_index_fast ()

-- GArray*     g_array_remove_index_fast       (GArray *array,
--                                              guint index_);

-- Removes the element at the given index from a GArray. The last element in the array is used to fill in the space, so this function does not preserve the order of the GArray. But it is faster than g_array_remove_index().
-- array : 	a GArray.
-- index_ : 	the index of the element to remove.
-- Returns : 	the GArray.
-- g_array_remove_range ()

-- GArray*     g_array_remove_range            (GArray *array,
--                                              guint index_,
--                                              guint length);

-- Removes the given number of elements starting at the given index from a GArray. The following elements are moved to close the gap.
-- array : 	a GArray.
-- index_ : 	the index of the first element to remove.
-- length : 	the number of elements to remove.
-- Returns : 	the GArray.

-- Since 2.4
-- g_array_sort ()

-- void        g_array_sort                    (GArray *array,
--                                              GCompareFunc compare_func);

-- Sorts a GArray using compare_func which should be a qsort()-style comparison function (returns -1 for first arg is less than second arg, 0 for equal, 1 if first arg is greater than second arg).
-- array : 	a GArray.
-- compare_func : 	comparison function.
-- g_array_sort_with_data ()

-- void        g_array_sort_with_data          (GArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Like g_array_sort(), but the comparison function receives a user data argument.
-- array : 	a GArray.
-- compare_func : 	comparison function.
-- user_data : 	data to pass to compare_func.
-- g_array_index()

-- #define     g_array_index(a,t,i)

-- Returns the element of a GArray at the given index. The return value is cast to the given type.

-- Example 4. Getting a pointer to an element in a GArray

--   EDayViewEvent *event;

--   /* This gets a pointer to the 3rd element in the array of EDayViewEvent
--      structs. */
--   event = &g_array_index (events, EDayViewEvent, 3);

-- a : 	a GArray.
-- t : 	the type of the elements.
-- i : 	the index of the element to return.
-- Returns : 	the element of the GArray at the index given by i.
-- g_array_set_size ()

-- GArray*     g_array_set_size                (GArray *array,
--                                              guint length);

-- Sets the size of the array, expanding it if necessary. If the array was created with clear_ set to TRUE, the new elements are set to 0.
-- array : 	a GArray.
-- length : 	the new size of the GArray.
-- Returns : 	the GArray.
-- g_array_free ()

-- gchar*      g_array_free                    (GArray *array,
--                                              gboolean free_segment);

-- Frees the memory allocated for the GArray. If free_segment is TRUE it frees the memory block holding the elements as well. Pass FALSE if you want to free the GArray wrapper but preserve the underlying array for use elsewhere.
-- Note

-- If array elements contain dynamically-allocated memory, they should be freed first.
-- array : 	a GArray.
-- free_segment : 	if TRUE the actual element data is freed as well.
-- Returns : 	the element data if free_segment is FALSE, otherwise NULL
end
