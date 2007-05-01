indexing
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_SINGLY_LINKED_LISTS
-- Singly-Linked Lists

-- Singly-Linked Lists %GÅ‚Äî%@ linked lists containing integer values or pointers to data, limited to iterating over the list in one direction.
	
-- Synopsis

-- #include <glib.h>


--             GSList;

-- GSList*     g_slist_alloc                   (void);
-- GSList*     g_slist_append                  (GSList *list,
--                                              gpointer data);
-- GSList*     g_slist_prepend                 (GSList *list,
--                                              gpointer data);
-- GSList*     g_slist_insert                  (GSList *list,
--                                              gpointer data,
--                                              gint position);
-- GSList*     g_slist_insert_before           (GSList *slist,
--                                              GSList *sibling,
--                                              gpointer data);
-- GSList*     g_slist_insert_sorted           (GSList *list,
--                                              gpointer data,
--                                              GCompareFunc func);
-- GSList*     g_slist_remove                  (GSList *list,
--                                              gconstpointer data);
-- GSList*     g_slist_remove_link             (GSList *list,
--                                              GSList *link_);
-- GSList*     g_slist_delete_link             (GSList *list,
--                                              GSList *link_);
-- GSList*     g_slist_remove_all              (GSList *list,
--                                              gconstpointer data);
-- void        g_slist_free                    (GSList *list);
-- void        g_slist_free_1                  (GSList *list);

-- guint       g_slist_length                  (GSList *list);
-- GSList*     g_slist_copy                    (GSList *list);
-- GSList*     g_slist_reverse                 (GSList *list);
-- GSList*     g_slist_sort                    (GSList *list,
--                                              GCompareFunc compare_func);
-- GSList*     g_slist_sort_with_data          (GSList *list,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);
-- GSList*     g_slist_concat                  (GSList *list1,
--                                              GSList *list2);
-- void        g_slist_foreach                 (GSList *list,
--                                              GFunc func,
--                                              gpointer user_data);

-- GSList*     g_slist_last                    (GSList *list);
-- #define     g_slist_next                    (slist)
-- GSList*     g_slist_nth                     (GSList *list,
--                                              guint n);
-- gpointer    g_slist_nth_data                (GSList *list,
--                                              guint n);

-- GSList*     g_slist_find                    (GSList *list,
--                                              gconstpointer data);
-- GSList*     g_slist_find_custom             (GSList *list,
--                                              gconstpointer data,
--                                              GCompareFunc func);
-- gint        g_slist_position                (GSList *list,
--                                              GSList *llink);
-- gint        g_slist_index                   (GSList *list,
--                                              gconstpointer data);

-- void        g_slist_push_allocator          (GAllocator *allocator);
-- void        g_slist_pop_allocator           (void);

-- Description

-- The GSList structure and its associated functions provide a standard singly-linked list data structure.

-- Each element in the list contains a piece of data, together with a pointer which links to the next element in the list. Using this pointer it is possible to move through the list in one direction only (unlike the Doubly-Linked Lists which allow movement in both directions).

-- The data contained in each element can be either integer values, by using one of the Type Conversion Macros, or simply pointers to any type of data.

-- List elements are allocated in blocks using a GAllocator, which is more efficient than allocating elements individually.

-- Note that most of the GSList functions expect to be passed a pointer to the first element in the list. The functions which insert elements return the new start of the list, which may have changed.

-- There is no function to create a GSList. NULL is considered to be the empty list so you simply set a GSList* to NULL.

-- To add elements, use g_slist_append(), g_slist_prepend(), g_slist_insert() and g_slist_insert_sorted().

-- To remove elements, use g_slist_remove().

-- To find elements in the list use g_slist_last(), g_slist_next(), g_slist_nth(), g_slist_nth_data(), g_slist_find() and g_slist_find_custom().

-- To find the index of an element use g_slist_position() and g_slist_index().

-- To call a function for each element in the list use g_slist_foreach().

-- To free the entire list, use g_slist_free().
-- Details
-- GSList

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
-- g_slist_append ()

-- GSList*     g_slist_append                  (GSList *list,
--                                              gpointer data);

-- Adds a new element on to the end of the list.
-- Note

-- The return value is the new start of the list, which may have changed, so make sure you store the new value.
-- Note

-- Note that g_slist_append() has to traverse the entire list to find the end, which is inefficient when adding multiple elements. A common idiom to avoid the inefficiency is to prepend the elements and reverse the list when all elements have been added.

--   /* Notice that these are initialized to the empty list. */
--   GSList *list = NULL, *number_list = NULL;

--   /* This is a list of strings. */
--   list = g_slist_append (list, "first");
--   list = g_slist_append (list, "second");

--   /* This is a list of integers. */
--   number_list = g_slist_append (number_list, GINT_TO_POINTER (27));
--   number_list = g_slist_append (number_list, GINT_TO_POINTER (14));

-- list : 	a GSList.
-- data : 	the data for the new element.
-- Returns : 	the new start of the GSList.
-- g_slist_prepend ()

-- GSList*     g_slist_prepend                 (GSList *list,
--                                              gpointer data);

-- Adds a new element on to the start of the list.
-- Note

-- The return value is the new start of the list, which may have changed, so make sure you store the new value.

--   /* Notice that it is initialized to the empty list. */
--   GSList *list = NULL;
--   list = g_slist_prepend (list, "last");
--   list = g_slist_prepend (list, "first");

-- list : 	a GSList.
-- data : 	the data for the new element.
-- Returns : 	the new start of the GSList.
-- g_slist_insert ()

