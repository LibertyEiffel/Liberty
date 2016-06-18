note
	description: "Hash Tables associations between keys and values so that given a key the value can be found quickly."
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_HASH_TABLE [VALUE->SHARED_C_STRUCT, KEY->COMPARABLE_SHARED_C_STRUCT]
	-- A G_HASH_TABLE provides associations between keys and values
	-- which is optimized so that given a key, the associated value can
	-- be found very quickly.

	-- TODO: provide non-fast features, i.e. features that compare 
	-- keys by their content, not by their address.

	-- TODO: Eiffellize the following documentation.
	
	-- Note: the following note, valid for the manual memory management
	-- of the C world is not true anymore in an Eiffel program, if a
	-- caching wrapper factory is used... "Note that neither keys nor
	-- values are copied when inserted into the G_HASH_TABLE, so they
	-- must exist for the lifetime of the G_HASH_TABLE. This means that
	-- the use of static strings is OK, but temporary strings
	-- (i.e. those created in buffers and those returned by GTK+
	-- widgets) should be copied with g_strdup() before being
	-- inserted".

	-- If keys or values are dynamically allocated, you must be careful
	-- to ensure that they are freed when they are removed from the
	-- G_HASH_TABLE, and also when they are overwritten by new
	-- insertions into the G_HASH_TABLE. It is also not advisable to
	-- mix static strings and dynamically-allocated strings in a
	-- GHashTable, because it then becomes difficult to determine
	-- whether the string should be freed.

	-- To create a GHashTable, use g_hash_table_new().
	
	-- To insert a key and value into a GHashTable, use
	-- g_hash_table_insert().

	-- To lookup a value corresponding to a given key, use
	-- g_hash_table_lookup() and g_hash_table_lookup_extended().

	-- To remove a key and value, use g_hash_table_remove().

	-- To call a function for each key and value pair use
	-- g_hash_table_foreach().

	-- To destroy a GHashTable use g_hash_table_destroy().

inherit
	WRAPPER_DICTIONARY [VALUE, KEY]
		redefine
			dispose
		end
		
insert
	G_HASH_TABLE_EXTERNALS

create {ANY}  from_external

feature {} -- Creation
	from_external (a_pointer: POINTER; a_factory: WRAPPER_FACTORY[VALUE])
		require factory_not_void: a_factory/=Void
		do
			factory := a_factory
			from_external_pointer(a_pointer)
		end
	

	with_factory (a_factory: WRAPPER_FACTORY[VALUE])
		require factory_not_void: a_factory/=Void
		do
			factory := a_factory
			from_external_pointer
			(g_hash_table_new
			 (default_pointer, -- Using g_direct_hash as hash function;
			  default_pointer, -- Direct comparison of address, like using g_direct_equal as key equal function but with no overhead
			  ),a_factory)
	
			-- g_hash_table_new creates a new GHashTable.
			
			-- hash_func : a function to create a hash value from a
			-- key. Hash values are used to determine where keys are
			-- stored within the GHashTable data structure. The
			-- g_direct_hash(), g_int_hash() and g_str_hash() functions
			-- are provided for some common types of keys. If hash_func
			-- is NULL, g_direct_hash() is used.
			
			-- key_equal_func : a function to check two keys for
			-- equality. This is used when looking up keys in the
			-- GHashTable. The g_direct_equal(), g_int_equal() and
			-- g_str_equal() functions are provided for the most common
			-- types of keys. If key_equal_func is NULL, keys are
			-- compared directly in a similar fashion to
			-- g_direct_equal(), but without the overhead of a function
			-- call.
		end

	-- TODO: GHashTable* g_hash_table_new_full (GHashFunc hash_func,
	-- GEqualFunc key_equal_func, GDestroyNotify key_destroy_func,
	-- GDestroyNotify value_destroy_func);
	
	-- Creates a new GHashTable like g_hash_table_new() and allows to
	-- specify functions to free the memory allocated for the key and
	-- value that get called when removing the entry from the
	-- GHashTable.

	-- hash_func : 	a function to create a hash value from a key.
	-- key_equal_func : 	a function to check two keys for equality.
	-- key_destroy_func : 	a function to free the memory allocated for the key used when removing the entry from the GHashTable or NULL if you don't want to supply such a function.
	-- value_destroy_func : 	a function to free the memory allocated for the value used when removing the entry from the GHashTable or NULL if you don't want to supply such a function.
	-- Returns : 	a new GHashTable.

	-- TODO: feature {} -- Implement manifest generic creation:
	-- 	manifest_make (needed_capacity: INTEGER) is
	-- 			-- Manifest creation of a dictionary.
	-- 		do
	-- 			allocate
	-- 		end
	
