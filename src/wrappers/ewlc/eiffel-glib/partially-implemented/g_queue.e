note
	description: "Double-ended Queue data structure."
	copyright: "[
					Copyright (C) 2005 eiffel-libraries team, GTK+ team
					
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

class G_QUEUE [ITEM->WRAPPER]
	-- The GQueue structure and its associated functions provide a
	-- standard queue data structure. Internally, GQueue uses the same
	-- data structure as GList to store elements.

inherit 
	-- TODO: QUEUE
	WRAPPER_COLLECTION
		redefine
			copy,
			dispose
		end

create {ANY}  make, copy, from_external_pointer

feature {ANY} -- Copying

	copy (another: like Current) is
			-- Copies a queue. Note that is a shallow copy. If the elements in the
			-- queue consist of pointers to data, the pointers are copied, but the
			-- actual data is not.
		do
			handle := g_queue_copy (handle)
		end

feature {} -- Creation
	make is
			-- Creates a new GQueue.
		do
			handle:=g_queue_new
		end

	-- TODO: 	with_capacity (needed_capacity: INTEGER) is

feature {ANY}
	dispose is
			-- Frees the memory allocated for the GQueue.
		do
			g_queue_free (handle)
		end

	is_empty: BOOLEAN is
			-- Is the queue empty.
		do
			Result := (g_queue_is_empty(handle)).to_boolean
		end

	count: INTEGER is
			-- the number of items in queue.
			-- TODO: should be NATURAL
		do
			Result := g_queue_get_length (handle)
		ensure positive: Result >= 0
		end

	reverse is
			-- Reverses the order of the items in queue.
		do
			g_queue_reverse (handle)
		end


	foreach (a_procedure: PROCEDURE [TUPLE [like first]]) is
			-- Calls `a_procedure' for each element in the queue passing user_data
			-- to the function.
		do
			--g_queue_foreach (handle, (GQueue *queue, GFunc func, gpointer
			--user_data);
		end

	-- GList* g_queue_find (GQueue *queue, gconstpointer data);

	-- Finds the first link in queue which contains data.
	
	-- queue : 	a GQueue
	-- data : 	data to find
	-- Returns : 	The first link in queue which contains data.

	-- Since 2.4
	-- g_queue_find_custom ()

	-- GList* g_queue_find_custom (GQueue *queue, gconstpointer data,
	-- GCompareFunc func);

	-- Finds an element in a GQueue, using a supplied function to find the
	-- desired element. It iterates over the queue, calling the given function
	-- which should return 0 when the desired element is found. The function
	-- takes two gconstpointer arguments, the GQueue element's data as the first
	-- argument and the given user data as the second argument.

	-- queue : 	a GQueue
	-- data : 	user data passed to func
	-- func : 	a GCompareFunc to call for each element. It should return 0 when the desired element is found
	-- Returns : 	The found link, or NULL if it wasn't found

	-- Since 2.4
	-- g_queue_sort ()

	-- void g_queue_sort (GQueue *queue, GCompareDataFunc compare_func, gpointer
	-- user_data);
	
	-- Sorts queue using compare_func.

	-- queue : 	a GQueue

	-- compare_func : the GCompareDataFunc used to sort queue. This function is
	-- passed two elements of the queue and should return 0 if they are equal, a
	-- negative value if the first comes before the second, and a positive value
	-- if the second comes before the first.  -- user_data : user data passed to
	-- compare_func

	-- Since 2.4
	add (an_item: like first) is
			-- Adds `an_item' at the head of the queue.
		require item_not_void: an_item /= Void
		do
			g_queue_push_head (handle, an_item.handle)
		end
	
	add_last, push_tail (an_item: like first) is
			-- Adds `an_item' at the tail of the queue.
		require item_not_void: an_item /= Void
		do
			g_queue_push_tail (handle, an_item.handle)
		end

	put (an_item: like first; an_index: INTEGER) is
			-- Inserts `an_item' into queue at `an_index' position. If `an_index'
			-- is negative or larger than the number of elements in the queue, the
			-- element is added to the end of the queue.
		require item_not_void: an_item /= Void
		do
			g_queue_push_nth (handle, an_item.handle, an_index)
		end


	remove is
			-- Removes the first element of the queue.
		local ptr: POINTER
		do
			ptr := g_queue_pop_head (handle)
			-- g_queue_pop_head returns the data of the first element in the queue,
			-- or NULL if the queue is empty.
		end

	remove_tail is
			-- Removes the last element of the queue.
		local ptr: POINTER
		do
			ptr := g_queue_pop_tail (handle)
			-- g_queue_pop_tail returns the data of the last element in the queue,
			-- or NULL if the queue is empty.
		end

feature {ANY} -- Other features
	pop_nth (an_index: INTEGER): ITEM is
			-- Removes the element of queue at `an_index'. Void if is_empty
		require 
			unsigned_index: an_index >= 0
			valid_index: an_index.in_range (0, count)
		local ptr: POINTER
		do
			ptr := g_queue_pop_nth (handle, an_index)
			--  g_queue_pop_nth returns the element's data, or NULL if n
			--  is off the end of queue.			
			if ptr.is_not_null then
				Result := new_item
					Result.from_external_pointer (ptr)
			end	
		ensure is_empty implies Result = Void
		end

	first, head: ITEM is
			-- the first element of the queue.
		local ptr: POINTER
		do
			ptr := g_queue_peek_head (handle)				
			-- g_queue_peek_head returns the data of the first element in the
			-- queue, or NULL if the queue is empty.
			if ptr.is_not_null then
				Result := new_item
				Result.from_external_pointer (ptr)
			end	
		ensure is_empty implies Result = Void
		end
	
	last, tail: like first is
		local ptr: POINTER
		do
			ptr := g_queue_peek_tail (handle) 
			-- g_queue_peek_tail returns the last element of the
			-- queue. NULL if the queue is empty.
			if ptr.is_not_null then
				Result := new_item
				Result.from_external_pointer (ptr)
			end	
		ensure is_empty implies Result = Void
		end

	get_new_iterator: ITERATOR[ITEM] is
		obsolete "get_new_iterator is not implemented"
		do
			check implemented: False end
		end

