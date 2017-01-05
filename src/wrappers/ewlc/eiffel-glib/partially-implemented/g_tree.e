note
	description: "Balanced Binary Trees, a sorted collection of key/value pairs optimized for searching and traversing in order."
	copyright: "[
					Copyright (C) 2005-2017: ,2007 Paolo Redaelli, Glib team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
			]"
	license: "LGPL v2 or later"

class G_TREE [VALUE->SHARED_C_STRUCT, KEY->COMPARABLE_SHARED_C_STRUCT]
	-- A sorted collection of key/value pairs optimized for searching
	-- and traversing in order.

inherit
	DICTIONARY[VALUE, KEY]
		undefine
			is_equal, copy -- using the definition given by SHARED_C_STRUCT
		redefine
			get_new_iterator_on_items,
			manifest_make,
			do_all, for_all, exists
		end

	SHARED_C_STRUCT redefine dispose end
	
insert
	G_TREE_EXTERNALS
		--	GLIB_TYPE_CONVERSION_MACROS -- Temporary
	
create {ANY}  with_comparer, from_external_pointer

feature {} -- Creation
	make (a_key_factory: CACHING_FACTORY[KEY]; a_value_factory: CACHING_FACTORY[VALUE])
			-- Creates a new G_TREE; comparison is made using KEY's 
			-- `compare' feature.
		require
			key_factory_not_void: a_key_factory/=Void
			value_factory_not_void: a_value_factory/=Void
		do
			key_factory   := a_key_factory
			value_factory := a_value_factory
			create comparator.make(agent {KEY}.compare)
			from_external_pointer(g_tree_new_with_data
										 (comparator.callback_address,
										  comparator.to_pointer))
		end
	
	with_comparer (a_comparison_function: FUNCTION[ANY,TUPLE[KEY,KEY],INTEGER];
						a_key_factory: CACHING_FACTORY[KEY]; a_value_factory: CACHING_FACTORY[VALUE])
			-- Creates a new GTree.
		require
			comparison_function_not_void: a_comparison_function /= Void
			key_factory_not_void: a_key_factory/=Void
			value_factory_not_void: a_value_factory/=Void
		do
			create comparator.make (a_comparison_function)
			from_external_pointer(g_tree_new_with_data
										 (comparator.callback_address,
										  comparator.to_pointer))
		end

	-- TODO: if necessary g_tree_new_full ()
	
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

feature {ANY} -- Basic access:

	has (a_key: KEY): BOOLEAN
			-- Is there a value currently associated with `a_key'?

			-- See also `fast_has', `at'.
		do
			if (g_tree_lookup(handle,a_key.handle)).is_not_null
			then Result:=True
			end
		end

	at (a_key: KEY): VALUE
			-- The value associated to `a_key'.

			-- See also `fast_at', `reference_at', `has'.
		local p: POINTER
		do
			p:=g_tree_lookup(handle, a_key.handle)
			check require_has_key_implies_result_pointer_not_null:
				p.is_not_null 
			end
			Result:=value_factory.wrapper(p)
		end

	reference_at (a_key: KEY): VALUE
			-- the value corresponding to `a_key'. Since a GTree is
			-- automatically balanced as key/value pairs are added, key
			-- lookup is very fast.
		
			-- Void if `a_key' was not found.
		local p: POINTER; r: WRAPPER_RETRIEVER[VALUE]
		do
			p:=g_tree_lookup(handle, a_key.handle)
			if p.is_not_null then
				Result:=value_wrapper.wrapper(p)
			end
		end

	fast_has (a_key: KEY): BOOLEAN
			-- Is there a value currently associated with `a_key'?
			-- Using basic `=' for comparison.
			--
			-- See also `has', `at', `fast_at'.
		do
			debug print_no_fast_notice; print (fast_fallback_notice) end
			Result:=has(a_key)
		end

	fast_at (a_key: KEY): VALUE
			-- Return the value associated to key `k' using basic `=' for comparison.
			--
			-- See also `at', `reference_at', `fast_reference_at'.
		do
			debug print_no_fast_notice; print (fast_fallback_notice) end
			Result:=at(a_key)
		end

	fast_reference_at (a_key: KEY): VALUE
			-- Same work as `reference_at', but basic `=' is used for comparison.
			--
			-- See also `reference_at', `at', `has'.
		do
			debug print_no_fast_notice; print (fast_fallback_notice) end
			Result:=reference_at(a_key)
		end

