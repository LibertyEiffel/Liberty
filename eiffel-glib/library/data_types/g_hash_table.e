indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_HASH_TABLE
	-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Hash Tables

-- Hash Tables %GÅ‚Äî%@ associations between keys and values so that given a key the value can be found quickly.
	
-- Synopsis

-- #include <glib.h>


--             GHashTable;
-- GHashTable* g_hash_table_new                (GHashFunc hash_func,
--                                              GEqualFunc key_equal_func);
-- GHashTable* g_hash_table_new_full           (GHashFunc hash_func,
--                                              GEqualFunc key_equal_func,
--                                              GDestroyNotify key_destroy_func,
--                                              GDestroyNotify value_destroy_func);
-- guint       (*GHashFunc)                    (gconstpointer key);
-- gboolean    (*GEqualFunc)                   (gconstpointer a,
--                                              gconstpointer b);
-- void        g_hash_table_insert             (GHashTable *hash_table,
--                                              gpointer key,
--                                              gpointer value);
-- void        g_hash_table_replace            (GHashTable *hash_table,
--                                              gpointer key,
--                                              gpointer value);
-- guint       g_hash_table_size               (GHashTable *hash_table);
-- gpointer    g_hash_table_lookup             (GHashTable *hash_table,
--                                              gconstpointer key);
-- gboolean    g_hash_table_lookup_extended    (GHashTable *hash_table,
--                                              gconstpointer lookup_key,
--                                              gpointer *orig_key,
--                                              gpointer *value);
-- void        g_hash_table_foreach            (GHashTable *hash_table,
--                                              GHFunc func,
--                                              gpointer user_data);
-- gpointer    g_hash_table_find               (GHashTable *hash_table,
--                                              GHRFunc predicate,
--                                              gpointer user_data);
-- void        (*GHFunc)                       (gpointer key,
--                                              gpointer value,
--                                              gpointer user_data);
-- gboolean    g_hash_table_remove             (GHashTable *hash_table,
--                                              gconstpointer key);
-- gboolean    g_hash_table_steal              (GHashTable *hash_table,
--                                              gconstpointer key);
-- guint       g_hash_table_foreach_remove     (GHashTable *hash_table,
--                                              GHRFunc func,
--                                              gpointer user_data);
-- guint       g_hash_table_foreach_steal      (GHashTable *hash_table,
--                                              GHRFunc func,
--                                              gpointer user_data);
-- gboolean    (*GHRFunc)                      (gpointer key,
--                                              gpointer value,
--                                              gpointer user_data);
-- #define     g_hash_table_freeze             (hash_table)
-- #define     g_hash_table_thaw               (hash_table)
-- void        g_hash_table_destroy            (GHashTable *hash_table);

-- gboolean    g_direct_equal                  (gconstpointer v1,
--                                              gconstpointer v2);
-- guint       g_direct_hash                   (gconstpointer v);
-- gboolean    g_int_equal                     (gconstpointer v1,
--                                              gconstpointer v2);
-- guint       g_int_hash                      (gconstpointer v);
-- gboolean    g_str_equal                     (gconstpointer v1,
--                                              gconstpointer v2);
-- guint       g_str_hash                      (gconstpointer v);

-- Description

-- A GHashTable provides associations between keys and values which is optimized so that given a key, the associated value can be found very quickly.

-- Note that neither keys nor values are copied when inserted into the GHashTable, so they must exist for the lifetime of the GHashTable. This means that the use of static strings is OK, but temporary strings (i.e. those created in buffers and those returned by GTK+ widgets) should be copied with g_strdup() before being inserted.

-- If keys or values are dynamically allocated, you must be careful to ensure that they are freed when they are removed from the GHashTable, and also when they are overwritten by new insertions into the GHashTable. It is also not advisable to mix static strings and dynamically-allocated strings in a GHashTable, because it then becomes difficult to determine whether the string should be freed.

-- To create a GHashTable, use g_hash_table_new().

-- To insert a key and value into a GHashTable, use g_hash_table_insert().

-- To lookup a value corresponding to a given key, use g_hash_table_lookup() and g_hash_table_lookup_extended().

-- To remove a key and value, use g_hash_table_remove().

-- To call a function for each key and value pair use g_hash_table_foreach().

-- To destroy a GHashTable use g_hash_table_destroy().
-- Details
-- GHashTable

