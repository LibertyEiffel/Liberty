indexing
	description: "Balanced Binary Trees, a sorted collection of key/value pairs optimized for searching and traversing in order."
	copyright: "[
					Copyright (C) 2005,2007 Paolo Redaelli, Glib team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hopeOA that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"
   license: "LGPL v2 or later"

class G_TREE [KEY->COMPARABLE_SHARED_C_STRUCT, VALUE->SHARED_C_STRUCT]
	-- The GTree structure and its associated functions provide a
	-- sorted collection of key/value pairs optimized for searching and
	-- traversing in order.

	-- To create a new GTree use make.
	
	-- To insert a key/value pair into a GTree use `insert_value'.

	-- To lookup the value corresponding to a given key, use `lookup' and
	-- `lookup_extended'.
	
	-- To find out the number of nodes in a GTree, use `count'. To get
	-- the height of a GTree, use `height'.
	
	-- To traverse a GTree, calling a function for each node visited in
	-- the traversal, use foreach.

	-- To remove a key/value pair use `remove'.

inherit
	SHARED_C_STRUCT redefine dispose end
	
insert
	G_TREE_EXTERNALS
		--	GLIB_TYPE_CONVERSION_MACROS -- Temporary
	
creation make, from_external_pointer

feature {} -- Creation
	make (a_compare_function: FUNCTION[ANY,TUPLE[COMPARABLE_SHARED_C_STRUCT,COMPARABLE_SHARED_C_STRUCT],INTEGER]) is
			-- Creates a new GTree.

			-- key_compare_func : the function used to order the nodes in
			-- the GTree. It should return values similar to the standard
			-- strcmp() function - 0 if the two arguments are equal, a
			-- negative value if the first argument comes before the
			-- second, or a positive value if the first argument comes
			-- after the second.

			-- Creates a new GTree with a comparison function that
			-- accepts user data. See g_tree_new() for more details.
		
			-- key_compare_func : 	qsort()-style comparison function.
			-- key_compare_data : 	data to pass to comparison function.
			-- Returns : 	a new GTree.
		do
			create comparator.make (a_compare_function)
			from_external_pointer(g_tree_new_with_data
										 (comparator.callback_address, $comparator))
		end

	-- g_tree_new_full ()
	
	-- GTree* g_tree_new_full (GCompareDataFunc key_compare_func,
	-- gpointer key_compare_data, GDestroyNotify key_destroy_func,
	-- GDestroyNotify value_destroy_func);
	
	-- Creates a new GTree like g_tree_new() and allows to specify
	-- functions to free the memory allocated for the key and value
	-- that get called when removing the entry from the GTree.

	-- key_compare_func : 	qsort()-style comparison function.
	-- key_compare_data : 	data to pass to comparison function.
	-- key_destroy_func : 	a function to free the memory allocated for the key used when removing the entry from the GTree or NULL if you don't want to supply such a function.
	-- value_destroy_func : 	a function to free the memory allocated for the value used when removing the entry from the GTree or NULL if you don't want to supply such a function.
	-- Returns : 	a new GTree.

