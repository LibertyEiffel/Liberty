indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_POINTER_ARRAYS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Pointer Arrays

-- Pointer Arrays %GÅ‚Äî%@ arrays of pointers to any type of data, which grow automatically as new elements are added.
	
-- Synopsis

-- #include <glib.h>


--             GPtrArray;
-- GPtrArray*  g_ptr_array_new                 (void);
-- GPtrArray*  g_ptr_array_sized_new           (guint reserved_size);
-- void        g_ptr_array_add                 (GPtrArray *array,
--                                              gpointer data);
-- gboolean    g_ptr_array_remove              (GPtrArray *array,
--                                              gpointer data);
-- gpointer    g_ptr_array_remove_index        (GPtrArray *array,
--                                              guint index_);
-- gboolean    g_ptr_array_remove_fast         (GPtrArray *array,
--                                              gpointer data);
-- gpointer    g_ptr_array_remove_index_fast   (GPtrArray *array,
--                                              guint index_);
-- void        g_ptr_array_remove_range        (GPtrArray *array,
--                                              guint index_,
--                                              guint length);
-- void        g_ptr_array_sort                (GPtrArray *array,
--                                              GCompareFunc compare_func);
-- void        g_ptr_array_sort_with_data      (GPtrArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);
-- void        g_ptr_array_set_size            (GPtrArray *array,
--                                              gint length);
-- #define     g_ptr_array_index               (array,index_)
-- gpointer*   g_ptr_array_free                (GPtrArray *array,
--                                              gboolean free_seg);
-- void        g_ptr_array_foreach             (GPtrArray *array,
--                                              GFunc func,
--                                              gpointer user_data);

-- Description

-- Pointer Arrays are similar to Arrays but are used only for storing pointers.
-- Note

-- If you remove elements from the array, elements at the end of the array are moved into the space previously occupied by the removed element. This means that you should not rely on the index of particular elements remaining the same. You should also be careful when deleting elements while iterating over the array.

-- To create a pointer array, use g_ptr_array_new().

-- To add elements to a pointer array, use g_ptr_array_add().

-- To remove elements from a pointer array, use g_ptr_array_remove(), g_ptr_array_remove_index() or g_ptr_array_remove_index_fast().

-- To access an element of a pointer array, use g_ptr_array_index().

-- To set the size of a pointer array, use g_ptr_array_set_size().

-- To free a pointer array, use g_ptr_array_free().

-- Example 5. Using a GPtrArray

--   GPtrArray *gparray;
--   gchar *string1 = "one", *string2 = "two", *string3 = "three";

--   gparray = g_ptr_array_new ();
--   g_ptr_array_add (gparray, (gpointer) string1);
--   g_ptr_array_add (gparray, (gpointer) string2);
--   g_ptr_array_add (gparray, (gpointer) string3);

--   if (g_ptr_array_index (gparray, 0) != (gpointer) string1)
--     g_print ("ERROR: got %p instead of %p\n",
--              g_ptr_array_index (gparray, 0), string1);

--   g_ptr_array_free (gparray, TRUE);

-- Details
-- GPtrArray

-- typedef struct {
--   gpointer *pdata;
--   guint	    len;
-- } GPtrArray;

-- Contains the public fields of a pointer array.
-- gpointer *pdata; 	points to the array of pointers, which may be moved when the array grows.
-- guint len; 	number of pointers in the array.
-- g_ptr_array_new ()

-- GPtrArray*  g_ptr_array_new                 (void);

-- Creates a new GPtrArray.
-- Returns : 	the new GPtrArray.
-- g_ptr_array_sized_new ()

-- GPtrArray*  g_ptr_array_sized_new           (guint reserved_size);

-- Creates a new GPtrArray with reserved_size pointers preallocated. This avoids frequent reallocation, if you are going to add many pointers to the array. Note however that the size of the array is still 0.
-- reserved_size : 	number of pointers preallocated.
-- Returns : 	the new GPtrArray.
-- g_ptr_array_add ()

-- void        g_ptr_array_add                 (GPtrArray *array,
--                                              gpointer data);

-- Adds a pointer to the end of the pointer array. The array will grow in size automatically if necessary.
-- array : 	a GPtrArray.
-- data : 	the pointer to add.
-- g_ptr_array_remove ()

-- gboolean    g_ptr_array_remove              (GPtrArray *array,
--                                              gpointer data);

-- Removes the first occurrence of the given pointer from the pointer array. The following elements are moved down one place.

