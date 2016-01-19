indexing
	description: "The GList provides a standard doubly-linked list data %
   %structure. See also G_LIST_TRAVERSABLE."
	copyright: "2008 Raphael Mack"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_LIST [ITEM_->WRAPPER]

   -- TODO: add test for all COLLECTION features (modify the version 
   -- from SE testsuite?)
   
	-- Some GLib-using libraries requires that some instances of
	-- GList shall be modified only by the library, making it
	-- effectively freezed for the developer. In those cases
	-- G_LIST_TRAVERSABLE shall be used in place of G_LIST.  If the
	-- library allows its clients to change the lists it returns it
	-- will return a G_LIST.
  

inherit
	G_LIST_TRAVERSABLE[ITEM_]
		undefine
			out_in_tagged_out_memory,
			fill_tagged_out_memory
		end
	COLLECTION[ITEM_]
		undefine
			swap,
			has,
			fast_has,
			clear_all,
			append_collection
	  end
feature {ANY}
	put (an_item: like first; i: INTEGER) is
         --
      do
         glist_struct_set_data (g_list_nth(handle,i.to_natural_32), an_item.handle)
      end
   
	swap (i,j: INTEGER) is
         -- exchange two elements
      local
         ith,jth,tmp: POINTER
		 in,jn: NATURAL_32
      do
		 in := i.to_natural_32; jn := j.to_natural_32
         ith := g_list_nth_data (handle,in)
         jth := g_list_nth_data (handle,jn)

         tmp := glist_struct_get_data(ith)
         glist_struct_set_data (ith, glist_struct_get_data(jth))
         glist_struct_set_data (jth, tmp)
      end

	set_all_with (v: like first) is
			--
		local
         ith:POINTER
		do
			from ith:=handle
			until ith.is_null
			loop
				glist_struct_set_data (ith, v.handle)
				ith := glist_struct_get_next (ith)
			end
		end

	clear_all is do not_yet_implemented end

	add_first (element: like first) is
			-- 
		do
			handle := g_list_prepend (handle, element.handle)
		end

	add_last (element: like first) is
         -- Note that add_last has to traverse the entire list to find
         -- the end, which is inefficient when adding multiple
         -- elements. A common idiom to avoid the inefficiency is to
         -- prepend the elements and reverse the list when all
         -- elements have been added.
      do
         handle := g_list_append (handle, element.handle)
		end

	add (element: like first; an_index: INTEGER) is
		do
			handle := g_list_insert (handle, element.handle, an_index)
		end
	
	append_collection (other: COLLECTION[ITEM_]) is
		do
			other.do_all(agent add_last)
		end

	force (element: like first; an_index: INTEGER) is
      do
         not_yet_implemented
         -- TODO
      end

	remove_first is
		require not is_empty
		do
			handle:=g_list_delete_link (handle, handle)
		end

	remove (an_index: INTEGER) is
		require 
			not is_empty
			valid_index(an_index)
		do
			handle:=g_list_delete_link (handle, g_list_nth_data (handle, an_index.to_natural_32))
		end

	remove_head (n: INTEGER) is
		require 
			n < count	
		do
			-- Ohh, how long I longed to write it *THIS* way! Thanks Adrian! Paolo 2010-05-30
			n.times(agent remove_first)
		end

	remove_tail (n: INTEGER) is
		require 
			n < count 
		do
			-- Ohh, how long I longed to write it *THIS* way! Thanks Adrian! Paolo 2010-05-30
			n.times(agent remove_last)
		end

	remove_last is
		require 
			not is_empty
		do
			handle:=g_list_delete_link (handle,g_list_last (handle))
		end

	clear_count, clear_count_and_capacity is
			-- Discard all items (is_empty is True after that call). Frees
			-- all of the memory used by a GList. The freed elements are
			-- added to the GAllocator free list.
		do
			g_list_free (handle)
			handle := default_pointer
		end

	replace_all (old_value, new_value: like first) is
		do
			not_yet_implemented -- TODO
		end

	fast_replace_all (old_value, new_value: like first) is
		do
			not_yet_implemented -- TODO
		end

	reverse is
		local old_handle: POINTER
		do
			old_handle := handle
			handle:=g_list_reverse (old_handle)
		end

	append (an_item: like first) is
			-- Adds `an_item' on to the end of the list.
		do
			handle:=g_list_append (handle, an_item.handle)

			-- Note: The return value is the new start of the list, which may have changed, so make sure you store the new value.
			
			-- Note: g_list_append() has to traverse the entire list to
			-- find the end, which is inefficient when adding multiple
			-- elements. A common idiom to avoid the inefficiency is to
			-- prepend the elements and reverse the list when all
			-- elements have been added.

			--   /* Notice that these are initialized to the empty list. */
			--   GList *list = NULL, *number_list = NULL;
			
			--   /* This is a list of strings. */
			--   list = g_list_append (list, "first");
			--   list = g_list_append (list, "second");
			
			--   /* This is a list of integers. */
			--   number_list = g_list_append (number_list, GINT_TO_POINTER (27));
			--   number_list = g_list_append (number_list, GINT_TO_POINTER (14));
		end

	prepend  (an_item: like first) is
			-- Adds a new element on to the start of the list.
		require valid_item: an_item/=Void
		do
			handle := g_list_prepend (handle,an_item.handle)
			-- Note: The return value is the new start of the list, which
			-- may have changed, so make sure you store the new value.

			-- /* Notice that it is initialized to the empty list. */
			-- GList *list = NULL; list = g_list_prepend (list,
			-- "last"); list = g_list_prepend (list, "first");
		end


-- g_list_insert ()

-- GList*     g_list_insert                  (GList *list, gpointer data, gint position);

-- Inserts a new element into the list at the given position.
-- list : 	a GList.
-- data : 	the data for the new element.
-- position : 	the position to insert the element. If this is negative, or is larger than the number of elements in the list, the new element is added on to the end of the list.
-- Returns : 	the new start of the GList.
-- g_list_insert_before ()

-- GList*     g_list_insert_before           (GList *slist, GList *sibling, gpointer data);

-- Inserts a node before sibling containing data. Returns the new head of the list.
-- slist : 	a GList.
-- sibling : 	node to insert data before.
-- data : 	data to put in the newly-inserted node.
-- Returns : 	new head of the list.
-- g_list_insert_sorted ()

-- GList*     g_list_insert_sorted           (GList *list, gpointer data, GCompareFunc func);

-- Inserts a new element into the list, using the given comparison function to determine its position.
-- list : 	a GList.
-- data : 	the data for the new element.
-- func : 	the function to compare elements in the list. It should return a number > 0 if the first parameter comes after the second parameter in the sort order.
-- Returns : 	the new start of the GList.
-- g_list_remove ()

-- GList*     g_list_remove                  (GList *list, gconstpointer data);

-- Removes an element from a GList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the GList is unchanged.
-- list : 	a GList.
-- data : 	the data of the element to remove.
-- Returns : 	the new start of the GList.
-- g_list_remove_link ()

-- GList*     g_list_remove_link             (GList *list, GList *link_);

-- Removes an element from a GList, without freeing the element. The removed element's next link is set to NULL, so that it becomes a self-contained list with one element.
-- list : 	a GList.
-- link_ : 	an element in the GList.
-- Returns : 	the new start of the GList, without the element.
-- g_list_delete_link ()

-- GList*     g_list_delete_link             (GList *list, GList *link_);

-- Deletes a node of list. Returns the new list head.
-- list : 	a GList.
-- link_ : 	node to delete.
-- Returns : 	new head of list.
-- g_list_remove_all ()

-- GList*     g_list_remove_all              (GList *list, gconstpointer data);

-- Removes all list nodes with data equal to data. Returns the new head of the list. Contrast with g_list_remove() which removes only the first node matching the given data.
-- list : 	a GList.
-- data : 	data to remove.
-- Returns : 	new head of list.


end
