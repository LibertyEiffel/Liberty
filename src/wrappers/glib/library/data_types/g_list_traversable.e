indexing
	description: "The G_LIST_TRAVERSABLE provides a standard singly-linked list data structure. Objects of this class may be in a frozen state. Therefore it cannot conform to the standard class COLLECTION. See also classes G_LIST and G_SLIST."
	copyright: "(C) 2006, 2008 Paolo Redaelli, Raphael Mack "
	license: "LGPL v2 or later"
	date: "$Date: 2008-11-30 00:48:25 +0100 (dom, 30 nov 2008) $"
	revision: "$Revision: 1101 $"

deferred class G_LIST_TRAVERSABLE [ITEM_->WRAPPER]
	-- A standard singly-linked list which may be "frozen", refusing further
	-- any changes until "thawed".
	
	-- Because of this feature it cannot conform to COLLECTION since the latter
	-- allows to be changed anytime throught its features. See also G_LIST and
	-- G_SLIST.  

inherit
	WRAPPER
   
   TRAVERSABLE[ITEM_]
      undefine
         copy
      redefine
         is_equal
      end
   
   WRAPPER_FACTORY[ITEM_]

insert
	GLIST_EXTERNALS
		undefine
			fill_tagged_out_memory
		end
	GLIST_STRUCT

feature {WRAPPER, WRAPPER_HANDLER} -- object creation
	make is
		do
			-- There is no function to create a GList. NULL is considered
			-- to be the empty list so you simply set a GList* to NULL.

			-- Note: a NULL pointer is the actual *valid* empty
			-- G_LIST. Therefore any handle.is_not_null postcondition
			-- shall be circumvented. 

			-- Note that most of the GList functions expect to be passed
			-- a pointer to the first element in the list. The functions
			-- which insert elements return the new start of the list,
			-- which may have changed.
			handle := default_pointer
		end
   
