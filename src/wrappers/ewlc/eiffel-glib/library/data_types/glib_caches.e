note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_CACHES
-- 	Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Caches

-- Caches %GÅ‚Äî%@ caches allow sharing of complex data structures to save resources.
	
-- Synopsis

-- #include <glib.h>


--             GCache;
-- GCache*     g_cache_new                     (GCacheNewFunc value_new_func,
--                                              GCacheDestroyFunc value_destroy_func,
--                                              GCacheDupFunc key_dup_func,
--                                              GCacheDestroyFunc key_destroy_func,
--                                              GHashFunc hash_key_func,
--                                              GHashFunc hash_value_func,
--                                              GEqualFunc key_equal_func);
-- gpointer    g_cache_insert                  (GCache *cache,
--                                              gpointer key);
-- void        g_cache_remove                  (GCache *cache,
--                                              gconstpointer value);
-- void        g_cache_destroy                 (GCache *cache);

-- void        g_cache_key_foreach             (GCache *cache,
--                                              GHFunc func,
--                                              gpointer user_data);
-- void        g_cache_value_foreach           (GCache *cache,
--                                              GHFunc func,
--                                              gpointer user_data);

-- void        (*GCacheDestroyFunc)            (gpointer value);
-- gpointer    (*GCacheDupFunc)                (gpointer value);
-- gpointer    (*GCacheNewFunc)                (gpointer key);

-- Description

-- A GCache allows sharing of complex data structures, in order to save system resources.

-- GTK+ uses caches for GtkStyles and GdkGCs. These consume a lot of resources, so a GCache is used to see if a GtkStyle or GdkGC with the required properties already exists. If it does, then the existing object is used instead of creating a new one.

-- GCache uses keys and values. A GCache key describes the properties of a particular resource. A GCache value is the actual resource.
-- Details
-- GCache

-- typedef struct _GCache GCache;

-- The GCache struct is an opaque data structure containing information about a GCache. It should only be accessed via the following functions.
-- g_cache_new ()

-- GCache*     g_cache_new                     (GCacheNewFunc value_new_func,
--                                              GCacheDestroyFunc value_destroy_func,
--                                              GCacheDupFunc key_dup_func,
--                                              GCacheDestroyFunc key_destroy_func,
--                                              GHashFunc hash_key_func,
--                                              GHashFunc hash_value_func,
--                                              GEqualFunc key_equal_func);

-- Creates a new GCache.
-- value_new_func : 	a function to create a new object given a key. This is called by g_cache_insert() if an object with the given key does not already exist.
-- value_destroy_func : 	a function to destroy an object. It is called by g_cache_remove() when the object is no longer needed (i.e. its reference count drops to 0).
-- key_dup_func : 	a function to copy a key. It is called by g_cache_insert() if the key does not already exist in the GCache.
-- key_destroy_func : 	a function to destroy a key. It is called by g_cache_remove() when the object is no longer needed (i.e. its reference count drops to 0).
-- hash_key_func : 	a function to create a hash value from a key.
-- hash_value_func : 	a function to create a hash value from a value.
-- key_equal_func : 	a function to compare two keys. It should return TRUE if the two keys are equivalent.
-- Returns : 	a new GCache.
-- g_cache_insert ()

-- gpointer    g_cache_insert                  (GCache *cache,
--                                              gpointer key);

-- Gets the value corresponding to the given key, creating it if necessary. It first checks if the value already exists in the GCache, by using the key_equal_func function passed to g_cache_new(). If it does already exist it is returned, and its reference count is increased by one. If the value does not currently exist, if is created by calling the value_new_func. The key is duplicated by calling key_dup_func and the duplicated key and value are inserted into the GCache.
-- cache : 	a GCache.
-- key : 	a key describing a GCache object.
-- Returns : 	a pointer to a GCache value.
-- g_cache_remove ()

-- void        g_cache_remove                  (GCache *cache,
--                                              gconstpointer value);

-- Decreases the reference count of the given value. If it drops to 0 then the value and its corresponding key are destroyed, using the value_destroy_func and key_destroy_func passed to g_cache_new().
-- cache : 	a GCache.
-- value : 	the value to remove.
-- g_cache_destroy ()

-- void        g_cache_destroy                 (GCache *cache);

-- Frees the memory allocated for the GCache.

-- Note that it does not destroy the keys and values which were contained in the GCache.
-- cache : 	a GCache.
-- g_cache_key_foreach ()

-- void        g_cache_key_foreach             (GCache *cache,
--                                              GHFunc func,
--                                              gpointer user_data);

-- Calls the given function for each of the keys in the GCache.
-- cache : 	a GCache.
-- func : 	the function to call with each GCache key.
-- user_data : 	user data to pass to the function.
-- g_cache_value_foreach ()

-- void        g_cache_value_foreach           (GCache *cache,
--                                              GHFunc func,
--                                              gpointer user_data);

-- Calls the given function for each of the values in the GCache.
-- cache : 	a GCache.
-- func : 	the function to call with each GCache value.
-- user_data : 	user data to pass to the function.
-- GCacheDestroyFunc ()

-- void        (*GCacheDestroyFunc)            (gpointer value);

-- Specifies the type of the value_destroy_func and key_destroy_func functions passed to g_cache_new(). The functions are passed a pointer to the GCache key or GCache value and should free any memory and other resources associated with it.
-- value : 	the GCache value to destroy.
-- GCacheDupFunc ()

-- gpointer    (*GCacheDupFunc)                (gpointer value);

-- Specifies the type of the key_dup_func function passed to g_cache_new(). The function is passed a key (not a value as the prototype implies) and should return a duplicate of the key.
-- value : 	the GCache key to destroy (not a GCache value as it seems).
-- Returns : 	a copy of the GCache key.
-- GCacheNewFunc ()

-- gpointer    (*GCacheNewFunc)                (gpointer key);

-- Specifies the type of the value_new_func function passed to g_cache_new(). It is passed a GCache key and should create the value corresponding to the key.
-- key : 	a GCache key.
-- Returns : 	a new GCache value corresponding to the key.
end