feature {} -- Unwrapped API

-- g_queue_index ()

-- gint        g_queue_index                   (GQueue *queue,
--                                              gconstpointer data);

-- Returns the position of the first element in queue which contains data.

-- queue : 	a GQueue
-- data : 	the data to find.
-- Returns : 	The position of the first element in queue which contains data, or -1 if no element in queue contains data.

-- Since 2.4
-- g_queue_remove ()

-- void        g_queue_remove                  (GQueue *queue,
--                                              gconstpointer data);

-- Removes the first element in queue that contains data.

-- queue : 	a GQueue
-- data : 	data to remove.

-- Since 2.4
-- g_queue_remove_all ()

-- void        g_queue_remove_all              (GQueue *queue,
--                                              gconstpointer data);

-- Remove all elemeents in queue which contains data.

-- queue : 	a GQueue
-- data : 	data to remove

-- Since 2.4
-- g_queue_insert_before ()

-- void        g_queue_insert_before           (GQueue *queue,
--                                              GList *sibling,
--                                              gpointer data);

-- Inserts data into queue before sibling.

-- sibling must be part of queue.

-- queue : 	a GQueue
-- sibling : 	a GList link that must be part of queue
-- data : 	the data to insert

-- Since 2.4
-- g_queue_insert_after ()

-- void        g_queue_insert_after            (GQueue *queue,
--                                              GList *sibling,
--                                              gpointer data);

-- Inserts data into queue after sibling

-- sibling must be part of queue

-- queue : 	a GQueue
-- sibling : 	a GList link that must be part of queue
-- data : 	the data to insert

-- Since 2.4
-- g_queue_insert_sorted ()

-- void        g_queue_insert_sorted           (GQueue *queue,
--                                              gpointer data,
--                                              GCompareDataFunc func,
--                                              gpointer user_data);

-- Inserts data into queue using func to determine the new position.

-- queue : 	a GQueue
-- data : 	the data to insert
-- func : 	the GCompareDataFunc used to compare elements in the queue. It is called with two elements of the queue and user_data. It should return 0 if the elements are equal, a negative value if the first element comes before the second, and a positive value if the second element comes before the first.
-- user_data : 	user data passed to func.

