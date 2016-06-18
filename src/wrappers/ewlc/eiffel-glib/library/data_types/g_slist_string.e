note
	description: "A special version of GSList (singly-linked list) to wrap GSList containing C strings."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class G_SLIST_STRING

inherit
	COLLECTION[STRING]
		undefine 
			append_collection,
			clear_all,
			has,
			fast_has,
			swap
		end

	C_STRUCT
		undefine 
			fill_tagged_out_memory
		redefine
			copy, from_external_pointer
		end

insert
	G_SLIST_EXTERNALS undefine fill_tagged_out_memory end

create {ANY} make, from_external_pointer

feature {ANY}
	make
		do
			handle := default_pointer
		end

	from_external_pointer (a_ptr: POINTER)
		do
			Precursor(a_ptr)
		end
	
	first: STRING
		do
			create Result.from_external_copy (g_slist_get_data (handle))
		end

	last: like first
		do
			create Result.from_external_copy (g_slist_get_data (g_slist_last (handle)))
		end

	item (i: INTEGER): like first
		do
			create Result.from_external_copy (g_slist_nth_data (handle, i))
		end

	put (a_string: like first; i: INTEGER)
		require else
			valid_item: a_string/=Void
		do
			g_slist_set_data (g_slist_nth(handle,i), a_string.to_external)
		end

	swap (i,j: INTEGER)
		local ith,jth,tmp: POINTER
		do
			ith := g_slist_nth_data (handle,i)
			jth := g_slist_nth_data (handle,j)

			tmp := g_slist_get_data(ith)
			g_slist_set_data (ith, g_slist_get_data(jth))
			g_slist_set_data (jth, tmp)
		end

	set_all_with (v: like first)
		local ith:POINTER
		do
			from ith:=handle
			until ith.is_null
			loop
				g_slist_set_data (ith, v.to_external)
				ith := g_slist_get_next (ith)
			end
		end

	clear_all do not_yet_implemented end

	add_first (a_string: like first)
		do
			handle := g_slist_prepend (handle, a_string.to_external)
		end

	add_last (a_string: like first)
			-- Note that add_last has to traverse the entire list to find
			-- the end, which is inefficient when adding multiple
			-- elements. A common idiom to avoid the inefficiency is to
			-- prepend the elements and reverse the list when all
			-- elements have been added.
		do
			handle := g_slist_append (handle, a_string.to_external)	
		end

	add (a_string: like first; index: INTEGER)
		do
			handle := g_slist_insert (handle, a_string.to_external, index-1)
		end

	
	append_collection (other: COLLECTION[STRING])
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	force (a_string: like first; index: INTEGER) do not_yet_implemented end

	lower: INTEGER 0

	remove_head (n: INTEGER) do not_yet_implemented end
	remove_tail (n: INTEGER) do not_yet_implemented end

	manifest_put (index: INTEGER; element: like item)
		do
			put(element,index)
		end
			

	remove_first
		do
			handle:=g_slist_delete_link (handle, handle)
		end

	remove (index: INTEGER)
		do
			handle:=g_slist_delete_link (handle,
												  g_slist_nth_data (handle, index-1))
		end

	remove_last
		do
			handle:=g_slist_delete_link (handle,g_slist_last (handle))
		end

	clear_count, clear_count_and_capacity
			-- Discard all items (is_empty is True after that call). Frees
			-- all of the memory used by a GSList. The freed elements are
			-- added to the GAllocator free list.
		do
			g_slist_free (handle)
			handle := default_pointer
		end

	has (x: like first): BOOLEAN
			-- Look for x using is_equal for comparison. Note: current
			-- implementation is just a copy of `fast_has'; try using
			-- `fast_has' whenever possible since an implementation of
			-- `has' that really uses `is_equal' will be quite slow.
		do
			Result:=fast_has(x)
		end
	
	fast_has (a_string: like first): BOOLEAN
			-- Look for x using basic = for comparison.
		do
			if (g_slist_find(handle,a_string.to_external).is_not_null)
			then Result:=True
			else check Result=False end
			end
		end
	
	first_index_of (a_string: like first): INTEGER
			-- Give the index of the first occurrence of element using
			-- is_equal for comparison. Answer upper + 1 when element is
			-- not inside.
		do
			Result:=g_slist_index(handle,a_string.to_external)
		end

	index_of (a_string: like first; start_index: INTEGER): INTEGER
		do
			Result:=first_index_of(a_string)
		end

	reverse_index_of (a_string: like first; start_index: INTEGER): INTEGER do not_yet_implemented end

	fast_first_index_of (a_string: like first): INTEGER
			-- Give the index of the first occurrence of element using
			-- basic = for comparison. Answer upper + 1 when element is
			-- not inside.
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	fast_index_of (a_string: like first; start_index: INTEGER): INTEGER do not_yet_implemented end

	fast_reverse_index_of (a_string: like first; start_index: INTEGER): INTEGER
			-- Using basic = comparison, gives the index of the first
			-- occurrence of element at or before start_index. Search is
			-- done in reverse direction, which means from the
			-- start_index down to the lower index . Answer lower -1 when
			-- the search fail.
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	is_equal_map (other: like Current): BOOLEAN
			-- Do both collections have the same lower, upper, and items?
			-- Feature is_equal is used for comparison of items.
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	all_default: BOOLEAN
			--	Do all items have their type s default value? Note: for
			--	non Void items, the test is performed with the is_default
			--	predicate.
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	copy (other: G_SLIST_STRING)
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	occurrences (a_string: like first): INTEGER
			-- Number of occurrences of element using is_equal for comparison.
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	fast_occurrences (a_string: like first): INTEGER
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end
	

	replace_all (old_value, new_value: like first)
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	fast_replace_all (old_value, new_value: like first)
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	slice (min, max: INTEGER): G_SLIST_STRING
		do
			check implemented: False end
			not_yet_implemented -- TODO

		end

	reverse
		local old_handle: POINTER
		do
			old_handle := handle
			handle:=g_slist_reverse (handle)
			g_slist_free (handle) -- TODO is this call correct?
		end

	upper,count: INTEGER
		do
			Result:=g_slist_length(handle)
			-- ensure then	positive: Result >= 0 
		end

	is_empty: BOOLEAN
		do
			Result:= (handle.is_null)
		end
	
	from_collection (model: COLLECTION[STRING]) do not_yet_implemented end
	
	get_new_iterator: ITERATOR[STRING]
		do
			create {ITERATOR_ON_G_SLIST_STRING} Result.make (Current) 
		end

