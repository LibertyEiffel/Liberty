note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_HASH_TABLE_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	g_hash_table_new (an_hash_func, a_key_equal_func: POINTER): POINTER is
			-- GHashTable* g_hash_table_new (GHashFunc hash_func,
			-- GEqualFunc key_equal_func);
		external "C use <glib.h>"
		end
	

	g_hash_table_new_full (a_hash_func, a_key_equal_func, a_key_destroy_func, a_value_destroy_func: POINTER): POINTER is
			-- GHashTable* g_hash_table_new_full (GHashFunc hash_func,
			-- GEqualFunc key_equal_func, GDestroyNotify
			-- key_destroy_func, GDestroyNotify value_destroy_func);
		external "C use <glib.h>"
		end
	
	
	-- guint (*GHashFunc) (gconstpointer key);

	-- gboolean (*GEqualFunc) (gconstpointer a, gconstpointer b);

	g_hash_table_insert (an_hash_table, a_key, a_value: POINTER) is
			-- void g_hash_table_insert (GHashTable *hash_table, gpointer key, gpointer value);
		external "C use <glib.h>"
		end
	
	
	g_hash_table_replace (a_hash_table, a_key, a_value: POINTER) is
			-- void g_hash_table_replace (GHashTable *hash_table, gpointer key, gpointer value);
		external "C use <glib.h>"
		end
	

	g_hash_table_size (an_hash_table: POINTER): INTEGER is
			-- guint g_hash_table_size (GHashTable *hash_table);
			-- TODO: Result should be NATURAL
		external "C use <glib.h>"
		end
	

	g_hash_table_lookup (an_hash_table, a_key: POINTER): POINTER is
			-- gpointer g_hash_table_lookup (GHashTable *hash_table, gconstpointer key);
		external "C use <glib.h>"
		end
	

	g_hash_table_lookup_extended (an_hash_table, a_lookup_key, an_orig_key, a_value: POINTER): INTEGER is
			-- gboolean g_hash_table_lookup_extended (GHashTable
			-- *hash_table, gconstpointer lookup_key, gpointer *orig_key,
			-- gpointer *value);
		external "C use <glib.h>"
		end
	
	
	g_hash_table_foreach (an_hash_table, a_func, a_user_data: POINTER) is
			-- void g_hash_table_foreach (GHashTable *hash_table, GHFunc
			-- func, gpointer user_data);
		external "C use <glib.h>"
		end
	

	g_hash_table_find (an_hash_table, a_predicate, a_user_data: POINTER): POINTER is
			-- gpointer g_hash_table_find (GHashTable *hash_table,
			-- GHRFunc predicate, gpointer user_data);
		external "C use <glib.h>"
		end
	
	-- void (*GHFunc) (gpointer key, gpointer value, gpointer user_data);

	g_hash_table_remove (a_hash_table, a_key: POINTER): INTEGER is
			-- gboolean g_hash_table_remove (GHashTable *hash_table, gconstpointer key);
		external "C use <glib.h>"
		end
	
	g_hash_table_steal (an_hash_table, a_key: POINTER): INTEGER is
			-- gboolean g_hash_table_steal (GHashTable *hash_table, gconstpointer key);
		external "C use <glib.h>"
		end
	
	g_hash_table_foreach_remove (an_hash_table, a_func, a_user_data: POINTER): INTEGER is
			-- guint g_hash_table_foreach_remove (GHashTable *hash_table,
			-- GHRFunc func, gpointer user_data);
			-- TODO: Result should be NATURAL
		external "C use <glib.h>"
		end
	

	g_hash_table_foreach_steal (an_hash_table, a_func, a_user_data: POINTER): INTEGER is
			-- guint g_hash_table_foreach_steal (GHashTable *hash_table,
			-- GHRFunc func, gpointer user_data);
			-- TODO: Result should be NATURAL
		external "C use <glib.h>"
		end
	

	-- gboolean (*GHRFunc) (gpointer key, gpointer value, gpointer user_data);
	
	g_hash_table_destroy (an_hash_table: POINTER) is
			-- void g_hash_table_destroy (GHashTable *hash_table);
		external "C use <glib.h>"
		end
	
	g_direct_equal (v1, v2: POINTER): INTEGER is
			-- gboolean g_direct_equal (gconstpointer v1, gconstpointer v2);
		external "C use <glib.h>"
		end
	
	
	g_direct_hash (v: POINTER): INTEGER is
			-- guint g_direct_hash (gconstpointer v);
			-- TODO: Result should be NATURAL
		external "C use <glib.h>"
		end
	

	g_int_equal (v1, v2: POINTER): INTEGER is
			-- gboolean g_int_equal (gconstpointer v1, gconstpointer v2);
		external "C use <glib.h>"
		end
	

	g_int_hash (v: POINTER): INTEGER is
			-- guint g_int_hash (gconstpointer v);
			-- TODO: Result should be NATURAL
		external "C use <glib.h>"
		end
	
	
	g_str_equal (v1, v2: POINTE): INTEGER is
			-- gboolean g_str_equal (gconstpointer v1, gconstpointer v2);
		external "C use <glib.h>"
		end
	

	g_str_hash (v: POINTE): INTEGER is
			-- guint g_str_hash (gconstpointer v);
			-- TODO: Result should be NATURAL
		external "C use <glib.h>"
		end
	
end