-- Since 2.4
-- g_queue_push_head_link ()

-- void        g_queue_push_head_link          (GQueue *queue,
--                                              GList *link_);

-- Adds a new element at the head of the queue.

-- queue : 	a GQueue.
-- link_ : 	a single GList element, not a list with more than one element.
-- g_queue_push_tail_link ()

-- void        g_queue_push_tail_link          (GQueue *queue,
--                                              GList *link_);

-- Adds a new element at the tail of the queue.

-- queue : 	a GQueue.
-- link_ : 	a single GList element, not a list with more than one element.
-- g_queue_push_nth_link ()

-- void        g_queue_push_nth_link           (GQueue *queue,
--                                              gint n,
--                                              GList *link_);

-- Inserts link into queue at the given position.

-- queue : 	a GQueue
-- n : 	the position to insert the link. If this is negative or larger than the number of elements in queue, the link is added to the end of queue.
-- link_ : 	the link to add to queue

-- Since 2.4
-- g_queue_pop_head_link ()

-- GList*      g_queue_pop_head_link           (GQueue *queue);

-- Removes the first element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the GList element at the head of the queue, or NULL if the queue is empty.
-- g_queue_pop_tail_link ()

-- GList*      g_queue_pop_tail_link           (GQueue *queue);

-- Removes the last element of the queue.

-- queue : 	a GQueue.
-- Returns : 	the GList element at the tail of the queue, or NULL if the queue is empty.
-- g_queue_pop_nth_link ()

-- GList*      g_queue_pop_nth_link            (GQueue *queue,
--                                              guint n);

-- Removes and returns the link at the given position.

-- queue : 	a GQueue
-- n : 	the link's position
-- Returns : 	The n'th link, or NULL if n is off the end of queue.

-- Since 2.4
-- g_queue_peek_head_link ()

-- GList*      g_queue_peek_head_link          (GQueue *queue);

-- Returns the first link in queue

-- queue : 	a GQueue
-- Returns : 	the first link in queue, or NULL if queue is empty

-- Since 2.4
-- g_queue_peek_tail_link ()

-- GList*      g_queue_peek_tail_link          (GQueue *queue);

-- Returns the last link queue.

-- queue : 	a GQueue
-- Returns : 	the last link in queue, or NULL if queue is empty

-- Since 2.4
-- g_queue_peek_nth_link ()

-- GList*      g_queue_peek_nth_link           (GQueue *queue,
--                                              guint n);

-- Returns the link at the given position

-- queue : 	a GQueue
-- n : 	the position of the link
-- Returns : 	The link at the n'th position, or NULL if n is off the end of the list

-- Since 2.4
-- g_queue_link_index ()

-- gint        g_queue_link_index              (GQueue *queue,
--                                              GList *link_);

-- Returns the position of link_ in queue.

-- queue : 	a Gqueue
-- link_ : 	A GList link
-- Returns : 	The position of link_, or -1 if the link is not part of queue

-- Since 2.4
-- g_queue_unlink ()

-- void        g_queue_unlink                  (GQueue *queue,
--                                              GList *link_);

-- Unlinks link_ so that it will no longer be part of queue. The link is not freed.

-- link_ must be part of queue,

-- queue : 	a GQueue
-- link_ : 	a GList link that must be part of queue

-- Since 2.4
-- g_queue_delete_link ()

-- void        g_queue_delete_link             (GQueue *queue,
--                                              GList *link_);

-- Removes link_ from queue and frees it.

-- link_ must be part of queue.

-- queue : 	a GQueue
-- link_ : 	a GList link that must be part of queue

-- Since 2.4

	
feature {} -- struct GQueue

-- typedef struct {
--   GList *head;
--   GList *tail;
--   guint  length;
-- } GQueue;

-- Contains the public fields of a Queue.
-- GList *head; 	a pointer to the first element of the queue.
-- GList *tail; 	a pointer to the last element of the queue.
-- guint length; 	the number of elements in the queue.

	struct_size: INTEGER is
		external "C inline use <glib.h>"
		alias "sizeof(GQueue)"
		end