feature {ANY}
	put (a_value: VALUE; a_key: KEY)
			-- Change some existing entry or `add' the new one. If an entry with `a_key' is not yet in the dictionary,
			-- enter it with `a_value'. Otherwise overwrite the item associated with `a_key'.
			-- 
			-- The tree is automatically 'balanced' as new key/value
			-- pairs are added, so that the distance from the root to
			-- every leaf is as small as possible.
		require else value_not_void: a_value/=Void
		do
			-- TODO: Eiffelize this: If you supplied a value_destroy_func
			-- when creating the GTree, the old value is freed using that
			-- function. If you supplied a key_destroy_func when creating
			-- the GTree, the passed key is freed using that function.
			g_tree_insert(handle, a_key.handle, a_value.handle)
		end

	fast_put (a_value: VALUE; a_key: KEY)
			-- Same job as `put', but uses basic `=' for comparison.
			--
			-- See also `put', `add'.
		do
			debug print_no_fast_notice; print (fast_fallback_notice) end
			put(a_value,a_key)
		end

	add (a_value: VALUE; a_key: KEY)
			-- To add a new entry `k' with its associated value `v'.
			-- Actually, this is equivalent to call `put', but it may run a little bit faster.
			--
			-- See also `put', `fast_put'.
		do
			debug print_add_fallback end
			put(a_value,a_key)
		end

