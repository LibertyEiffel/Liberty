indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_BALANCED_BINARY_TREES
-- 	Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Balanced Binary Trees

-- Balanced Binary Trees %GÅ‚Äî%@ a sorted collection of key/value pairs optimized for searching and traversing in order.
	
-- Synopsis

-- #include <glib.h>


--             GTree;
-- GTree*      g_tree_new                      (GCompareFunc key_compare_func);
-- GTree*      g_tree_new_with_data            (GCompareDataFunc key_compare_func,
--                                              gpointer key_compare_data);
-- GTree*      g_tree_new_full                 (GCompareDataFunc key_compare_func,
--                                              gpointer key_compare_data,
--                                              GDestroyNotify key_destroy_func,
--                                              GDestroyNotify value_destroy_func);
-- void        g_tree_insert                   (GTree *tree,
--                                              gpointer key,
--                                              gpointer value);
-- void        g_tree_replace                  (GTree *tree,
--                                              gpointer key,
--                                              gpointer value);
-- gint        g_tree_nnodes                   (GTree *tree);
-- gint        g_tree_height                   (GTree *tree);
-- gpointer    g_tree_lookup                   (GTree *tree,
--                                              gconstpointer key);
-- gboolean    g_tree_lookup_extended          (GTree *tree,
--                                              gconstpointer lookup_key,
--                                              gpointer *orig_key,
--                                              gpointer *value);
-- void        g_tree_foreach                  (GTree *tree,
--                                              GTraverseFunc func,
--                                              gpointer user_data);
-- void        g_tree_traverse                 (GTree *tree,
--                                              GTraverseFunc traverse_func,
--                                              GTraverseType traverse_type,
--                                              gpointer user_data);
-- gboolean    (*GTraverseFunc)                (gpointer key,
--                                              gpointer value,
--                                              gpointer data);
-- enum        GTraverseType;
-- gpointer    g_tree_search                   (GTree *tree,
--                                              GCompareFunc search_func,
--                                              gconstpointer user_data);
-- gboolean    g_tree_remove                   (GTree *tree,
--                                              gconstpointer key);
-- gboolean    g_tree_steal                    (GTree *tree,
--                                              gconstpointer key);
-- void        g_tree_destroy                  (GTree *tree);

-- Description

-- The GTree structure and its associated functions provide a sorted collection of key/value pairs optimized for searching and traversing in order.

-- To create a new GTree use g_tree_new().

-- To insert a key/value pair into a GTree use g_tree_insert().

-- To lookup the value corresponding to a given key, use g_tree_lookup() and g_tree_lookup_extended().

-- To find out the number of nodes in a GTree, use g_tree_nnodes(). To get the height of a GTree, use g_tree_height().

-- To traverse a GTree, calling a function for each node visited in the traversal, use g_tree_foreach().

-- To remove a key/value pair use g_tree_remove().

-- To destroy a GTree, use g_tree_destroy().
-- Details
-- GTree

-- typedef struct _GTree GTree;

-- The GTree struct is an opaque data structure representing a Balanced Binary Tree. It should be accessed only by using the following functions.
-- g_tree_new ()

-- GTree*      g_tree_new                      (GCompareFunc key_compare_func);

-- Creates a new GTree.

-- key_compare_func : 	the function used to order the nodes in the GTree. It should return values similar to the standard strcmp() function - 0 if the two arguments are equal, a negative value if the first argument comes before the second, or a positive value if the first argument comes after the second.
-- Returns : 	a new GTree.
-- g_tree_new_with_data ()

-- GTree*      g_tree_new_with_data            (GCompareDataFunc key_compare_func,
--                                              gpointer key_compare_data);

-- Creates a new GTree with a comparison function that accepts user data. See g_tree_new() for more details.

-- key_compare_func : 	qsort()-style comparison function.
-- key_compare_data : 	data to pass to comparison function.
-- Returns : 	a new GTree.
-- g_tree_new_full ()

-- GTree*      g_tree_new_full                 (GCompareDataFunc key_compare_func,
--                                              gpointer key_compare_data,
--                                              GDestroyNotify key_destroy_func,
--                                              GDestroyNotify value_destroy_func);