feature {} -- External calls

	g_queue_new: POINTER is -- GQueue*
		external "C use <glib.h>"
		end

	g_queue_free (a_queue: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_is_empty (a_queue: POINTER): INTEGER is -- gboolean
		external "C use <glib.h>"
		end

	g_queue_get_length (a_queue: POINTER): INTEGER is -- guint
			-- TODO: Result is guint, should be NATURAL
		external "C use <glib.h>"
		end
	
	g_queue_reverse (a_queue: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_copy (a_queue: POINTER): POINTER is -- GQueue*
		external "C use <glib.h>"
		end
	
	g_queue_foreach (a_queue, a_func, user_data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_find (a_queue, const_data: POINTER): POINTER is -- GList*
		external "C use <glib.h>"
		end
	
	g_queue_find_custom (a_queue, const_data, a_g_compare_func: POINTER): POINTER is -- GList*
		external "C use <glib.h>"
		end
	
	g_queue_sort (a_queue, a_g_compare_data_func, user_data: POINTER) is
		external "C use <glib.h>"
		end

	g_queue_push_head (a_queue, data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_push_tail (a_queue, data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_push_nth (a_queue, data: POINTER; an_index: INTEGER) is
		external "C use <glib.h>"
		end
	
	g_queue_pop_head (a_queue: POINTER): POINTER is -- gpointer
		external "C use <glib.h>"
		end
	
	g_queue_pop_tail (a_queue: POINTER): POINTER is -- gpointer
		external "C use <glib.h>"
		end
	
	g_queue_pop_nth (a_queue: POINTER; a_guint_n: INTEGER): POINTER is -- gpointer
			-- TODO: a_guint_n should be NATURAL
		external "C use <glib.h>"
		end
	
	g_queue_peek_head (a_queue: POINTER): POINTER is -- gpointer
		external "C use <glib.h>"
		end
	
	g_queue_peek_tail (a_queue: POINTER): POINTER is -- gpointer
		external "C use <glib.h>"
		end

	g_queue_peek_nth (a_queue: POINTER; a_guint_n: INTEGER): POINTER is -- gpointer
				-- TODO: a_guint_n should be NATURAL
		external "C use <glib.h>"
		end

	g_queue_index (a_queue, const_data: POINTER): INTEGER is -- gint
		external "C use <glib.h>"
		end
	
	g_queue_remove (a_queue, const_data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_remove_all (a_queue, const_data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_insert_before (a_queue, a_glist_sibling, some_data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_insert_after (a_queue, a_glist_sibling, some_data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_insert_sorted (a_queue, data, a_g_compare_data_func, user_data: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_push_head_link (a_queue, glist_link: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_push_tail_link (a_queue, glist_link: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_push_nth_link (a_queue: POINTER; an_index: INTEGER; glist_link: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_pop_head_link (a_queue: POINTER): POINTER is -- GList*
		external "C use <glib.h>"
		end
	
	g_queue_pop_tail_link (a_queue: POINTER): POINTER is -- GList*
		external "C use <glib.h>"
		end
	
	g_queue_pop_nth_link (a_queue: POINTER; a_guint_n: INTEGER): POINTER is -- GList*
			-- TODO: a_guint_n should be NATURAL
		external "C use <glib.h>"
		end

	g_queue_peek_head_link (a_queue: POINTER): POINTER is -- GList*
		external "C use <glib.h>"
		end
	
	g_queue_peek_tail_link (a_queue: POINTER): POINTER is -- GList*
		external "C use <glib.h>"
		end
	
	g_queue_peek_nth_link (a_queue: POINTER; a_guint_n: INTEGER): POINTER is -- GList*
			-- TODO: a_guint_n should be NATURAL
		external "C use <glib.h>"
		end
	
	g_queue_link_index (a_queue, glist_link: POINTER): INTEGER is -- gint
		external "C use <glib.h>"
		end

	g_queue_unlink (a_queue, glist_link: POINTER) is
		external "C use <glib.h>"
		end
	
	g_queue_delete_link (a_queue, glist_link: POINTER) is
		external "C use <glib.h>"
		end
end