-- It returns TRUE if the pointer was removed, or FALSE if the pointer was not found.
-- array : 	a GPtrArray.
-- data : 	the pointer to remove.
-- Returns : 	TRUE if the pointer is removed. FALSE if the pointer is not found in the array.
-- g_ptr_array_remove_index ()

-- gpointer    g_ptr_array_remove_index        (GPtrArray *array,
--                                              guint index_);

-- Removes the pointer at the given index from the pointer array. The following elements are moved down one place.
-- array : 	a GPtrArray.
-- index_ : 	the index of the pointer to remove.
-- Returns : 	the pointer which was removed.
-- g_ptr_array_remove_fast ()

-- gboolean    g_ptr_array_remove_fast         (GPtrArray *array,
--                                              gpointer data);

-- Removes the first occurrence of the given pointer from the pointer array. The last element in the array is used to fill in the space, so this function does not preserve the order of the array. But it is faster than g_ptr_array_remove().

-- It returns TRUE if the pointer was removed, or FALSE if the pointer was not found.
-- array : 	a GPtrArray.
-- data : 	the pointer to remove.
-- Returns : 	TRUE if the pointer was found in the array.
-- g_ptr_array_remove_index_fast ()

-- gpointer    g_ptr_array_remove_index_fast   (GPtrArray *array,
--                                              guint index_);

-- Removes the pointer at the given index from the pointer array. The last element in the array is used to fill in the space, so this function does not preserve the order of the array. But it is faster than g_ptr_array_remove_index().
-- array : 	a GPtrArray.
-- index_ : 	the index of the pointer to remove.
-- Returns : 	the pointer which was removed.
-- g_ptr_array_remove_range ()

-- void        g_ptr_array_remove_range        (GPtrArray *array,
--                                              guint index_,
--                                              guint length);

-- Removes the given number of pointers starting at the given index from a GPtrArray. The following elements are moved to close the gap.
-- array : 	a GPtrArray.
-- index_ : 	the index of the first pointer to remove.
-- length : 	the number of pointers to remove.

-- Since 2.4
-- g_ptr_array_sort ()

-- void        g_ptr_array_sort                (GPtrArray *array,
--                                              GCompareFunc compare_func);

-- Sorts the array, using compare_func which should be a qsort()-style comparison function (returns -1 for first arg is less than second arg, 0 for equal, 1 if first arg is greater than second arg).
-- Note

-- The comparison function for g_ptr_array_sort() doesn't take the pointers from the array as arguments, it takes pointers to the pointers in the array.
-- array : 	a GPtrArray.
-- compare_func : 	comparison function.
-- g_ptr_array_sort_with_data ()

-- void        g_ptr_array_sort_with_data      (GPtrArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Like g_ptr_array_sort(), but the comparison function has a user data argument.
-- Note

-- The comparison function for g_ptr_array_sort_with_data() doesn't take the pointers from the array as arguments, it takes pointers to the pointers in the array.
-- array : 	a GPtrArray.
-- compare_func : 	comparison function.
-- user_data : 	data to pass to compare_func.
-- g_ptr_array_set_size ()

-- void        g_ptr_array_set_size            (GPtrArray *array,
--                                              gint length);

-- Sets the size of the array, expanding it if necessary. New elements are set to NULL.
-- array : 	a GPtrArray.
-- length : 	the new length of the pointer array.
-- g_ptr_array_index()

-- #define     g_ptr_array_index(array,index_)

-- Returns the pointer at the given index of the pointer array.
-- array : 	a GPtrArray.
-- index_ : 	the index of the pointer to return.
-- Returns : 	the pointer at the given index.
-- g_ptr_array_free ()

-- gpointer*   g_ptr_array_free                (GPtrArray *array,
--                                              gboolean free_seg);

-- Frees all of the memory allocated for the pointer array.
-- array : 	a GPtrArray.
-- free_seg : 	if TRUE the array of pointers (pdata) is freed.
-- Returns : 	NULL if free_seg is TRUE, otherwise the array of pointers (pdata) is returned.
-- g_ptr_array_foreach ()

-- void        g_ptr_array_foreach             (GPtrArray *array,
--                                              GFunc func,
--                                              gpointer user_data);

-- Calls a function for each element of a GPtrArray.

-- array : 	a GPtrArray
-- func : 	the function to call for each array element
-- user_data : 	user data to pass to the function

-- Since 2.4
end
