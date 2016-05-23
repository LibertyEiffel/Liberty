note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_BYTE_ARRAYS
	-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Byte Arrays

-- Byte Arrays %GÅ‚Äî%@ arrays of bytes, which grow automatically as elements are added.
	
-- Synopsis

-- #include <glib.h>


--             GByteArray;
-- GByteArray* g_byte_array_new                (void);
-- GByteArray* g_byte_array_sized_new          (guint reserved_size);
-- GByteArray* g_byte_array_append             (GByteArray *array,
--                                              const guint8 *data,
--                                              guint len);
-- GByteArray* g_byte_array_prepend            (GByteArray *array,
--                                              const guint8 *data,
--                                              guint len);
-- GByteArray* g_byte_array_remove_index       (GByteArray *array,
--                                              guint index_);
-- GByteArray* g_byte_array_remove_index_fast  (GByteArray *array,
--                                              guint index_);
-- GByteArray* g_byte_array_remove_range       (GByteArray *array,
--                                              guint index_,
--                                              guint length);
-- void        g_byte_array_sort               (GByteArray *array,
--                                              GCompareFunc compare_func);
-- void        g_byte_array_sort_with_data     (GByteArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);
-- GByteArray* g_byte_array_set_size           (GByteArray *array,
--                                              guint length);
-- guint8*     g_byte_array_free               (GByteArray *array,
--                                              gboolean free_segment);

-- Description

-- GByteArray is based on GArray, to provide arrays of bytes which grow automatically as elements are added.

-- To create a new GByteArray use g_byte_array_new().

-- To add elements to a GByteArray, use g_byte_array_append(), and g_byte_array_prepend().

-- To set the size of a GByteArray, use g_byte_array_set_size().

-- To free a GByteArray, use g_byte_array_free().

-- Example 6. Using a GByteArray

--   GByteArray *gbarray;
--   gint i;

--   gbarray = g_byte_array_new ();
--   for (i = 0; i < 10000; i++)
--     g_byte_array_append (gbarray, (guint8*) "abcd", 4);

--   for (i = 0; i < 10000; i++)
--     {
--       g_assert (gbarray->data[4*i] == 'a');
--       g_assert (gbarray->data[4*i+1] == 'b');
--       g_assert (gbarray->data[4*i+2] == 'c');
--       g_assert (gbarray->data[4*i+3] == 'd');
--     }

--   g_byte_array_free (gbarray, TRUE);

-- Details
-- GByteArray

-- typedef struct {
--   guint8 *data;
--   guint	  len;
-- } GByteArray;

-- The GByteArray struct allows access to the public fields of a GByteArray.
-- guint8 *data; 	a pointer to the element data. The data may be moved as elements are added to the GByteArray.
-- guint len; 	the number of elements in the GByteArray.
-- g_byte_array_new ()

-- GByteArray* g_byte_array_new                (void);

-- Creates a new GByteArray.
-- Returns : 	the new GByteArray.
-- g_byte_array_sized_new ()

-- GByteArray* g_byte_array_sized_new          (guint reserved_size);

-- Creates a new GByteArray with reserved_size bytes preallocated. This avoids frequent reallocation, if you are going to add many bytes to the array. Note however that the size of the array is still 0.
-- reserved_size : 	number of bytes preallocated.
-- Returns : 	the new GByteArray.
-- g_byte_array_append ()

-- GByteArray* g_byte_array_append             (GByteArray *array,
--                                              const guint8 *data,
--                                              guint len);

-- Adds the given bytes to the end of the GByteArray. The array will grow in size automatically if necessary.
-- array : 	a GByteArray.
-- data : 	the byte data to be added.
-- len : 	the number of bytes to add.
-- Returns : 	the GByteArray.
-- g_byte_array_prepend ()

-- GByteArray* g_byte_array_prepend            (GByteArray *array,
--                                              const guint8 *data,
--                                              guint len);

-- Adds the given data to the start of the GByteArray. The array will grow in size automatically if necessary.
-- array : 	a GByteArray.
-- data : 	the byte data to be added.
-- len : 	the number of bytes to add.
-- Returns : 	the GByteArray.
-- g_byte_array_remove_index ()

-- GByteArray* g_byte_array_remove_index       (GByteArray *array,
--                                              guint index_);

-- Removes the byte at the given index from a GByteArray. The following bytes are moved down one place.
-- array : 	a GByteArray.
-- index_ : 	the index of the byte to remove.
-- Returns : 	the GByteArray.
-- g_byte_array_remove_index_fast ()

-- GByteArray* g_byte_array_remove_index_fast  (GByteArray *array,
--                                              guint index_);

-- Removes the byte at the given index from a GByteArray. The last element in the array is used to fill in the space, so this function does not preserve the order of the GByteArray. But it is faster than g_byte_array_remove_index().
-- array : 	a GByteArray.
-- index_ : 	the index of the byte to remove.
-- Returns : 	the GByteArray.
-- g_byte_array_remove_range ()

-- GByteArray* g_byte_array_remove_range       (GByteArray *array,
--                                              guint index_,
--                                              guint length);

-- Removes the given number of bytes starting at the given index from a GByteArray. The following elements are moved to close the gap.
-- array : 	a GByteArray.
-- index_ : 	the index of the first byte to remove.
-- length : 	the number of bytes to remove.
-- Returns : 	the GByteArray.

-- Since 2.4
-- g_byte_array_sort ()

-- void        g_byte_array_sort               (GByteArray *array,
--                                              GCompareFunc compare_func);

-- Sorts a byte array, using compare_func which should be a qsort()-style comparison function (returns -1 for first arg is less than second arg, 0 for equal, 1 if first arg is greater than second arg).
-- array : 	a GByteArray.
-- compare_func : 	comparison function.
-- g_byte_array_sort_with_data ()

-- void        g_byte_array_sort_with_data     (GByteArray *array,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Like g_byte_array_sort(), but the comparison function takes a user data argument.
-- array : 	a GByteArray.
-- compare_func : 	comparison function.
-- user_data : 	data to pass to compare_func.
-- g_byte_array_set_size ()

-- GByteArray* g_byte_array_set_size           (GByteArray *array,
--                                              guint length);

-- Sets the size of the GByteArray, expanding it if necessary.
-- array : 	a GByteArray.
-- length : 	the new size of the GByteArray.
-- Returns : 	the GByteArray.
-- g_byte_array_free ()

-- guint8*     g_byte_array_free               (GByteArray *array,
--                                              gboolean free_segment);

-- Frees the memory allocated by the GByteArray. If free_segment is TRUE it frees the actual byte data.
-- array : 	a GByteArray.
-- free_segment : 	if TRUE the actual byte data is freed as well.
-- Returns : 	the element data if free_segment is FALSE, otherwise NULL
end