-- GSList*     g_slist_insert                  (GSList *list,
--                                              gpointer data,
--                                              gint position);

-- Inserts a new element into the list at the given position.
-- list : 	a GSList.
-- data : 	the data for the new element.
-- position : 	the position to insert the element. If this is negative, or is larger than the number of elements in the list, the new element is added on to the end of the list.
-- Returns : 	the new start of the GSList.
-- g_slist_insert_before ()

-- GSList*     g_slist_insert_before           (GSList *slist,
--                                              GSList *sibling,
--                                              gpointer data);

-- Inserts a node before sibling containing data. Returns the new head of the list.
-- slist : 	a GSList.
-- sibling : 	node to insert data before.
-- data : 	data to put in the newly-inserted node.
-- Returns : 	new head of the list.
-- g_slist_insert_sorted ()

-- GSList*     g_slist_insert_sorted           (GSList *list,
--                                              gpointer data,
--                                              GCompareFunc func);

-- Inserts a new element into the list, using the given comparison function to determine its position.
-- list : 	a GSList.
-- data : 	the data for the new element.
-- func : 	the function to compare elements in the list. It should return a number > 0 if the first parameter comes after the second parameter in the sort order.
-- Returns : 	the new start of the GSList.
-- g_slist_remove ()

-- GSList*     g_slist_remove                  (GSList *list,
--                                              gconstpointer data);

-- Removes an element from a GSList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the GSList is unchanged.
-- list : 	a GSList.
-- data : 	the data of the element to remove.
-- Returns : 	the new start of the GSList.
-- g_slist_remove_link ()

-- GSList*     g_slist_remove_link             (GSList *list,
--                                              GSList *link_);

-- Removes an element from a GSList, without freeing the element. The removed element's next link is set to NULL, so that it becomes a self-contained list with one element.
-- list : 	a GSList.
-- link_ : 	an element in the GSList.
-- Returns : 	the new start of the GSList, without the element.
-- g_slist_delete_link ()

-- GSList*     g_slist_delete_link             (GSList *list,
--                                              GSList *link_);

-- Deletes a node of list. Returns the new list head.
-- list : 	a GSList.
-- link_ : 	node to delete.
-- Returns : 	new head of list.
-- g_slist_remove_all ()

-- GSList*     g_slist_remove_all              (GSList *list,
--                                              gconstpointer data);

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

-- GSList*     g_slist_sort                    (GSList *list,
--                                              GCompareFunc compare_func);

-- Sorts a GSList using the given comparison function.
-- list : 	a GSList.
-- compare_func : 	the comparison function used to sort the GSList. This function is passed the data from 2 elements of the GSList and should return 0 if they are equal, a negative value if the first element comes before the second, or a positive value if the first element comes after the second.
-- Returns : 	the start of the sorted GSList.
-- g_slist_sort_with_data ()

-- GSList*     g_slist_sort_with_data          (GSList *list,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Like g_slist_sort(), but the sort function accepts a user data argument.
-- list : 	a GSList
-- compare_func : 	comparison function.
-- user_data : 	data to pass to comparison function.
-- Returns : 	new head of the list.
-- g_slist_concat ()

-- GSList*     g_slist_concat                  (GSList *list1,
--                                              GSList *list2);

-- Adds the second GSList onto the end of the first GSList. Note that the elements of the second GSList are not copied. They are used directly.
-- list1 : 	a GSList.
-- list2 : 	the GSList to add to the end of the first GSList.
-- Returns : 	the start of the new GSList.
-- g_slist_foreach ()

-- void        g_slist_foreach                 (GSList *list,
--                                              GFunc func,
--                                              gpointer user_data);

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

-- GSList*     g_slist_nth                     (GSList *list,
--                                              guint n);

-- Gets the element at the given position in a GSList.
-- list : 	a GSList.
-- n : 	the position of the element, counting from 0.
-- Returns : 	the element, or NULL if the position is off the end of the GSList.
-- g_slist_nth_data ()

-- gpointer    g_slist_nth_data                (GSList *list,
--                                              guint n);

-- Gets the data of the element at the given position.
-- list : 	a GSList.
-- n : 	the position of the element.
-- Returns : 	the element's data, or NULL if the position is off the end of the GSList.
-- g_slist_find ()

-- GSList*     g_slist_find                    (GSList *list,
--                                              gconstpointer data);

-- Finds the element in a GSList which contains the given data.
-- list : 	a GSList.
-- data : 	the element data to find.
-- Returns : 	the found GSList element, or NULL if it is not found.
-- g_slist_find_custom ()

-- GSList*     g_slist_find_custom             (GSList *list,
--                                              gconstpointer data,
--                                              GCompareFunc func);

-- Finds an element in a GSList, using a supplied function to find the desired element. It iterates over the list, calling the given function which should return 0 when the desired element is found. The function takes two gconstpointer arguments, the GSList element's data as the first argument and the given user data.
-- list : 	a GSList.
-- data : 	user data passed to the function.
-- func : 	the function to call for each element. It should return 0 when the desired element is found.
-- Returns : 	the found GSList element, or NULL if it is not found.
-- g_slist_position ()

-- gint        g_slist_position                (GSList *list,
--                                              GSList *llink);

-- Gets the position of the given element in the GSList (starting from 0).
-- list : 	a GSList.
-- llink : 	an element in the GSList.
-- Returns : 	the position of the element in the GSList, or -1 if the element is not found.
-- g_slist_index ()

-- gint        g_slist_index                   (GSList *list,
--                                              gconstpointer data);

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
end