-- Creates a new GTree like g_tree_new() and allows to specify functions to free the memory allocated for the key and value that get called when removing the entry from the GTree.

-- key_compare_func : 	qsort()-style comparison function.
-- key_compare_data : 	data to pass to comparison function.
-- key_destroy_func : 	a function to free the memory allocated for the key used when removing the entry from the GTree or NULL if you don't want to supply such a function.
-- value_destroy_func : 	a function to free the memory allocated for the value used when removing the entry from the GTree or NULL if you don't want to supply such a function.
-- Returns : 	a new GTree.
-- g_tree_insert ()

-- void        g_tree_insert                   (GTree *tree,
--                                              gpointer key,
--                                              gpointer value);

-- Inserts a key/value pair into a GTree. If the given key already exists in the GTree its corresponding value is set to the new value. If you supplied a value_destroy_func when creating the GTree, the old value is freed using that function. If you supplied a key_destroy_func when creating the GTree, the passed key is freed using that function.

-- The tree is automatically 'balanced' as new key/value pairs are added, so that the distance from the root to every leaf is as small as possible.

-- tree : 	a GTree.
-- key : 	the key to insert.
-- value : 	the value corresponding to the key.
-- g_tree_replace ()

-- void        g_tree_replace                  (GTree *tree,
--                                              gpointer key,
--                                              gpointer value);

-- Inserts a new key and value into a GTree similar to g_tree_insert(). The difference is that if the key already exists in the GTree, it gets replaced by the new key. If you supplied a value_destroy_func when creating the GTree, the old value is freed using that function. If you supplied a key_destroy_func when creating the GTree, the old key is freed using that function.

-- The tree is automatically 'balanced' as new key/value pairs are added, so that the distance from the root to every leaf is as small as possible.

-- tree : 	a GTree.
-- key : 	the key to insert.
-- value : 	the value corresponding to the key.
-- g_tree_nnodes ()

-- gint        g_tree_nnodes                   (GTree *tree);

-- Gets the number of nodes in a GTree.

-- tree : 	a GTree.
-- Returns : 	the number of nodes in the GTree.
-- g_tree_height ()

-- gint        g_tree_height                   (GTree *tree);

-- Gets the height of a GTree.

-- If the GTree contains no nodes, the height is 0. If the GTree contains only one root node the height is 1. If the root node has children the height is 2, etc.

-- tree : 	a GTree.
-- Returns : 	the height of the GTree.
-- g_tree_lookup ()

-- gpointer    g_tree_lookup                   (GTree *tree,
--                                              gconstpointer key);

-- Gets the value corresponding to the given key. Since a GTree is automatically balanced as key/value pairs are added, key lookup is very fast.

-- tree : 	a GTree.
-- key : 	the key to look up.
-- Returns : 	the value corresponding to the key, or NULL if the key was not found.
-- g_tree_lookup_extended ()

-- gboolean    g_tree_lookup_extended          (GTree *tree,
--                                              gconstpointer lookup_key,
--                                              gpointer *orig_key,
--                                              gpointer *value);

-- Looks up a key in the GTree, returning the original key and the associated value and a gboolean which is TRUE if the key was found. This is useful if you need to free the memory allocated for the original key, for example before calling g_tree_remove().
-- tree : 	a GTree.
-- lookup_key : 	the key to look up.
-- orig_key : 	returns the original key.
-- value : 	returns the value associated with the key.
-- Returns : 	TRUE if the key was found in the GTree.
-- g_tree_foreach ()

-- void        g_tree_foreach                  (GTree *tree,
--                                              GTraverseFunc func,
--                                              gpointer user_data);

-- Calls the given function for each of the key/value pairs in the GTree. The function is passed the key and value of each pair, and the given data parameter. The tree is traversed in sorted order.

