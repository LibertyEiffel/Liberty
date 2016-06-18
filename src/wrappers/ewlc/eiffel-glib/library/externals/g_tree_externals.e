note
	description: "External calls for G_TREE"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_TREE_EXTERNALS

inherit ANY undefine is_equal, copy end


-- feature {} -- External callbacks
-- 	g_tree_low_level_compare: POINTER is
-- 		external "[
-- 					 C macro use "cecil.h"
-- 												 ]"
-- 		end
	
feature {} -- External calls
	g_tree_new (a_key_compare_func: POINTER): POINTER
			-- GTree* g_tree_new (GCompareFunc key_compare_func);
		external "C use <glib.h>"
		end
	
	--g_tree_new_with_data (a_key_compare_data: POINTER): POINTER is
	g_tree_new_with_data (a_key_compare_func,a_key_compare_data: POINTER): POINTER
			-- GTree* g_tree_new_with_data (GCompareDataFunc
			-- key_compare_func, gpointer key_compare_data);
		external "C macro use <glib.h>"
		--alias "g_tree_new_with_data (g_tree_low_level_compare, $a_key_compare_data)"
		end

	g_tree_new_full (a_key_compare_func, a_key_compare_data,	a_key_destroy_func, a_value_destroy_func: POINTER): POINTER
				-- GTree* g_tree_new_full (GCompareDataFunc key_compare_func, gpointer key_compare_data, GDestroyNotify key_destroy_func, GDestroyNotify value_destroy_func);
			external "C use <glib.h>"
			end

	g_tree_insert (a_tree, a_key, a_value: POINTER)
			-- void g_tree_insert (GTree *tree, gpointer key, gpointer value);
		external "C use <glib.h>"
		end
			
	g_tree_replace (a_tree, a_key, a_value: POINTER)
			-- void g_tree_replace (GTree *tree, gpointer key, gpointer value);
		external "C use <glib.h>"
		end
	
	g_tree_nnodes (a_tree: POINTER): INTEGER
			-- gint g_tree_nnodes (GTree *tree);
		external "C use <glib.h>"
		end

	g_tree_height (a_tree: POINTER): INTEGER
			-- gint g_tree_height (GTree *tree);
		external "C use <glib.h>"
		end
	
	g_tree_lookup (a_tree, a_key: POINTER): POINTER
			-- gpointer g_tree_lookup (GTree *tree, gconstpointer key);
		external "C use <glib.h>"
		end

	g_tree_lookup_extended (a_tree, a_lookup_key, an_orig_key, a_value: POINTER): INTEGER
				-- gboolean g_tree_lookup_extended (GTree *tree,
				-- gconstpointer lookup_key, gpointer *orig_key, gpointer
				-- *value);
			external "C use <glib.h>"
			end

	g_tree_foreach (a_tree, a_gtraversefunc, some_data: POINTER)
				-- void g_tree_foreach (GTree *tree, GTraverseFunc func, gpointer user_data);
			external "C use <glib.h>"
			end

	g_tree_traverse (a_tree, a_traverse_func: POINTER; a_traverse_type: INTEGER; some_data: POINTER)
			-- void g_tree_traverse (GTree *tree, GTraverseFunc
			-- traverse_func, GTraverseType traverse_type, gpointer
			-- user_data);
		external "C use <glib.h>"
		end

	-- gboolean (*GTraverseFunc) (gpointer key, gpointer value, gpointer data);
			
	-- TODO: enum GTraverseType is

	g_tree_search (a_tree, a_search_func, some_data: POINTER): INTEGER
			-- gpointer g_tree_search (GTree *tree, GCompareFunc
			-- search_func, gconstpointer user_data);
		external "C use <glib.h>"
		end

	g_tree_remove (a_tree, a_key: POINTER): INTEGER
				-- gboolean g_tree_remove (GTree *tree, gconstpointer key);
		external "C use <glib.h>"
		end

	g_tree_steal (a_tree, a_key: POINTER): INTEGER
			-- gboolean g_tree_steal (GTree *tree, gconstpointer key);
		external "C use <glib.h>"
		end

	g_tree_destroy (a_tree: POINTER)
			-- void g_tree_destroy (GTree *tree);
		external "C use <glib.h>"
		end


feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GTree)"
		end
end
