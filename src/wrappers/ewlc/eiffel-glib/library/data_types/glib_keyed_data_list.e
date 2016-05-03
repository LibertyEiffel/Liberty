note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_KEYED_DATA_LIST
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Keyed Data Lists

-- Keyed Data Lists %GÅ‚Äî%@ lists of data elements which are accessible by a string or GQuark identifier.
	
-- Synopsis

-- #include <glib.h>


--             GData;
-- void        g_datalist_init                 (GData **datalist);

-- #define     g_datalist_id_set_data          (dl, q, d)
-- void        g_datalist_id_set_data_full     (GData **datalist,
--                                              GQuark key_id,
--                                              gpointer data,
--                                              GDestroyNotify destroy_func);
-- gpointer    g_datalist_id_get_data          (GData **datalist,
--                                              GQuark key_id);
-- #define     g_datalist_id_remove_data       (dl, q)
-- gpointer    g_datalist_id_remove_no_notify  (GData **datalist,
--                                              GQuark key_id);

-- #define     g_datalist_set_data             (dl, k, d)
-- #define     g_datalist_set_data_full        (dl, k, d, f)
-- #define     g_datalist_get_data             (dl, k)
-- #define     g_datalist_remove_data          (dl, k)
-- #define     g_datalist_remove_no_notify     (dl, k)

-- void        g_datalist_foreach              (GData **datalist,
--                                              GDataForeachFunc func,
--                                              gpointer user_data);
-- void        g_datalist_clear                (GData **datalist);
-- void        g_datalist_set_flags            (GData **datalist,
--                                              guint flags);
-- void        g_datalist_unset_flags          (GData **datalist,
--                                              guint flags);
-- guint       g_datalist_get_flags            (GData **datalist);
-- #define     G_DATALIST_FLAGS_MASK

-- Description

-- Keyed data lists provide lists of arbitrary data elements which can be accessed either with a string or with a GQuark corresponding to the string.

-- The GQuark methods are quicker, since the strings have to be converted to GQuarks anyway.

-- Data lists are used for associating arbitrary data with GObjects, using g_object_set_data() and related functions.

-- To create a datalist, use g_datalist_init().

-- To add data elements to a datalist use g_datalist_id_set_data(), g_datalist_id_set_data_full(), g_datalist_set_data() and g_datalist_set_data_full().

-- To get data elements from a datalist use g_datalist_id_get_data() and g_datalist_get_data().

-- To iterate over all data elements in a datalist use g_datalist_foreach() (not thread-safe).

-- To remove data elements from a datalist use g_datalist_id_remove_data() and g_datalist_remove_data().

-- To remove all data elements from a datalist, use g_datalist_clear().
-- Details
-- GData

-- typedef struct _GData GData;

-- The GData struct is an opaque data structure to represent a Keyed Data List. It should only be accessed via the following functions.
-- g_datalist_init ()

-- void        g_datalist_init                 (GData **datalist);

-- Resets the datalist to NULL. It does not free any memory or call any destroy functions.
-- datalist : 	a pointer to a pointer to a datalist.
-- g_datalist_id_set_data()

-- #define     g_datalist_id_set_data(dl, q, d)

-- Sets the data corresponding to the given GQuark id. Any previous data with the same key is removed, and its destroy function is called.
-- dl : 	a datalist.
-- q : 	the GQuark to identify the data element.
-- d : 	the data element, or NULL to remove any previous element corresponding to q.
-- g_datalist_id_set_data_full ()

-- void        g_datalist_id_set_data_full     (GData **datalist,
--                                              GQuark key_id,
--                                              gpointer data,
--                                              GDestroyNotify destroy_func);

-- Sets the data corresponding to the given GQuark id, and the function to be called when the element is removed from the datalist. Any previous data with the same key is removed, and its destroy function is called.
-- datalist : 	a datalist.
-- key_id : 	the GQuark to identify the data element.
-- data : 	the data element or NULL to remove any previous element corresponding to key_id.
-- destroy_func : 	the function to call when the data element is removed. This function will be called with the data element and can be used to free any memory allocated for it. If data is NULL, then destroy_func must also be NULL.
-- g_datalist_id_get_data ()

-- gpointer    g_datalist_id_get_data          (GData **datalist,
--                                              GQuark key_id);

-- Retrieves the data element corresponding to key_id.
-- datalist : 	a datalist.
-- key_id : 	the GQuark identifying a data element.
-- Returns : 	the data element, or NULL if it is not found.
-- g_datalist_id_remove_data()

