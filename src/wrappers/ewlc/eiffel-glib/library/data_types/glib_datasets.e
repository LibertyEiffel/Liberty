note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_DATASETS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Datasets

-- Datasets %GÅ‚Äî%@ associate groups of data elements with particular memory locations.
	
-- Synopsis

-- #include <glib.h>


-- #define     g_dataset_id_set_data           (l, k, d)
-- void        g_dataset_id_set_data_full      (gconstpointer dataset_location,
--                                              GQuark key_id,
--                                              gpointer data,
--                                              GDestroyNotify destroy_func);
-- void        (*GDestroyNotify)               (gpointer data);
-- gpointer    g_dataset_id_get_data           (gconstpointer dataset_location,
--                                              GQuark key_id);
-- #define     g_dataset_id_remove_data        (l, k)
-- gpointer    g_dataset_id_remove_no_notify   (gconstpointer dataset_location,
--                                              GQuark key_id);

-- #define     g_dataset_set_data              (l, k, d)
-- #define     g_dataset_set_data_full         (l, k, d, f)
-- #define     g_dataset_get_data              (l, k)
-- #define     g_dataset_remove_data           (l, k)
-- #define     g_dataset_remove_no_notify      (l, k)

-- void        g_dataset_foreach               (gconstpointer dataset_location,
--                                              GDataForeachFunc func,
--                                              gpointer user_data);
-- void        (*GDataForeachFunc)             (GQuark key_id,
--                                              gpointer data,
--                                              gpointer user_data);
-- void        g_dataset_destroy               (gconstpointer dataset_location);

-- Description

-- Datasets associate groups of data elements with particular memory locations. These are useful if you need to associate data with a structure returned from an external library. Since you cannot modify the structure, you use its location in memory as the key into a dataset, where you can associate any number of data elements with it.

-- There are two forms of most of the dataset functions. The first form uses strings to identify the data elements associated with a location. The second form uses GQuark identifiers, which are created with a call to g_quark_from_string() or g_quark_from_static_string(). The second form is quicker, since it does not require looking up the string in the hash table of GQuark identifiers.

-- There is no function to create a dataset. It is automatically created as soon as you add elements to it.

-- To add data elements to a dataset use g_dataset_id_set_data(), g_dataset_id_set_data_full(), g_dataset_set_data() and g_dataset_set_data_full().

-- To get data elements from a dataset use g_dataset_id_get_data() and g_dataset_get_data().

-- To iterate over all data elements in a dataset use g_dataset_foreach() (not thread-safe).

-- To remove data elements from a dataset use g_dataset_id_remove_data() and g_dataset_remove_data().

-- To destroy a dataset, use g_dataset_destroy().
-- Details
-- g_dataset_id_set_data()

-- #define     g_dataset_id_set_data(l, k, d)

-- Sets the data element associated with the given GQuark id. Any previous data with the same key is removed, and its destroy function is called.
-- l : 	the location identifying the dataset.
-- k : 	the GQuark id to identify the data element.
-- d : 	the data element.
-- g_dataset_id_set_data_full ()

-- void        g_dataset_id_set_data_full      (gconstpointer dataset_location,
--                                              GQuark key_id,
--                                              gpointer data,
--                                              GDestroyNotify destroy_func);

-- Sets the data element associated with the given GQuark id, and also the function to call when the data element is destroyed. Any previous data with the same key is removed, and its destroy function is called.
-- dataset_location : 	the location identifying the dataset.
-- key_id : 	the GQuark id to identify the data element.
-- data : 	the data element.
-- destroy_func : 	the function to call when the data element is removed. This function will be called with the data element and can be used to free any memory allocated for it.
-- GDestroyNotify ()

-- void        (*GDestroyNotify)               (gpointer data);

-- Specifies the type of function which is called when a data element is destroyed. It is passed the pointer to the data element and should free any memory and resources allocated for it.
-- data : 	the data element.
-- g_dataset_id_get_data ()

-- gpointer    g_dataset_id_get_data           (gconstpointer dataset_location,
--                                              GQuark key_id);

-- Gets the data element corresponding to a GQuark.
-- dataset_location : 	the location identifying the dataset.
-- key_id : 	the GQuark id to identify the data element.
-- Returns : 	the data element corresponding to the GQuark, or NULL if it is not found.
-- g_dataset_id_remove_data()

-- #define     g_dataset_id_remove_data(l, k)

-- Removes a data element from a dataset. The data element's destroy function is called if it has been set.
-- l : 	the location identifying the dataset.
-- k : 	the GQuark id identifying the data element.
-- g_dataset_id_remove_no_notify ()

-- gpointer    g_dataset_id_remove_no_notify   (gconstpointer dataset_location,
--                                              GQuark key_id);

-- Removes an element, without calling its destroy notification function.
-- dataset_location : 	the location identifying the dataset.
-- key_id : 	the GQuark ID identifying the data element.
-- Returns : 	the data previously stored at key_id, or NULL if none.
-- g_dataset_set_data()

-- #define     g_dataset_set_data(l, k, d)

-- Sets the data corresponding to the given string identifier.
-- l : 	the location identifying the dataset.
-- k : 	the string to identify the data element.
-- d : 	the data element.
-- g_dataset_set_data_full()

-- #define     g_dataset_set_data_full(l, k, d, f)

-- Sets the data corresponding to the given string identifier, and the function to call when the data element is destroyed.
-- l : 	the location identifying the dataset.
-- k : 	the string to identify the data element.
-- d : 	the data element.
-- f : 	the function to call when the data element is removed. This function will be called with the data element and can be used to free any memory allocated for it.
-- g_dataset_get_data()

-- #define     g_dataset_get_data(l, k)

-- Gets the data element corresponding to a string.
-- l : 	the location identifying the dataset.
-- k : 	the string identifying the data element.
-- Returns : 	the data element corresponding to the string, or NULL if it is not found.
-- g_dataset_remove_data()

-- #define     g_dataset_remove_data(l, k)

-- Removes a data element corresponding to a string. Its destroy function is called if it has been set.
-- l : 	the location identifying the dataset.
-- k : 	the string identifying the data element.
-- g_dataset_remove_no_notify()

-- #define     g_dataset_remove_no_notify(l, k)

-- Removes an element, without calling its destroy notifier.
-- l : 	the location identifying the dataset.
-- k : 	the string identifying the data element.
-- g_dataset_foreach ()

-- void        g_dataset_foreach               (gconstpointer dataset_location,
--                                              GDataForeachFunc func,
--                                              gpointer user_data);

-- Calls the given function for each data element which is associated with the given location. Note that this function is NOT thread-safe. So unless datalist can be protected from any modifications during invocation of this function, it should not be called.
-- dataset_location : 	the location identifying the dataset.
-- func : 	the function to call for each data element.
-- user_data : 	user data to pass to the function.
-- GDataForeachFunc ()

-- void        (*GDataForeachFunc)             (GQuark key_id,
--                                              gpointer data,
--                                              gpointer user_data);

-- Specifies the type of function passed to g_dataset_foreach(). It is called with each GQuark id and associated data element, together with the user_data parameter supplied to g_dataset_foreach().
-- key_id : 	the GQuark id to identifying the data element.
-- data : 	the data element.
-- user_data : 	user data passed to g_dataset_foreach().
-- g_dataset_destroy ()

-- void        g_dataset_destroy               (gconstpointer dataset_location);

-- Destroys the dataset, freeing all memory allocated, and calling any destroy functions set for data elements.
-- dataset_location : 	the location identifying the dataset.
end
	