feature
	insert_value (a_key: KEY; a_value: VALUE) is
			-- Inserts a key/value pair into a GTree. If `a_key' already
			-- exists in the GTree its corresponding value is set to new
			-- `a_value'.

			-- TODO: Eiffelize this: If you supplied a value_destroy_func
			-- when creating the GTree, the old value is freed using that
			-- function. If you supplied a key_destroy_func when creating
			-- the GTree, the passed key is freed using that function.

			-- The tree is automatically 'balanced' as new key/value
			-- pairs are added, so that the distance from the root to
			-- every leaf is as small as possible.

			-- tree : 	a GTree.
			-- key : 	the key to insert.
			-- value : 	the value corresponding to the key.
		require
			key_not_void: a_key/=Void
			value_not_void: a_value/=Void
		do
			g_tree_insert(handle, a_key.handle, a_value.handle);
		end

	replace (a_key: KEY; a_value: VALUE) is
			-- Inserts `a_key' and `a_value' into a GTree similar to
			-- `insert_value'. The difference is that if `a_key' already
			-- exists in the GTree, it gets replaced by the new key. If
			-- you supplied a value_destroy_func when creating the GTree,
			-- the old value is freed using that function. If you
			-- supplied a key_destroy_func when creating the GTree, the
			-- old key is freed using that function.

			-- The tree is automatically 'balanced' as new key/value
			-- pairs are added, so that the distance from the root to
			-- every leaf is as small as possible.
		require
			key_not_void: a_key/=Void
			value_not_void: a_value/=Void
		do
			g_tree_replace(handle,a_key.handle,a_value.handle)
		end

	count: INTEGER is
			-- the number of nodes in the GTree.
		do
			Result:=g_tree_nnodes(handle)
		end

	height: INTEGER is
			-- The height of a GTree.
		
			-- If the GTree contains no nodes, the height is 0. If the GTree contains only one root node the height is 1. If the root node has children the height is 2, etc.
		
			-- tree : 	a GTree.
			-- Returns : 	the height of the GTree.
		do
			Result:=g_tree_height(handle)
		end

	lookup (a_key: KEY): VALUE is
			-- the value corresponding to `a_key'. Since a GTree is
			-- automatically balanced as key/value pairs are added, key
			-- lookup is very fast.
		
			-- Void if `a_key' was not found.
		require key_not_void: a_key/=Void
		local p: POINTER; r: WRAPPER_RETRIEVER[VALUE]
		do
			p:=g_tree_lookup(handle, a_key.handle)
			if p.is_not_null then
				Result:=r.item_from(p)
			end
		end
	
	-- TODO: it is necessary to wrap g_tree_lookup_extended ?
	
	-- gboolean g_tree_lookup_extended (GTree *tree, gconstpointer
	-- lookup_key, gpointer *orig_key, gpointer *value);

	-- Looks up a key in the GTree, returning the original key and the
	-- associated value and a gboolean which is TRUE if the key was
	-- found. This is useful if you need to free the memory allocated
	-- for the original key, for example before calling
	-- g_tree_remove().
	
	-- tree : 	a GTree.
	-- lookup_key : 	the key to look up.
	-- orig_key : 	returns the original key.
	-- value : 	returns the value associated with the key.
	-- Returns : 	TRUE if the key was found in the GTree.
	
	for_all (a_test: FUNCTION[TUPLE[ANY, TUPLE[INTEGER,VALUE]], BOOLEAN]): BOOLEAN is
			-- Calls `a_test' for each of the key/value pairs in the
			-- GTree. The function is passed the key and value of each
			-- pair, and the given data parameter. The tree is traversed
			-- in sorted order.
	
			-- The tree may not be modified while iterating over it (you
			-- can't add/remove items). To remove all items matching a
			-- predicate, you need to add each item to a list in your
			-- GTraverseFunc as you walk over the tree, then walk the
			-- list and remove each item.
	
			-- tree : 	a GTree.
			-- func : 	the function to call for each node visited. If this function returns TRUE, the traversal is stopped.
			-- user_data : 	user data to pass to the function.
		require a_test /= Void
		-- local callback: G_TRAVERSE_CALLBACK
		do
			-- create callback.make (a_test)
			-- g_tree_foreach (handle, callback.low_level_callback, $callback)
		end

	-- enum GTraverseType

	-- typedef enum { G_IN_ORDER, G_PRE_ORDER, G_POST_ORDER,
	--   G_LEVEL_ORDER } GTraverseType;
	
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

	dispose is
			-- Destroys the GTree.

			-- TODO: The following should held only for C; check
			-- it... "If keys and/or values are dynamically allocated,
			-- you should either free them first or create the GTree
			-- using g_tree_new_full(). In the latter case the destroy
			-- functions you supplied will be called on all keys and
			-- values before destroying the GTree"
		do
			g_tree_destroy(handle)
		end

	compare (a_value, another_value: VALUE): INTEGER is
			-- The comparison function of two values. The function should
			-- return a negative integer if the first value comes before
			-- the second, 0 if they are equal, or a positive integer if
			-- the first value comes after the second.
		do
			
		end
	
feature {} -- Low level implementation
	comparator: G_COMPARE_DATA_CALLBACK 

	low_level_compare (a, b, user_data: POINTER): INTEGER is
			-- Specifies the type of a comparison function used to
			-- compare two values. The function should return a negative
			-- integer if the first value comes before the second, 0 if
			-- they are equal, or a positive integer if the first value
			--comes after the second.
		
			-- a : a value.
		
			-- b : a value to compare with.
		
			-- user_data : 	user data to pass to comparison function.
		
			-- Returns : negative value if a < b; zero if a = b; positive
			-- value if a > b.
		do
			-- local key_a, key_b: KEY; r: WRAPPER_RETRIEVER[KEY]

			-- Do *NOT* remove the above comment ("export CECIL")! It is necessary to
			-- generate the correct 
			-- key_a := r.wrapper_from(a)
			-- key_b := r.wrapper_from(b)
			--Result := gpointer_to_int(a).compare(gpointer_to_int(b))
		end
end