feature {ANY} -- Removing:
	remove (a_key: KEY)
			-- Remove entry `a_key' (which may exist or not before this call).
			-- As the `remove' procedure actually uses `is_equal', you may consider to use `fast_remove' for expanded
			-- objects as well while trying to get the very best performances.
			--
			-- See also `fast_remove', `clear_count'.
		local a_result: INTEGER
		do
			a_result:=g_tree_steal(handle,a_key.handle)
			-- Note: g_tree_steal removes a key and its associated value
			-- from a GTree without calling the key and value destroy
			-- functions.

			-- a_result is True(1) if the key was found (prior to 2.8,
			-- this function returned nothing)

			-- TODO: see if the following informations have some
			-- relevance for Eiffel. We could use g_tree_remove in case
			-- of particular cases of memory handling. Infact using
			-- g_tree_remove the following applies: If the GTree was
			-- created using g_tree_new_full(), the key and value are
			-- freed using the supplied destroy functions, otherwise you
			-- have to make sure that any dynamically allocated values
			-- are freed yourself. If the key does not exist in the
			-- GTree, the function does nothing.
		end

	fast_remove (a_key: KEY)
			-- Same job as `remove', but uses basic `=' for comparison.
			--
			-- See also `remove', `clear_count'.
		do
			debug print_no_fast_notice; print (fast_fallback_notice) end
			remove (a_key)
		end

	clear_count
			-- Discard all items (`is_empty' is True after that call). The internal `capacity' is not changed
			-- by this call.
			--
			-- See also `clear_count_and_capacity', `remove'.
		do
			not_yet_implemented
		end

	clear_count_and_capacity
			-- Discard all items (`is_empty' is True after that call). The internal `capacity' may also be
			-- reduced after this call.
			--
			-- See also `clear_count', `remove'.
		do
			dispose -- and reallocate
			from_external_pointer(g_tree_new_with_data
										 (comparator.callback_address, comparator.to_pointer))
		end

	capacity: INTEGER
			-- Approximation of the actual internal storage `capacity'. The `capacity' will grow automatically
			-- when needed (i.e. `capacity' is not a limit for the number of values stored). Also note that
			-- the `capacity' value may not be always accurate depending of the implementation (anyway, this
			-- `capacity' value is at least equals to `count').
		do
			-- Note: implemented to be equal to count
			Result:=count
		end


feature {ANY} -- counting
	count: INTEGER_32
		do
			Result:=g_tree_nnodes(handle)
		end

feature {ANY} -- To provide iterating facilities:
	item (index: INTEGER): VALUE
		do
			not_yet_implemented
		end

	key (index: INTEGER): KEY
		do
			not_yet_implemented
		end

	get_new_iterator_on_items: ITERATOR[VALUE]
		do
			not_yet_implemented
		end

	get_new_iterator_on_keys: ITERATOR[KEY]
		do
			not_yet_implemented
		end

feature {ANY} -- Agents based features:
	do_all (action: ROUTINE[TUPLE[VALUE, KEY]])
			-- Apply `action' to every [VALUE, KEY] associations of `Current'.
			--
			-- See also `for_all', `exist'.
		do
			not_yet_implemented
		end

	for_all (test: PREDICATE[TUPLE[VALUE, KEY]]): BOOLEAN
			-- Do all [VALUE, KEY] associations satisfy `test'?
			--
			-- See also `do_all', `exist'.
		-- local callback: G_TRAVERSE_CALLBACK
		do
			not_yet_implemented
			-- create callback.make a_test)
			-- g_tree_foreach (handle, callback.low_level_callback, $callback)
		end

	exists (test: PREDICATE[TUPLE[VALUE, KEY]]): BOOLEAN
		do
			not_yet_implemented
		end

feature {ANY} -- Other features:
	internal_key (a_key: KEY): KEY
			-- Retrieve the internal key object which correspond to the existing
			-- entry `a_key' (the one memorized into the `Current' dictionary).
			--
			-- See also `has', `fast_has'.
		do
			not_yet_implemented
		end

feature {} -- Implement manifest generic creation:
	manifest_make (needed_capacity: INTEGER)
			-- Manifest creation of a dictionary.
		do
			not_yet_implemented
		end

feature {ANY}
	height: INTEGER
			-- The height of a G_TREE.
		
			-- If the G_TREE contains no nodes, the height is 0. If the
			-- G_TREE contains only one root node the height is 1. If the
			-- root node has children the height is 2, etc.
		do
			Result:=g_tree_height(handle)
		end

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

	dispose
			-- Destroys the GTree.

			-- TODO: The following should held only for C; check
			-- it... "If keys and/or values are dynamically allocated,
			-- you should either free them first or create the GTree
			-- using g_tree_new_full(). In the latter case the destroy
			-- functions you supplied will be called on all keys and
			-- values before destroying the GTree"
		do
			g_tree_destroy(handle)
			handle:=default_pointer
		end

	compare (a_value, another_value: VALUE): INTEGER
			-- The comparison function of two values. The function should
			-- return a negative integer if the first value comes before
			-- the second, 0 if they are equal, or a positive integer if
			-- the first value comes after the second.
		obsolete "Work in progress on callbacks"
		do
			
		end
	
feature {} -- Low level implementation
	comparator: G_COMPARE_DATA_CALLBACK [KEY]
			-- The object containing the callback that will be called by C

	key_factory: WRAPPER_FACTORY[KEY]

	value_factory: WRAPPER_FACTORY[VALUE]

	print_no_fast_notice
		once
			print(no_fast_notice)
		end

	no_fast_notice: STRING
		"Original C GTree implementation does not offer functions equivalent to `fast_has,' `fast_at', `fast_reference_at', `fast_put' and `fast_remove'. An eventual implementation of those features would require to manipulate directly GTree data-structure, skipping the Glib abstraction. Paolo 2007-07-15%N"

	fast_fallback_notice: STRING
		"Fast_[has|at|reference_at|put] feature not available. Falling back to non-fast features.%N"

	print_add_fallback
		once
			print (print_add_fallback_notice)
		end
	
	print_add_fallback_notice: STRING
		"Original C GTree implementation does not offer a function equivalent to `add'. Falling back to `put' feature. Paolo 2007-07-15%N"

feature {} -- Unwrapped code
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

	-- AFAIK wrapping replace is just not necessary in Eiffel
	
	-- 		replace (a_key: KEY; a_value: VALUE) is
	-- 			-- Inserts `a_key' and `a_value' into a GTree similar to
	-- 			-- `insert_value'. The difference is that if `a_key' already
	-- 			-- exists in the GTree, it gets replaced by the new key. If
	-- 			-- you supplied a value_destroy_func when creating the GTree,
	-- 			-- the old value is freed using that function. If you
	-- 			-- supplied a key_destroy_func when creating the GTree, the
	-- 			-- old key is freed using that function.

	-- 			-- The tree is automatically 'balanced' as new key/value
	-- 			-- pairs are added, so that the distance from the root to
	-- 			-- every leaf is as small as possible.
	-- 		require
	-- 			key_not_void: a_key/=Void
	-- 			value_not_void: a_value/=Void
	-- 		do
	-- 			g_tree_replace(handle,a_key.handle,a_value.handle)
	-- 		end

end