feature {ANY} -- Memory management

	dispose
		do
			-- list nodes are not allocated with malloc so we should not
			-- use free.
			g_slist_free (handle)
			handle:= default_pointer
		end

	-- Glib's doc, useful for implementing unimplemented
	
-- typedef struct {
--   gpointer data;
--   GSList *next;
-- } GSList;

-- The GSList struct is used for each element in the singly-linked list.
	-- gpointer data; 	holds the element's data, which can be a pointer to any kind of data, or any integer value using the Type Conversion Macros.
	-- GSList *next; 	contains the link to the next element in the list.
	-- g_slist_alloc ()

-- GSList*     g_slist_alloc                   (void);

-- Allocates space for one GSList element. It is called by the g_slist_append(), g_slist_prepend(), g_slist_insert() and g_slist_insert_sorted() functions and so is rarely used on its own.
-- Returns : 	a pointer to the newly-allocated GSList element.

	append (a_string: like first)
			-- Adds `a_string' on to the end of the list.
		do
			handle:=g_slist_append (handle, a_string.to_external)

			-- Note: The return value is the new start of the list, which may have changed, so make sure you store the new value.
			
			-- Note: g_slist_append() has to traverse the entire list to
			-- find the end, which is inefficient when adding multiple
			-- elements. A common idiom to avoid the inefficiency is to
			-- prepend the elements and reverse the list when all
			-- elements have been added.

			--   /* Notice that these are initialized to the empty list. */
			--   GSList *list = NULL, *number_list = NULL;
			
			--   /* This is a list of strings. */
			--   list = g_slist_append (list, "first");
			--   list = g_slist_append (list, "second");
			
			--   /* This is a list of integers. */
			--   number_list = g_slist_append (number_list, GINT_TO_POINTER (27));
			--   number_list = g_slist_append (number_list, GINT_TO_POINTER (14));
		end

			
	prepend  (a_string: like first)
			-- Adds a new element on to the start of the list.
		require valid_item: a_string/=Void
		do
			handle := g_slist_prepend (handle,a_string.to_external)
			-- Note: The return value is the new start of the list, which
			-- may have changed, so make sure you store the new value.

			-- /* Notice that it is initialized to the empty list. */
			-- GSList *list = NULL; list = g_slist_prepend (list,
			-- "last"); list = g_slist_prepend (list, "first");
		end


-- g_slist_insert ()

-- GSList*     g_slist_insert                  (GSList *list, gpointer data, gint position);

-- Inserts a new element into the list at the given position.
-- list : 	a GSList.
-- data : 	the data for the new element.
-- position : 	the position to insert the element. If this is negative, or is larger than the number of elements in the list, the new element is added on to the end of the list.
-- Returns : 	the new start of the GSList.
-- g_slist_insert_before ()

-- GSList*     g_slist_insert_before           (GSList *slist, GSList *sibling, gpointer data);

-- Inserts a node before sibling containing data. Returns the new head of the list.
-- slist : 	a GSList.
-- sibling : 	node to insert data before.
-- data : 	data to put in the newly-inserted node.
-- Returns : 	new head of the list.
-- g_slist_insert_sorted ()

-- GSList*     g_slist_insert_sorted           (GSList *list, gpointer data, GCompareFunc func);

-- Inserts a new element into the list, using the given comparison function to determine its position.
-- list : 	a GSList.
-- data : 	the data for the new element.
-- func : 	the function to compare elements in the list. It should return a number > 0 if the first parameter comes after the second parameter in the sort order.
-- Returns : 	the new start of the GSList.
-- g_slist_remove ()

-- GSList*     g_slist_remove                  (GSList *list, gconstpointer data);

-- Removes an element from a GSList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the GSList is unchanged.
-- list : 	a GSList.
-- data : 	the data of the element to remove.
-- Returns : 	the new start of the GSList.
-- g_slist_remove_link ()

-- GSList*     g_slist_remove_link             (GSList *list, GSList *link_);

-- Removes an element from a GSList, without freeing the element. The removed element's next link is set to NULL, so that it becomes a self-contained list with one element.
-- list : 	a GSList.
-- link_ : 	an element in the GSList.
-- Returns : 	the new start of the GSList, without the element.
-- g_slist_delete_link ()

-- GSList*     g_slist_delete_link             (GSList *list, GSList *link_);

-- Deletes a node of list. Returns the new list head.
-- list : 	a GSList.
-- link_ : 	node to delete.
-- Returns : 	new head of list.
-- g_slist_remove_all ()

-- GSList*     g_slist_remove_all              (GSList *list, gconstpointer data);

-- Removes all list nodes with data equal to data. Returns the new head of the list. Contrast with g_slist_remove() which removes only the first node matching the given data.
-- list : 	a GSList.
-- data : 	data to remove.
-- Returns : 	new head of list.
-- g_slist_free ()

-- void        g_slist_free                    (GSList *list);

-- Frees all of the memory used by a GSList. The freed elements are added to the GAllocator free list.
-- list : 	a GSList.
-- g_slist_free_1 ()

-- void        g_slist_free_1                  (GSList *list);

-- Frees one GSList element. It is usually used after g_slist_remove_link().
-- list : 	a GSList element.
-- g_slist_length ()

-- guint       g_slist_length                  (GSList *list);

-- Gets the number of elements in a GSList.
-- list : 	a GSList.
-- Returns : 	the number of elements in the GSList.
-- g_slist_copy ()

-- GSList*     g_slist_copy                    (GSList *list);

-- Copies a GSList.

-- Note that this is a "shallow" copy. If the list elements consist of pointers to data, the pointers are copied but the actual data isn't.
-- list : 	a GSList.
-- Returns : 	a copy of list.
-- g_slist_reverse ()

-- GSList*     g_slist_reverse                 (GSList *list);

-- Reverses a GSList.
-- list : 	a GSList.
-- Returns : 	the start of the reversed GSList.
-- g_slist_sort ()

-- GSList*     g_slist_sort                    (GSList *list, GCompareFunc compare_func);

-- Sorts a GSList using the given comparison function.
-- list : 	a GSList.
-- compare_func : 	the comparison function used to sort the GSList. This function is passed the data from 2 elements of the GSList and should return 0 if they are equal, a negative value if the first element comes before the second, or a positive value if the first element comes after the second.
-- Returns : 	the start of the sorted GSList.
-- g_slist_sort_with_data ()

-- GSList*     g_slist_sort_with_data          (GSList *list, GCompareDataFunc compare_func, gpointer user_data);

-- Like g_slist_sort(), but the sort function accepts a user data argument.
-- list : 	a GSList
-- compare_func : 	comparison function.
-- user_data : 	data to pass to comparison function.
-- Returns : 	new head of the list.
-- g_slist_concat ()

-- GSList*     g_slist_concat                  (GSList *list1, GSList *list2);

-- Adds the second GSList onto the end of the first GSList. Note that the elements of the second GSList are not copied. They are used directly.
-- list1 : 	a GSList.
-- list2 : 	the GSList to add to the end of the first GSList.
-- Returns : 	the start of the new GSList.
-- g_slist_foreach ()

-- void        g_slist_foreach                 (GSList *list, GFunc func, gpointer user_data);

-- Calls a function for each element of a GSList.
-- list : 	a GSList.
-- func : 	the function to call with each element's data.
-- user_data : 	user data to pass to the function.
-- g_slist_last ()

-- GSList*     g_slist_last                    (GSList *list);

-- Gets the last element in a GSList.
-- list : 	a GSList.
-- Returns : 	the last element in the GSList, or NULL if the GSList has no elements.
-- g_slist_next()

-- #define     g_slist_next(slist)

-- A convenience macro to gets the next element in a GSList.
-- slist : 	an element in a GSList.
-- Returns : 	the next element, or NULL if there are no more elements.
-- g_slist_nth ()

-- GSList*     g_slist_nth                     (GSList *list, guint n);

-- Gets the element at the given position in a GSList.
-- list : 	a GSList.
-- n : 	the position of the element, counting from 0.
-- Returns : 	the element, or NULL if the position is off the end of the GSList.
-- g_slist_nth_data ()

-- gpointer    g_slist_nth_data                (GSList *list, guint n);

-- Gets the data of the element at the given position.
-- list : 	a GSList.
-- n : 	the position of the element.
-- Returns : 	the element's data, or NULL if the position is off the end of the GSList.
-- g_slist_find ()

-- GSList*     g_slist_find                    (GSList *list, gconstpointer data);

-- Finds the element in a GSList which contains the given data.
-- list : 	a GSList.
-- data : 	the element data to find.
-- Returns : 	the found GSList element, or NULL if it is not found.
-- g_slist_find_custom ()

-- GSList*     g_slist_find_custom             (GSList *list, gconstpointer data, GCompareFunc func);

-- Finds an element in a GSList, using a supplied function to find the desired element. It iterates over the list, calling the given function which should return 0 when the desired element is found. The function takes two gconstpointer arguments, the GSList element's data as the first argument and the given user data.
-- list : 	a GSList.
-- data : 	user data passed to the function.
-- func : 	the function to call for each element. It should return 0 when the desired element is found.
-- Returns : 	the found GSList element, or NULL if it is not found.
-- g_slist_position ()

-- gint        g_slist_position                (GSList *list, GSList *llink);

-- Gets the position of the given element in the GSList (starting from 0).
-- list : 	a GSList.
-- llink : 	an element in the GSList.
-- Returns : 	the position of the element in the GSList, or -1 if the element is not found.
-- g_slist_index ()

-- gint        g_slist_index                   (GSList *list, gconstpointer data);

-- Gets the position of the element containing the given data (starting from 0).
-- list : 	a GSList.
-- data : 	the data to find.
-- Returns : 	the index of the element containing the data, or -1 if the data is not found.
-- g_slist_push_allocator ()

-- void        g_slist_push_allocator          (GAllocator *allocator);

-- Sets the allocator to use to allocate GSList elements. Use g_slist_pop_allocator() to restore the previous allocator.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
-- allocator : 	the GAllocator to use when allocating GSList elements.
-- g_slist_pop_allocator ()

-- void        g_slist_pop_allocator           (void);

-- Restores the previous GAllocator, used when allocating GSList elements.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools

feature {} -- Implementation
	wrapper (a_ptr: POINTER): STRING
		do
			create Result.from_external(a_ptr)
			debug print_notice end
		end

	print_notice
		once
			print("[
					 G_SLIST_STRING.wrapper does not copy the C string; the Eiffel STRING will use
					 the same memory buffer.					 
					 ]")
		end
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GSList)"
		end
end