feature {ANY} -- data access
	first: ITEM_ is
		local
         p: POINTER -- Item Pointer
		do
			p:=glist_struct_get_data (handle)
			if p.is_not_null 
				then Result:=wrapper(p) 
			end
		end

	last: like first is
		local p: POINTER -- Item Pointer
		do
			p := glist_struct_get_data (g_list_last (handle))
			if p.is_not_null 
				then Result := wrapper(p) 
			end
		end

	item (i: INTEGER): like first is
		local p: POINTER -- Item Pointer
		do
			p := g_list_nth_data (handle, i.to_natural_32)
			if p.is_not_null then 
				Result := wrapper(p) 
			end
		end

	has (x: like first): BOOLEAN is
			-- Look for `x' using is_equal for comparison. 
		local i: ITERATOR[ITEM_]; p: POINTER
		do
			if x/=Void then
				from i:=new_iterator; i.start until Result=True or else i.is_off
				loop 
					Result := x.is_equal(i.item)
					i.next
				end
			else
				from p:=handle 
				until p.is_null or else glist_struct_get_data(p).is_null
				loop
					p:=glist_struct_get_next(p)
				end
			end

		end
	
	fast_has (x: like first): BOOLEAN is
			-- Look for x using basic = for comparison.
		do
			if (g_list_find(handle,x.handle).is_not_null)
			then Result:=True
			else check Result=False end
			end
		end
	
	first_index_of (element: like first): INTEGER is
			-- Give the index of the first occurrence of element using
			-- is_equal for comparison. Answer upper + 1 when element is
			-- not inside.
		do
			Result:=g_list_index(handle,element.handle)
		end

	index_of (element: like first; start_index: INTEGER): INTEGER is
		do
			Result:=first_index_of(element)
		end

	reverse_index_of (element: like first; start_index: INTEGER): INTEGER is do not_yet_implemented end

	fast_first_index_of (element: like first): INTEGER is
			-- Give the index of the first occurrence of element using
			-- basic = for comparison. Answer upper + 1 when element is
			-- not inside.
		do
			not_yet_implemented -- TODO
		end

	fast_index_of (element: like first; start_index: INTEGER): INTEGER is do not_yet_implemented end

	fast_reverse_index_of (element: like first; start_index: INTEGER): INTEGER  is
			-- Using basic = comparison, gives the index of the first
			-- occurrence of element at or before start_index. Search is
			-- done in reverse direction, which means from the
			-- start_index down to the lower index . Answer lower -1 when
			-- the search fail.
		do
			not_yet_implemented -- TODO
		end

	is_equal_map (other: like Current): BOOLEAN is
			-- Do both collections have the same lower, upper, and items?
		do
			Result := is_equal(other)
		end

	is_equal (other: like Current): BOOLEAN is
			-- Do both collections have the same lower, upper, and items?
      local
		  ci, oi: ITERATOR[ITEM_]
         i, j: INTEGER
		do
			if count = other.count and then
				lower = other.lower then
				check
					upper = other.upper 
					-- shall be implied by the previous two checks
				end
				from 
					ci:=new_iterator; ci.start
					oi:=new_iterator; oi.start
				until not Result or else ci.is_off 
				loop
					Result := (ci.item = oi.item)
					ci.next; oi.next
				end
			end
		end

	all_default: BOOLEAN is
			--	Do all items have their type s default value? Note: for
			--	non Void items, the test is performed with the is_default
			--	predicate.
		do
			not_yet_implemented -- TODO
		end

	copy (other: like Current) is
		--  make `Current' a "shallow" copy of `other'
	do
		if handle.is_not_null then
			g_list_free (handle)
		end
		from_external_pointer (g_list_copy (other.handle))
	end

	occurrences (element: like first): INTEGER is
			-- Number of occurrences of element using is_equal for comparison.
		do
			not_yet_implemented -- TODO
		end

	fast_occurrences (element: like first): INTEGER is
		do
			not_yet_implemented -- TODO
		end
	

	slice (min, max: INTEGER): like Current is 
		do
			not_yet_implemented -- TODO
		end

	lower: INTEGER is 0

	upper: INTEGER is
		do
			Result := count
		end
	
	count: INTEGER is
		do
			Result := g_list_length(handle).to_integer_32
		end

	is_empty: BOOLEAN is
		do
			Result:= (handle.is_null)
		end

	from_collection (model: COLLECTION[ITEM_]) is do not_yet_implemented end

	new_iterator: ITERATOR[ITEM_] is
		do
			create {ITERATOR_ON_G_LIST[ITEM_]} Result.make (Current)
		end
	dispose is
			-- Frees all of the memory used by a GList. The freed
			-- elements are added to the GAllocator free list.
		do
			g_list_free (handle)
			handle:= default_pointer
		end

-- g_list_free_1 ()

-- void        g_list_free_1                  (GList *list);

-- Frees one GList element. It is usually used after g_list_remove_link().
-- list : 	a GList element.
-- g_list_length ()

-- guint       g_list_length                  (GList *list);

-- Gets the number of elements in a GList.
-- list : 	a GList.
-- Returns : 	the number of elements in the GList.
-- g_list_copy ()

-- GList*     g_list_copy                    (GList *list);

-- Copies a GList.

-- Note that this is a "shallow" copy. If the list elements consist of pointers to data, the pointers are copied but the actual data isn't.
-- list : 	a GList.
-- Returns : 	a copy of list.
-- g_list_reverse ()

-- GList*     g_list_reverse                 (GList *list);

-- Reverses a GList.
-- list : 	a GList.
-- Returns : 	the start of the reversed GList.
-- g_list_sort ()

-- GList*     g_list_sort                    (GList *list, GCompareFunc compare_func);

-- Sorts a GList using the given comparison function.
-- list : 	a GList.
-- compare_func : 	the comparison function used to sort the GList. This function is passed the data from 2 elements of the GList and should return 0 if they are equal, a negative value if the first element comes before the second, or a positive value if the first element comes after the second.
-- Returns : 	the start of the sorted GList.
-- g_list_sort_with_data ()