-- typedef struct _GHashTable GHashTable;

-- The GHashTable struct is an opaque data structure to represent a Hash Table. It should only be accessed via the following functions.
-- g_hash_table_new ()

-- GHashTable* g_hash_table_new                (GHashFunc hash_func,
--                                              GEqualFunc key_equal_func);

-- Creates a new GHashTable.

-- hash_func : 	a function to create a hash value from a key. Hash values are used to determine where keys are stored within the GHashTable data structure. The g_direct_hash(), g_int_hash() and g_str_hash() functions are provided for some common types of keys. If hash_func is NULL, g_direct_hash() is used.
-- key_equal_func : 	a function to check two keys for equality. This is used when looking up keys in the GHashTable. The g_direct_equal(), g_int_equal() and g_str_equal() functions are provided for the most common types of keys. If key_equal_func is NULL, keys are compared directly in a similar fashion to g_direct_equal(), but without the overhead of a function call.
-- Returns : 	a new GHashTable.
-- g_hash_table_new_full ()

-- GHashTable* g_hash_table_new_full           (GHashFunc hash_func,
--                                              GEqualFunc key_equal_func,
--                                              GDestroyNotify key_destroy_func,
--                                              GDestroyNotify value_destroy_func);

-- Creates a new GHashTable like g_hash_table_new() and allows to specify functions to free the memory allocated for the key and value that get called when removing the entry from the GHashTable.

-- hash_func : 	a function to create a hash value from a key.
-- key_equal_func : 	a function to check two keys for equality.
-- key_destroy_func : 	a function to free the memory allocated for the key used when removing the entry from the GHashTable or NULL if you don't want to supply such a function.
-- value_destroy_func : 	a function to free the memory allocated for the value used when removing the entry from the GHashTable or NULL if you don't want to supply such a function.
-- Returns : 	a new GHashTable.
-- GHashFunc ()

-- guint       (*GHashFunc)                    (gconstpointer key);

-- Specifies the type of the hash function which is passed to g_hash_table_new() when a GHashTable is created.

-- The function is passed a key and should return a guint hash value. The functions g_direct_hash(), g_int_hash() and g_str_hash() provide hash functions which can be used when the key is a gpointer, gint, and gchar* respectively.

-- FIXME: Need more here. The hash values should be evenly distributed over a fairly large range? The modulus is taken with the hash table size (a prime number) to find the 'bucket' to place each key into. The function should also be very fast, since it is called for each key lookup.
-- key : 	a key.
-- Returns : 	the hash value corresponding to the key.
-- GEqualFunc ()

-- gboolean    (*GEqualFunc)                   (gconstpointer a,
--                                              gconstpointer b);

-- Specifies the type of a function used to test two values for equality. The function should return TRUE if both values are equal and FALSE otherwise.
-- a : 	a value.
-- b : 	a value to compare with.
-- Returns : 	TRUE if a = b; FALSE otherwise.
-- g_hash_table_insert ()

-- void        g_hash_table_insert             (GHashTable *hash_table,
--                                              gpointer key,
--                                              gpointer value);

-- Inserts a new key and value into a GHashTable.

-- If the key already exists in the GHashTable its current value is replaced with the new value. If you supplied a value_destroy_func when creating the GHashTable, the old value is freed using that function. If you supplied a key_destroy_func when creating the GHashTable, the passed key is freed using that function.

-- hash_table : 	a GHashTable.
-- key : 	a key to insert.
-- value : 	the value to associate with the key.
-- g_hash_table_replace ()

-- void        g_hash_table_replace            (GHashTable *hash_table,
--                                              gpointer key,
--                                              gpointer value);

-- Inserts a new key and value into a GHashTable similar to g_hash_table_insert(). The difference is that if the key already exists in the GHashTable, it gets replaced by the new key. If you supplied a value_destroy_func when creating the GHashTable, the old value is freed using that function. If you supplied a key_destroy_func when creating the GHashTable, the old key is freed using that function.

-- hash_table : 	a GHashTable.
-- key : 	a key to insert.
-- value : 	the value to associate with the key.
-- g_hash_table_size ()

-- guint       g_hash_table_size               (GHashTable *hash_table);

-- Returns the number of elements contained in the GHashTable.

-- hash_table : 	a GHashTable.
-- Returns : 	the number of key/value pairs in the GHashTable.
-- g_hash_table_lookup ()

