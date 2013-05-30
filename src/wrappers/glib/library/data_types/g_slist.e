indexing
	description: "The GSList provides a standard singly-linked list data %
   %structure. See also G_SLIST_TRAVERSABLE."
	copyright: "2008 Raphael Mack, 2010 Paolo Redaelli"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_SLIST [ITEM_->WRAPPER]
 
	-- Some GLib-using libraries requires that some instances of
	-- GList shall be modified only by the library, making it
	-- effectively freezed for the developer. In those cases
	-- G_LIST_TRAVERSABLE shall be used in place of G_LIST.  If the
	-- library allows its clients to change the lists it returns it
	-- will return a G_LIST.
   
inherit
	G_SLIST_TRAVERSABLE[ITEM_]
		undefine
	  		out_in_tagged_out_memory, 
			fill_tagged_out_memory
		end
   
	COLLECTION[ITEM_]
		undefine 
			has,
			fast_has,
			swap
		redefine
			append_collection,
			clear_all
		end

feature {ANY}
	put (an_item: like first; i: INTEGER) is
		require
			valid_item: an_item /= Void 
		do
			gslist_struct_set_data (g_slist_nth(handle,i.to_natural_32), an_item.handle)
		end
	
	slice (min, max: INTEGER): like Current is do not_yet_implemented end

	swap (i,j: INTEGER) is
		local ith,jth,tmp: POINTER;
			in,jn: NATURAL_32
		do
			in := i.to_natural_32
			jn := j.to_natural_32
			ith := g_slist_nth_data (handle,in)
			jth := g_slist_nth_data (handle,jn)

			tmp := gslist_struct_get_data(ith)
			gslist_struct_set_data (ith, gslist_struct_get_data(jth))
			gslist_struct_set_data (jth, tmp)
		end

	set_all_with (v: like first) is
		local ith: POINTER
		do
			from ith := handle
			until ith.is_null
			loop
				gslist_struct_set_data (ith, v.handle)
				ith := gslist_struct_get_next (ith)
			end
		end

	clear_all is do not_yet_implemented end

	add_first (an_item: like first) is
			-- Adds `an_item' on to the start of the list.
		require 
			valid_item: an_item/=Void
		do
			handle := g_slist_prepend (handle, an_item.handle)
			-- Note: The return value is the new start of the list, which
			-- may have changed, so make sure you store the new value.

			-- /* Notice that it is initialized to the empty list. */
			-- GSList *list = NULL; list = g_slist_prepend (list,
			-- "last"); list = g_slist_prepend (list, "first");
		end

	add_last (an_item: like first) is
			-- Adds `an_item' on to the end of the list.  Note: this
			-- feature has to traverse the entire list to find the end,
			-- which is inefficient when adding multiple elements. A
			-- common idiom to avoid the inefficiency is to prepend the
			-- elements and reverse the list when all elements have been
			-- added.
		require
			valid_item: an_item/=Void
		do
			handle := g_slist_append (handle, an_item.handle)

			-- Note: The return value is the new start of the list, which
			-- may have changed, so make sure you store the new value.
		end

	add (element: like first; an_index: INTEGER) is
			-- Add `element' at `an_index`
		require
			element /= Void
		do
			handle := g_slist_insert (handle, element.handle, an_index)
		end
	
	append_collection (other: COLLECTION[ITEM_]) is
			--
		do
			not_yet_implemented -- TODO
		end

	force (element: like first; an_index: INTEGER) is do not_yet_implemented end

	remove_first is
		do
			handle := g_slist_delete_link (handle, handle)
		end

	remove (an_index: INTEGER) is
		do
			handle := g_slist_delete_link (handle, g_slist_nth_data (handle, an_index.to_natural_32))
		end

	remove_head (n: INTEGER) is
		do
			n.times(agent remove_first)
		end

	remove_tail (n: INTEGER) is
		do
			reverse
			remove_head(n)
			reverse
		end

	remove_last is
		do
			handle:=g_slist_delete_link (handle,g_slist_last (handle))
		end

	clear_count, clear_count_and_capacity is
			-- Discard all items (is_empty is True after that call). Frees
			-- all of the memory used by a GSList. The freed elements are
			-- added to the GAllocator free list.
		do
			g_slist_free (handle)
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
			handle:=g_slist_reverse (handle)
			g_slist_free (handle) -- TODO is this call correct?
		end

	from_collection (model: COLLECTION[ITEM_]) is
		local i: ITERATOR[ITEM_]
		do
			from i:=model.new_iterator; i.start
			until not i.is_off
			loop add_first(i.item); i.next
			end
			reverse
		end
	
end