feature {ANY} -- Basic access:
	has (a_key: KEY): BOOLEAN
		local orig_key_ptr, value_ptr: POINTER
		do
			Result:=(g_hash_table_lookup_extended
						(handle, a_key.handle, orig_key_ptr, value_ptr)).to_boolean
		end

	at (a_key: KEY): VALUE
			-- Looks up `a_key' in a GHashTable. 
		local ptr: POINTER
		do
			ptr := g_hash_table_lookup (handle, a_key.handle)
			if ptr.is_not_null then
				Result:=factory.wrapper(ptr)
			end
		end

	reference_at (a_key: KEY): VALUE
			-- The value associated to `a_key'. Void if there is no value
			-- for `a_key'.
		local ptr: POINTER
		do
			ptr := g_hash_table_lookup (handle, a_key.handle)
			if ptr.is_not_null then
				Result:=factory.wrapper(ptr)
			end

			-- Looks up a key in the GHashTable, returning the original
			-- key and the associated value and a gboolean which is TRUE
			-- if the key was found. This is useful if you need to free
			-- the memory allocated for the original key, for example
			-- before calling `remove'.

			-- `a_key': 	the key to look up.
		
			-- orig_key : 	returns the original key.
			-- value : 	returns the value associated with the key.
			-- Returns : 	TRUE if the key was found in the GHashTable.
			-- gboolean g_hash_table_lookup_extended (GHashTable
			-- *hash_table, gconstpointer lookup_key, gpointer *orig_key,
			-- gpointer *value);
		end

	fast_has (k: KEY): BOOLEAN
		do
			debug 
				print_no_fast_notice
				print(fast_fallback_notice)
			end
			Result:=has(k)
		end

	fast_at (k: KEY): VALUE
		do	
			debug 
				print_no_fast_notice
				print(fast_fallback_notice)
			end
			Result:=at(k)
		end

	fast_reference_at (k: KEY): VALUE
		do
			debug 
				print_no_fast_notice
				print(fast_fallback_notice)
			end
			Result:=reference_at(k)
		end

feature {ANY}
	put (a_value: VALUE; a_key: KEY)
			-- Inserts a new key and value into a GHashTable.
		
			-- If the key already exists in the GHashTable its current
			-- value is replaced with the new value. If you supplied a
			-- value_destroy_func when creating the GHashTable, the old
			-- value is freed using that function. If you supplied a
			-- key_destroy_func when creating the GHashTable, the passed
			-- key is freed using that function.
		
			-- hash_table : 	a GHashTable.
			-- key : 	a key to insert.
			-- value : 	the value to associate with the key.
		require else value_not_void: a_value /= Void
		do
			g_hash_table_insert (handle, a_key.handle, a_value.handle)
		end

	fast_put (v: VALUE; k: KEY)
		require else value_not_void: v /= Void
		do
			debug 
				print_no_fast_notice
				print(fast_fallback_notice)
			end
			put(v,k)
		end

	add (v: VALUE; k: KEY)
		require else value_not_void: v /= Void
		do
			put(v,k)
		end

feature {ANY} -- Removing:
	remove (a_key: KEY)
			-- Removes a key and its associated value from a GHashTable.

			-- `is_successful' will be True if the key was found and
			-- removed from the GHashTable.
		do
			-- TODO: Translate/implement this C-ism: If the GHashTable
			-- was created using `make_full', the key and value are freed
			-- using the supplied destroy functions, otherwise you have
			-- to make sure that any dynamically allocated values are
			-- freed yourself.
			is_successful := (g_hash_table_remove (handle, a_key.handle)).to_boolean
		end

	fast_remove (k: KEY)
		do
			debug 
				print_no_fast_notice
				print(fast_fallback_notice)
			end
			remove(k)
		end

	clear_count
		do
			g_hash_table_remove_all(handle)
		end

	clear_count_and_capacity
		do
			dispose
			make
		end

	capacity: INTEGER
		do
			Result:=g_hash_table_size(handle)
		end

feature {ANY} -- To provide iterating facilities:
	item (index: INTEGER): VALUE
		do
		ensure then implemented: False
		end

	key (index: INTEGER): KEY
		do
		ensure then implemented: False
		end

	get_new_iterator_on_keys: ITERATOR[KEY]
		do
		ensure then implemented: False
		end

feature {ANY} -- Other features:
	internal_key (k: KEY): KEY
		do
		ensure then implemented: False
		end

	-- GHashFunc ()

	-- guint       (*GHashFunc)                    (gconstpointer key);
	
	-- Specifies the type of the hash function which is passed to
	-- g_hash_table_new() when a GHashTable is created.

	-- The function is passed a key and should return a guint hash
	-- value. The functions g_direct_hash(), g_int_hash() and
	-- g_str_hash() provide hash functions which can be used when the
	-- key is a gpointer, gint, and gchar* respectively.
	
	-- FIXME: Need more here. The hash values should be evenly
	-- distributed over a fairly large range? The modulus is taken with
	-- the hash table size (a prime number) to find the 'bucket' to
	-- place each key into. The function should also be very fast,
	-- since it is called for each key lookup.  key : a key.  Returns :
	-- the hash value corresponding to the key.  GEqualFunc ()

	-- gboolean (*GEqualFunc) (gconstpointer a, gconstpointer b);

	-- Specifies the type of a function used to test two values for
	-- equality. The function should return TRUE if both values are
	-- equal and FALSE otherwise.
	
	-- a : 	a value.
	-- b : 	a value to compare with.
	-- Returns : 	TRUE if a = b; FALSE otherwise.
	-- g_hash_table_insert ()

feature {ANY}

	count: INTEGER
			-- the number of elements (key/value pairs) contained in the
			-- GHashTable.
		do
			Result := g_hash_table_size (handle)
		end

	-- g_hash_table_foreach ()
	
	-- void g_hash_table_foreach (GHashTable *hash_table, GHFunc func,
	-- gpointer user_data);
	
	-- Calls the given function for each of the key/value pairs in the
	-- GHashTable. The function is passed the key and value of each
	-- pair, and the given user_data parameter. The hash table may not
	-- be modified while iterating over it (you can't add/remove
	-- items). To remove all items matching a predicate, use
	-- g_hash_table_foreach_remove().

	-- hash_table : 	a GHashTable.
	-- func : 	the function to call for each key/value pair.
	-- user_data : 	user data to pass to the function.
	
	-- g_hash_table_find ()
	
	-- gpointer g_hash_table_find (GHashTable *hash_table, GHRFunc
	-- predicate, gpointer user_data);

	-- Calls the given function for key/value pairs in the GHashTable
	-- until predicate returns TRUE. The function is passed the key and
	-- value of each pair, and the given user_data parameter. The hash
	-- table may not be modified while iterating over it (you can't
	-- add/remove items).
	
	-- hash_table : 	a GHashTable.
	-- predicate : 	function to test the key/value pairs for a certain property.
	-- user_data : 	user data to pass to the function.
	-- Returns : 	The value of the first key/value pair is returned, for which func evaluates to TRUE. If no pair with the requested property is found, NULL is returned.


	-- GHFunc ()
	
	-- void (*GHFunc) (gpointer key, gpointer value, gpointer
	-- user_data);
	
	-- Specifies the type of the function passed to g_hash_table_foreach(). It is called with each key/value pair, together with the user_data parameter which is passed to g_hash_table_foreach().
	-- key : 	a key.
	-- value : 	the value corresponding to the key.
	-- user_data : 	user data passed to g_hash_table_foreach().

	is_successful: BOOLEAN
	
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

	dispose
			-- Destroys the GHashTable. If keys and/or values are
			-- dynamically allocated, you should either free them first
			-- or create the GHashTable using g_hash_table_new_full(). In
			-- the latter case the destroy functions you supplied will be
			-- called on all keys and values before destroying the
			-- GHashTable.
		do
			g_hash_table_destroy (handle)
		end

feature {}
	-- g_direct_equal ()

	-- Compares two gpointer arguments and returns TRUE if they
	-- are equal. It can be passed to `g_hash_table_new' as the
	-- key_equal_func parameter, when using pointers as keys in a
	-- GHashTable.
	
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
feature {ANY} -- size

	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GHashTable)"
		end