-- GList*     g_list_sort_with_data          (GList *list, GCompareDataFunc compare_func, gpointer user_data);

-- Like g_list_sort(), but the sort function accepts a user data argument.
-- list : 	a GList
-- compare_func : 	comparison function.
-- user_data : 	data to pass to comparison function.
-- Returns : 	new head of the list.
-- g_list_concat ()

-- GList*     g_list_concat                  (GList *list1, GList *list2);

-- Adds the second GList onto the end of the first GList. Note that the elements of the second GList are not copied. They are used directly.
-- list1 : 	a GList.
-- list2 : 	the GList to add to the end of the first GList.
-- Returns : 	the start of the new GList.
-- g_list_foreach ()

-- void        g_list_foreach                 (GList *list, GFunc func, gpointer user_data);

-- Calls a function for each element of a GList.
-- list : 	a GList.
-- func : 	the function to call with each element's data.
-- user_data : 	user data to pass to the function.
-- g_list_last ()

-- GList*     g_list_last                    (GList *list);

-- Gets the last element in a GList.
-- list : 	a GList.
-- Returns : 	the last element in the GList, or NULL if the GList has no elements.
-- g_list_next()

-- #define     g_list_next(slist)

-- A convenience macro to gets the next element in a GList.
-- slist : 	an element in a GList.
-- Returns : 	the next element, or NULL if there are no more elements.
-- g_list_nth ()

-- GList*     g_list_nth                     (GList *list, guint n);

-- Gets the element at the given position in a GList.
-- list : 	a GList.
-- n : 	the position of the element, counting from 0.
-- Returns : 	the element, or NULL if the position is off the end of the GList.
-- g_list_nth_data ()

-- gpointer    g_list_nth_data                (GList *list, guint n);

-- Gets the data of the element at the given position.
-- list : 	a GList.
-- n : 	the position of the element.
-- Returns : 	the element's data, or NULL if the position is off the end of the GList.
-- g_list_find ()

-- GList*     g_list_find                    (GList *list, gconstpointer data);

-- Finds the element in a GList which contains the given data.
-- list : 	a GList.
-- data : 	the element data to find.
-- Returns : 	the found GList element, or NULL if it is not found.
-- g_list_find_custom ()

-- GList*     g_list_find_custom             (GList *list, gconstpointer data, GCompareFunc func);

-- Finds an element in a GList, using a supplied function to find the desired element. It iterates over the list, calling the given function which should return 0 when the desired element is found. The function takes two gconstpointer arguments, the GList element's data as the first argument and the given user data.
-- list : 	a GList.
-- data : 	user data passed to the function.
-- func : 	the function to call for each element. It should return 0 when the desired element is found.
-- Returns : 	the found GList element, or NULL if it is not found.
-- g_list_position ()

-- gint        g_list_position                (GList *list, GList *llink);

-- Gets the position of the given element in the GList (starting from 0).
-- list : 	a GList.
-- llink : 	an element in the GList.
-- Returns : 	the position of the element in the GList, or -1 if the element is not found.
-- g_list_index ()

-- gint        g_list_index                   (GList *list, gconstpointer data);

-- Gets the position of the element containing the given data (starting from 0).
-- list : 	a GList.
-- data : 	the data to find.
-- Returns : 	the index of the element containing the data, or -1 if the data is not found.
-- g_list_push_allocator ()

-- void        g_list_push_allocator          (GAllocator *allocator);

-- Sets the allocator to use to allocate GList elements. Use g_list_pop_allocator() to restore the previous allocator.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
-- allocator : 	the GAllocator to use when allocating GList elements.
-- g_list_pop_allocator ()

-- void        g_list_pop_allocator           (void);

-- Restores the previous GAllocator, used when allocating GList elements.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools


	manifest_put (an_index: INTEGER; element: like item) is
		do
			not_yet_implemented
		end


end