-- #define     g_datalist_id_remove_data(dl, q)

-- Removes an element, using its GQuark identifier.
-- dl : 	a datalist.
-- q : 	the GQuark identifying the data element.
-- g_datalist_id_remove_no_notify ()

-- gpointer    g_datalist_id_remove_no_notify  (GData **datalist,
--                                              GQuark key_id);

-- Removes an element, without calling its destroy notification function.
-- datalist : 	a datalist.
-- key_id : 	the GQuark identifying a data element.
-- Returns : 	the data previously stored at key_id, or NULL if none.
-- g_datalist_set_data()

-- #define     g_datalist_set_data(dl, k, d)

-- Sets the data element corresponding to the given string identifier.
-- dl : 	a datalist.
-- k : 	the string to identify the data element.
-- d : 	the data element, or NULL to remove any previous element corresponding to k.
-- g_datalist_set_data_full()

-- #define     g_datalist_set_data_full(dl, k, d, f)

-- Sets the data element corresponding to the given string identifier, and the function to be called when the data element is removed.
-- dl : 	a datalist.
-- k : 	the string to identify the data element.
-- d : 	the data element, or NULL to remove any previous element corresponding to k.
-- f : 	the function to call when the data element is removed. This function will be called with the data element and can be used to free any memory allocated for it. If d is NULL, then f must also be NULL.
-- g_datalist_get_data()

-- #define     g_datalist_get_data(dl, k)

-- Gets a data element, using its string identifer. This is slower than g_datalist_id_get_data() because the string is first converted to a GQuark.
-- dl : 	a datalist.
-- k : 	the string identifying a data element.
-- Returns : 	the data element, or NULL if it is not found.
-- g_datalist_remove_data()

-- #define     g_datalist_remove_data(dl, k)

-- Removes an element using its string identifier. The data element's destroy function is called if it has been set.
-- dl : 	a datalist.
-- k : 	the string identifying the data element.
-- g_datalist_remove_no_notify()

-- #define     g_datalist_remove_no_notify(dl, k)

-- Removes an element, without calling its destroy notifier.
-- dl : 	a datalist.
-- k : 	the string identifying the data element.
-- g_datalist_foreach ()

-- void        g_datalist_foreach              (GData **datalist,
--                                              GDataForeachFunc func,
--                                              gpointer user_data);

-- Calls the given function for each data element of the datalist. The function is called with each data element's GQuark id and data, together with the given user_data parameter. Note that this function is NOT thread-safe. So unless datalist can be protected from any modifications during invocation of this function, it should not be called.
-- datalist : 	a datalist.
-- func : 	the function to call for each data element.
-- user_data : 	user data to pass to the function.
-- g_datalist_clear ()

-- void        g_datalist_clear                (GData **datalist);

-- Frees all the data elements of the datalist. The data elements' destroy functions are called if they have been set.
-- datalist : 	a datalist.
-- g_datalist_set_flags ()

-- void        g_datalist_set_flags            (GData **datalist,
--                                              guint flags);

-- Turns on flag values for a data list. This function is used to keep a small number of boolean flags in an object with a data list without using any additional space. It is not generally useful except in circumstances where space is very tight. (It is used in the base GObject type, for example.)

-- datalist : 	pointer to the location that holds a list
-- flags : 	the flags to turn on. The values of the flags are restricted by G_DATALIST_FLAGS_MASK (currently 3; giving two possible boolean flags). A value for flags that doesn't fit within the mask is an error.
-- g_datalist_unset_flags ()

-- void        g_datalist_unset_flags          (GData **datalist,
--                                              guint flags);

-- Turns off flag values for a data list. See g_datalist_unset_flags()

-- datalist : 	pointer to the location that holds a list
-- flags : 	the flags to turn off. The values of the flags are restricted by G_DATALIST_FLAGS_MASK (currently 3: giving two possible boolean flags). A value for flags that doesn't fit within the mask is an error.
-- g_datalist_get_flags ()

-- guint       g_datalist_get_flags            (GData **datalist);

-- Gets flags values packed in together with the datalist. See g_datalist_set_flags().

-- datalist : 	pointer to the location that holds a list
-- Returns : 	the flags of the datalist
-- G_DATALIST_FLAGS_MASK

-- #define G_DATALIST_FLAGS_MASK 0x3

-- A bitmask that restricts the possible flags passed to g_datalist_set_flags(). Passing a flags value where flags & ~G_DATALIST_FLAGS_MASK != 0 is an error.

end