-- The tree may not be modified while iterating over it (you can't add/remove items). To remove all items matching a predicate, you need to add each item to a list in your GTraverseFunc as you walk over the tree, then walk the list and remove each item.

-- tree : 	a GTree.
-- func : 	the function to call for each node visited. If this function returns TRUE, the traversal is stopped.
-- user_data : 	user data to pass to the function.
-- g_tree_traverse ()

-- void        g_tree_traverse                 (GTree *tree,
--                                              GTraverseFunc traverse_func,
--                                              GTraverseType traverse_type,
--                                              gpointer user_data);

-- Warning

-- g_tree_traverse is deprecated and should not be used in newly-written code. The order of a balanced tree is somewhat arbitrary. If you just want to visit all nodes in sorted order, use g_tree_foreach() instead. If you really need to visit nodes in a different order, consider using an N-ary Tree.

-- Calls the given function for each node in the GTree.

-- tree : 	a GTree.
-- traverse_func : 	the function to call for each node visited. If this function returns TRUE, the traversal is stopped.
-- traverse_type : 	the order in which nodes are visited, one of G_IN_ORDER, G_PRE_ORDER and G_POST_ORDER.
-- user_data : 	user data to pass to the function.
-- GTraverseFunc ()

-- gboolean    (*GTraverseFunc)                (gpointer key,
--                                              gpointer value,
--                                              gpointer data);

-- Specifies the type of function passed to g_tree_traverse(). It is passed the key and value of each node, together with the user_data parameter passed to g_tree_traverse(). If the function returns TRUE, the traversal is stopped.
-- key : 	a key of a GTree node.
-- value : 	the value corresponding to the key.
-- data : 	user data passed to g_tree_traverse().
-- Returns : 	TRUE to stop the traversal.
-- enum GTraverseType

-- typedef enum
-- {
--   G_IN_ORDER,
--   G_PRE_ORDER,
--   G_POST_ORDER,
--   G_LEVEL_ORDER
-- } GTraverseType;

-- Specifies the type of traveral performed by g_tree_traverse(), g_node_traverse() and g_node_find().
-- G_IN_ORDER 	vists a node's left child first, then the node itself, then its right child. This is the one to use if you want the output sorted according to the compare function.
-- G_PRE_ORDER 	visits a node, then its children.
-- G_POST_ORDER 	visits the node's children, then the node itself.
-- G_LEVEL_ORDER 	is not implemented for Balanced Binary Trees. For N-ary Trees, it vists the root node first, then its children, then its grandchildren, and so on. Note that this is less efficient than the other orders.
-- g_tree_search ()

-- gpointer    g_tree_search                   (GTree *tree,
--                                              GCompareFunc search_func,
--                                              gconstpointer user_data);

-- Searches a GTree using search_func.

-- The search_func is called with a pointer to the key of a key/value pair in the tree, and the passed in user_data. If search_func returns 0 for a key/value pair, then g_tree_search_func() will return the value of that pair. If search_func returns -1, searching will proceed among the key/value pairs that have a smaller key; if search_func returns 1, searching will proceed among the key/value pairs that have a larger key.

-- tree : 	a GTree.
-- search_func : 	a function used to search the GTree.
-- user_data : 	the data passed as the second argument to the search_func function.
-- Returns : 	the value corresponding to the found key, or NULL if the key was not found.
-- g_tree_remove ()

-- gboolean    g_tree_remove                   (GTree *tree,
--                                              gconstpointer key);

-- Removes a key/value pair from a GTree.

-- If the GTree was created using g_tree_new_full(), the key and value are freed using the supplied destroy functions, otherwise you have to make sure that any dynamically allocated values are freed yourself. If the key does not exist in the GTree, the function does nothing.

-- tree : 	a GTree.
-- key : 	the key to remove.
-- Returns : 	TRUE if the key was found (prior to 2.8, this function returned nothing)
-- g_tree_steal ()

-- gboolean    g_tree_steal                    (GTree *tree,
--                                              gconstpointer key);

-- Removes a key and its associated value from a GTree without calling the key and value destroy functions.

-- If the key does not exist in the GTree, the function does nothing.

-- tree : 	a GTree.
-- key : 	the key to remove.
-- Returns : 	TRUE if the key was found (prior to 2.8, this function returned nothing)
-- g_tree_destroy ()

-- void        g_tree_destroy                  (GTree *tree);

-- Destroys the GTree. If keys and/or values are dynamically allocated, you should either free them first or create the GTree using g_tree_new_full(). In the latter case the destroy functions you supplied will be called on all keys and values before destroying the GTree.

-- tree : 	a GTree.
end