-- gpointer    g_hash_table_lookup             (GHashTable *hash_table,
--                                              gconstpointer key);

-- Looks up a key in a GHashTable. Note that this function cannot distinguish between a key that is not present and one which is present and has the value NULL. If you need this distinction, use g_hash_table_lookup_extended().

-- hash_table : 	a GHashTable.
-- key : 	the key to look up.
-- Returns : 	the associated value, or NULL if the key is not found.
-- g_hash_table_lookup_extended ()

-- gboolean    g_hash_table_lookup_extended    (GHashTable *hash_table,
--                                              gconstpointer lookup_key,
--                                              gpointer *orig_key,
--                                              gpointer *value);

-- Looks up a key in the GHashTable, returning the original key and the associated value and a gboolean which is TRUE if the key was found. This is useful if you need to free the memory allocated for the original key, for example before calling g_hash_table_remove().

-- hash_table : 	a GHashTable.
-- lookup_key : 	the key to look up.
-- orig_key : 	returns the original key.
-- value : 	returns the value associated with the key.
-- Returns : 	TRUE if the key was found in the GHashTable.
-- g_hash_table_foreach ()

-- void        g_hash_table_foreach            (GHashTable *hash_table,
--                                              GHFunc func,
--                                              gpointer user_data);

-- Calls the given function for each of the key/value pairs in the GHashTable. The function is passed the key and value of each pair, and the given user_data parameter. The hash table may not be modified while iterating over it (you can't add/remove items). To remove all items matching a predicate, use g_hash_table_foreach_remove().

-- hash_table : 	a GHashTable.
-- func : 	the function to call for each key/value pair.
-- user_data : 	user data to pass to the function.
-- g_hash_table_find ()

-- gpointer    g_hash_table_find               (GHashTable *hash_table,
--                                              GHRFunc predicate,
--                                              gpointer user_data);

-- Calls the given function for key/value pairs in the GHashTable until predicate returns TRUE. The function is passed the key and value of each pair, and the given user_data parameter. The hash table may not be modified while iterating over it (you can't add/remove items).

-- hash_table : 	a GHashTable.
-- predicate : 	function to test the key/value pairs for a certain property.
-- user_data : 	user data to pass to the function.
-- Returns : 	The value of the first key/value pair is returned, for which func evaluates to TRUE. If no pair with the requested property is found, NULL is returned.

-- Since 2.4
-- GHFunc ()

-- void        (*GHFunc)                       (gpointer key,
--                                              gpointer value,
--                                              gpointer user_data);

-- Specifies the type of the function passed to g_hash_table_foreach(). It is called with each key/value pair, together with the user_data parameter which is passed to g_hash_table_foreach().
-- key : 	a key.
-- value : 	the value corresponding to the key.
-- user_data : 	user data passed to g_hash_table_foreach().
-- g_hash_table_remove ()

-- gboolean    g_hash_table_remove             (GHashTable *hash_table,
--                                              gconstpointer key);

-- Removes a key and its associated value from a GHashTable.

-- If the GHashTable was created using g_hash_table_new_full(), the key and value are freed using the supplied destroy functions, otherwise you have to make sure that any dynamically allocated values are freed yourself.

-- hash_table : 	a GHashTable.
-- key : 	the key to remove.
-- Returns : 	TRUE if the key was found and removed from the GHashTable.
-- g_hash_table_steal ()

-- gboolean    g_hash_table_steal              (GHashTable *hash_table,
--                                              gconstpointer key);

-- Removes a key and its associated value from a GHashTable without calling the key and value destroy functions.

-- hash_table : 	a GHashTable.
-- key : 	the key to remove.
-- Returns : 	TRUE if the key was found and removed from the GHashTable.
-- g_hash_table_foreach_remove ()

-- guint       g_hash_table_foreach_remove     (GHashTable *hash_table,
--                                              GHRFunc func,
--                                              gpointer user_data);

-- Calls the given function for each key/value pair in the GHashTable. If the function returns TRUE, then the key/value pair is removed from the GHashTable. If you supplied key or value destroy functions when creating the GHashTable, they are used to free the memory allocated for the removed keys and values.

-- hash_table : 	a GHashTable.
-- func : 	the function to call for each key/value pair.
-- user_data : 	user data to pass to the function.
-- Returns : 	the number of key/value pairs removed.
-- g_hash_table_foreach_steal ()

-- guint       g_hash_table_foreach_steal      (GHashTable *hash_table,
--                                              GHRFunc func,
--                                              gpointer user_data);

-- Calls the given function for each key/value pair in the GHashTable. If the function returns TRUE, then the key/value pair is removed from the GHashTable, but no key or value destroy functions are called.

-- hash_table : 	a GHashTable.
-- func : 	the function to call for each key/value pair.
-- user_data : 	user data to pass to the function.
-- Returns : 	the number of key/value pairs removed.
-- GHRFunc ()

-- gboolean    (*GHRFunc)                      (gpointer key,
--                                              gpointer value,
--                                              gpointer user_data);

-- Specifies the type of the function passed to g_hash_table_foreach_remove(). It is called with each key/value pair, together with the user_data parameter passed to g_hash_table_foreach_remove(). It should return TRUE if the key/value pair should be removed from the GHashTable.
-- key : 	a key.
-- value : 	the value associated with the key.
-- user_data : 	user data passed to g_hash_table_remove().
-- Returns : 	TRUE if the key/value pair should be removed from the GHashTable.
-- g_hash_table_freeze()

-- #define     g_hash_table_freeze(hash_table)

-- Warning

-- g_hash_table_freeze is deprecated and should not be used in newly-written code.

-- This function is deprecated and will be removed in the next major release of GLib. It does nothing.
-- hash_table : 	a GHashTable
-- g_hash_table_thaw()

-- #define     g_hash_table_thaw(hash_table)

-- Warning

-- g_hash_table_thaw is deprecated and should not be used in newly-written code.

-- This function is deprecated and will be removed in the next major release of GLib. It does nothing.
-- hash_table : 	a GHashTable
-- g_hash_table_destroy ()

-- void        g_hash_table_destroy            (GHashTable *hash_table);

-- Destroys the GHashTable. If keys and/or values are dynamically allocated, you should either free them first or create the GHashTable using g_hash_table_new_full(). In the latter case the destroy functions you supplied will be called on all keys and values before destroying the GHashTable.

-- hash_table : 	a GHashTable.
-- g_direct_equal ()

-- gboolean    g_direct_equal                  (gconstpointer v1,
--                                              gconstpointer v2);

-- Compares two gpointer arguments and returns TRUE if they are equal. It can be passed to g_hash_table_new() as the key_equal_func parameter, when using pointers as keys in a GHashTable.

-- v1 : 	a key.
-- v2 : 	a key to compare with v1.
-- Returns : 	TRUE if the two keys match.
-- g_direct_hash ()

-- guint       g_direct_hash                   (gconstpointer v);

-- Converts a gpointer to a hash value. It can be passed to g_hash_table_new() as the hash_func parameter, when using pointers as keys in a GHashTable.

-- v : 	a gpointer key
-- Returns : 	a hash value corresponding to the key.
-- g_int_equal ()

-- gboolean    g_int_equal                     (gconstpointer v1,
--                                              gconstpointer v2);

-- Compares the two gint values being pointed to and returns TRUE if they are equal. It can be passed to g_hash_table_new() as the key_equal_func parameter, when using pointers to integers as keys in a GHashTable.

-- v1 : 	a pointer to a gint key.
-- v2 : 	a pointer to a gint key to compare with v1.
-- Returns : 	TRUE if the two keys match.
-- g_int_hash ()

-- guint       g_int_hash                      (gconstpointer v);

-- Converts a pointer to a gint to a hash value. It can be passed to g_hash_table_new() as the hash_func parameter, when using pointers to integers values as keys in a GHashTable.

-- v : 	a pointer to a gint key
-- Returns : 	a hash value corresponding to the key.
-- g_str_equal ()

-- gboolean    g_str_equal                     (gconstpointer v1,
--                                              gconstpointer v2);

-- Compares two strings and returns TRUE if they are equal. It can be passed to g_hash_table_new() as the key_equal_func parameter, when using strings as keys in a GHashTable.

-- v1 : 	a key.
-- v2 : 	a key to compare with v1.
-- Returns : 	TRUE if the two keys match.
-- g_str_hash ()

-- guint       g_str_hash                      (gconstpointer v);

-- Converts a string to a hash value. It can be passed to g_hash_table_new() as the hash_func parameter, when using strings as keys in a GHashTable.

-- v : 	a string key.
-- Returns : 	a hash value corresponding to the key.
end