feature {} -- Low level implementation
	print_no_fast_notice
		once
			print(no_fast_notice)
		end

	no_fast_notice: STRING
		"Original C GHashTable implementation does not offer functions equivalent to `fast_has,' `fast_at', `fast_reference_at', `fast_put' and `fast_remove'. An eventual implementation of those features would require to manipulate directly GHashTable data-structure, skipping the Glib abstraction. Paolo 2007-07-15%N"

	fast_fallback_notice: STRING
		"Fast_[has|at|reference_at|put|remove] feature not available. Falling back to non-fast features.%N"


		--	steal (a_key: KEY): VALUE is
		-- Removes a key and its associated value from a GHashTable
		-- without calling the key and value destroy functions.
	
		-- `is_successful' is True if the key was found and removed
		-- from the GHashTable.
		-- require key_not_void: a_key /= Void

		-- do is_successful := (g_hash_table_steal (handle,
		-- a_key.handle)).to_boolean end

		-- replace (a_key: KEY; a_value: VALUE) is Inserts a new key and
		-- value into a GHashTable similar to g_hash_table_insert(). The
		-- difference is that if the key already exists in the
		-- GHashTable, it gets replaced by the new key. If you supplied
		-- a value_destroy_func when creating the GHashTable, the old
		-- value is freed using that function. If you supplied a
		-- key_destroy_func when creating the GHashTable, the old key is
		-- freed using that function.  hash_table : a GHashTable.  key :
		-- a key to insert.  value : the value to associate with the
		-- key.  require key_not_void: a_key /= Void value_not_void:
		-- a_value /= Void do g_hash_table_replace (handle,
		-- a_key.handle, a_value.handle) end
	
end
