indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_DOUBLY_LINKED_LIST
-- 	Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Doubly-Linked Lists

-- Doubly-Linked Lists %GÅ‚Äî%@ linked lists containing integer values or pointers to data, with the ability to iterate over the list in both directions.
	
-- Synopsis

-- #include <glib.h>


--             GList;

-- GList*      g_list_append                   (GList *list,
--                                              gpointer data);
-- GList*      g_list_prepend                  (GList *list,
--                                              gpointer data);
-- GList*      g_list_insert                   (GList *list,
--                                              gpointer data,
--                                              gint position);
-- GList*      g_list_insert_before            (GList *list,
--                                              GList *sibling,
--                                              gpointer data);
-- GList*      g_list_insert_sorted            (GList *list,
--                                              gpointer data,
--                                              GCompareFunc func);
-- GList*      g_list_remove                   (GList *list,
--                                              gconstpointer data);
-- GList*      g_list_remove_link              (GList *list,
--                                              GList *llink);
-- GList*      g_list_delete_link              (GList *list,
--                                              GList *link_);
-- GList*      g_list_remove_all               (GList *list,
--                                              gconstpointer data);
-- void        g_list_free                     (GList *list);

-- GList*      g_list_alloc                    (void);
-- void        g_list_free_1                   (GList *list);

-- guint       g_list_length                   (GList *list);
-- GList*      g_list_copy                     (GList *list);
-- GList*      g_list_reverse                  (GList *list);
-- GList*      g_list_sort                     (GList *list,
--                                              GCompareFunc compare_func);
-- gint        (*GCompareFunc)                 (gconstpointer a,
--                                              gconstpointer b);
-- GList*      g_list_sort_with_data           (GList *list,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);
-- gint        (*GCompareDataFunc)             (gconstpointer a,
--                                              gconstpointer b,
--                                              gpointer user_data);
-- GList*      g_list_concat                   (GList *list1,
--                                              GList *list2);
-- void        g_list_foreach                  (GList *list,
--                                              GFunc func,
--                                              gpointer user_data);
-- void        (*GFunc)                        (gpointer data,
--                                              gpointer user_data);

-- GList*      g_list_first                    (GList *list);
-- GList*      g_list_last                     (GList *list);
-- #define     g_list_previous                 (list)
-- #define     g_list_next                     (list)
-- GList*      g_list_nth                      (GList *list,
--                                              guint n);
-- gpointer    g_list_nth_data                 (GList *list,
--                                              guint n);
-- GList*      g_list_nth_prev                 (GList *list,
--                                              guint n);

-- GList*      g_list_find                     (GList *list,
--                                              gconstpointer data);
-- GList*      g_list_find_custom              (GList *list,
--                                              gconstpointer data,
--                                              GCompareFunc func);
-- gint        g_list_position                 (GList *list,
--                                              GList *llink);
-- gint        g_list_index                    (GList *list,
--                                              gconstpointer data);

-- void        g_list_push_allocator           (GAllocator *allocator);
-- void        g_list_pop_allocator            (void);

-- Description

-- The GList structure and its associated functions provide a standard doubly-linked list data structure.

-- Each element in the list contains a piece of data, together with pointers which link to the previous and next elements in the list. Using these pointers it is possible to move through the list in both directions (unlike the Singly-Linked Lists which only allows movement through the list in the forward direction).

-- The data contained in each element can be either integer values, by using one of the Type Conversion Macros, or simply pointers to any type of data.

-- List elements are allocated in blocks using a GAllocator, which is more efficient than allocating elements individually.

-- Note that most of the GList functions expect to be passed a pointer to the first element in the list. The functions which insert elements return the new start of the list, which may have changed.

-- There is no function to create a GList. NULL is considered to be the empty list so you simply set a GList* to NULL.

-- To add elements, use g_list_append(), g_list_prepend(), g_list_insert() and g_list_insert_sorted().

-- To remove elements, use g_list_remove().

-- To find elements in the list use g_list_first(), g_list_last(), g_list_next(), g_list_previous(), g_list_nth(), g_list_nth_data(), g_list_find() and g_list_find_custom().

-- To find the index of an element use g_list_position() and g_list_index().

-- To call a function for each element in the list use g_list_foreach().

-- To free the entire list, use g_list_free().
-- Details
-- GList

-- typedef struct {
--   gpointer data;
--   GList *next;
--   GList *prev;
-- } GList;

-- The GList struct is used for each element in a doubly-linked list.
-- gpointer data; 	holds the element's data, which can be a pointer to any kind of data, or any integer value using the Type Conversion Macros.
-- GList *next; 	contains the link to the next element in the list.
-- GList *prev; 	contains the link to the previous element in the list.
-- g_list_append ()

-- GList*      g_list_append                   (GList *list,
--                                              gpointer data);

-- Adds a new element on to the end of the list.
-- Note

-- The return value is the new start of the list, which may have changed, so make sure you store the new value.
-- Note

-- Note that g_list_append() has to traverse the entire list to find the end, which is inefficient when adding multiple elements. A common idiom to avoid the inefficiency is to prepend the elements and reverse the list when all elements have been added.

--   /* Notice that these are initialized to the empty list. */
--   GList *list = NULL, *number_list = NULL;

--   /* This is a list of strings. */
--   list = g_list_append (list, "first");
--   list = g_list_append (list, "second");

--   /* This is a list of integers. */
--   number_list = g_list_append (number_list, GINT_TO_POINTER (27));
--   number_list = g_list_append (number_list, GINT_TO_POINTER (14));

-- list : 	a pointer to a GList.
-- data : 	the data for the new element.
-- Returns : 	the new start of the GList.
-- g_list_prepend ()

-- GList*      g_list_prepend                  (GList *list,
--                                              gpointer data);

-- Adds a new element on to the start of the list.
-- Note

-- The return value is the new start of the list, which may have changed, so make sure you store the new value.

--   /* Notice that it is initialized to the empty list. */
--   GList *list = NULL;
--   list = g_list_prepend (list, "last");
--   list = g_list_prepend (list, "first");

-- list : 	a pointer to a GList.
-- data : 	the data for the new element.
-- Returns : 	the new start of the GList.
-- g_list_insert ()

-- GList*      g_list_insert                   (GList *list,
--                                              gpointer data,
--                                              gint position);

-- Inserts a new element into the list at the given position.
-- list : 	a pointer to a GList.
-- data : 	the data for the new element.
-- position : 	the position to insert the element. If this is negative, or is larger than the number of elements in the list, the new element is added on to the end of the list.
-- Returns : 	the new start of the GList.
-- g_list_insert_before ()

-- GList*      g_list_insert_before            (GList *list,
--                                              GList *sibling,
--                                              gpointer data);

-- Inserts a new element into the list before the given position.
-- list : 	a pointer to a GList.
-- sibling : 	the list element before which the new element is inserted or NULL to insert at the end of the list.
-- data : 	the data for the new element.
-- Returns : 	the new start of the GList.
-- g_list_insert_sorted ()

-- GList*      g_list_insert_sorted            (GList *list,
--                                              gpointer data,
--                                              GCompareFunc func);

-- Inserts a new element into the list, using the given comparison function to determine its position.
-- list : 	a pointer to a GList.
-- data : 	the data for the new element.
-- func : 	the function to compare elements in the list. It should return a number > 0 if the first parameter comes after the second parameter in the sort order.
-- Returns : 	the new start of the GList.
-- g_list_remove ()

-- GList*      g_list_remove                   (GList *list,
--                                              gconstpointer data);

-- Removes an element from a GList. If two elements contain the same data, only the first is removed. If none of the elements contain the data, the GList is unchanged.
-- list : 	a GList.
-- data : 	the data of the element to remove.
-- Returns : 	the new start of the GList.
-- g_list_remove_link ()

-- GList*      g_list_remove_link              (GList *list,
--                                              GList *llink);

-- Removes an element from a GList, without freeing the element. The removed element's prev and next links are set to NULL, so that it becomes a self-contained list with one element.
-- list : 	a GList.
-- llink : 	an element in the GList.
-- Returns : 	the new start of the GList, without the element.
-- g_list_delete_link ()

-- GList*      g_list_delete_link              (GList *list,
--                                              GList *link_);

-- Deletes the node link_ from list.
-- list : 	a GList.
-- link_ : 	node to delete from list.
-- Returns : 	the new head of list.
-- g_list_remove_all ()

-- GList*      g_list_remove_all               (GList *list,
--                                              gconstpointer data);

-- Removes all list nodes with data equal to data. Returns the new head of the list. Contrast with g_list_remove() which removes only the first node matching the given data.
-- list : 	a GList.
-- data : 	data to remove.
-- Returns : 	new head of list.
-- g_list_free ()

-- void        g_list_free                     (GList *list);

-- Frees all of the memory used by a GList. The freed elements are added to the GAllocator free list.
-- Note

-- If list elements contain dynamically-allocated memory, they should be freed first.
-- list : 	a GList.
-- g_list_alloc ()

-- GList*      g_list_alloc                    (void);

-- Allocates space for one GList element. It is called by g_list_append(), g_list_prepend(), g_list_insert() and g_list_insert_sorted() and so is rarely used on its own.
-- Returns : 	a pointer to the newly-allocated GList element.
-- g_list_free_1 ()

-- void        g_list_free_1                   (GList *list);

-- Frees one GList element. It is usually used after g_list_remove_link().
-- list : 	a GList element.
-- g_list_length ()

-- guint       g_list_length                   (GList *list);

-- Gets the number of elements in a GList.
-- list : 	a GList.
-- Returns : 	the number of elements in the GList.
-- g_list_copy ()

-- GList*      g_list_copy                     (GList *list);

-- Copies a GList.

-- Note that this is a "shallow" copy. If the list elements consist of pointers to data, the pointers are copied but the actual data isn't.
-- list : 	a GList.
-- Returns : 	a copy of list.
-- g_list_reverse ()

-- GList*      g_list_reverse                  (GList *list);

-- Reverses a GList. It simply switches the next and prev pointers of each element.
-- list : 	a GList.
-- Returns : 	the start of the reversed GList.
-- g_list_sort ()

-- GList*      g_list_sort                     (GList *list,
--                                              GCompareFunc compare_func);

-- Sorts a GList using the given comparison function.
-- list : 	a GList.
-- compare_func : 	the comparison function used to sort the GList. This function is passed the data from 2 elements of the GList and should return 0 if they are equal, a negative value if the first element comes before the second, or a positive value if the first element comes after the second.
-- Returns : 	the start of the sorted GList.
-- GCompareFunc ()

-- gint        (*GCompareFunc)                 (gconstpointer a,
--                                              gconstpointer b);

-- Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes before the second, 0 if they are equal, or a positive integer if the first value comes after the second.
-- a : 	a value.
-- b : 	a value to compare with.
-- Returns : 	negative value if a < b; zero if a = b; positive value if a > b.
-- g_list_sort_with_data ()

-- GList*      g_list_sort_with_data           (GList *list,
--                                              GCompareDataFunc compare_func,
--                                              gpointer user_data);

-- Like g_list_sort(), but the comparison function accepts a user data argument.
-- list : 	a GList.
-- compare_func : 	comparison function.
-- user_data : 	user data to pass to comparison function.
-- Returns : 	the new head of list.
-- GCompareDataFunc ()

-- gint        (*GCompareDataFunc)             (gconstpointer a,
--                                              gconstpointer b,
--                                              gpointer user_data);

-- Specifies the type of a comparison function used to compare two values. The function should return a negative integer if the first value comes before the second, 0 if they are equal, or a positive integer if the first value comes after the second.
-- a : 	a value.
-- b : 	a value to compare with.
-- user_data : 	user data to pass to comparison function.
-- Returns : 	negative value if a < b; zero if a = b; positive value if a > b.
-- g_list_concat ()

-- GList*      g_list_concat                   (GList *list1,
--                                              GList *list2);

-- Adds the second GList onto the end of the first GList. Note that the elements of the second GList are not copied. They are used directly.
-- list1 : 	a GList.
-- list2 : 	the GList to add to the end of the first GList.
-- Returns : 	the start of the new GList.
-- g_list_foreach ()

-- void        g_list_foreach                  (GList *list,
--                                              GFunc func,
--                                              gpointer user_data);

-- Calls a function for each element of a GList.
-- list : 	a GList.
-- func : 	the function to call with each element's data.
-- user_data : 	user data to pass to the function.
-- GFunc ()

-- void        (*GFunc)                        (gpointer data,
--                                              gpointer user_data);

-- Specifies the type of functions passed to g_list_foreach() and g_slist_foreach().
-- data : 	the element's data.
-- user_data : 	user data passed to g_list_foreach() or g_slist_foreach().
-- g_list_first ()

-- GList*      g_list_first                    (GList *list);

-- Gets the first element in a GList.
-- list : 	a GList.
-- Returns : 	the first element in a GList, or NULL if the GList has no elements.
-- g_list_last ()

-- GList*      g_list_last                     (GList *list);

-- Gets the last element in a GList.
-- list : 	a GList.
-- Returns : 	the last element in the GList, or NULL if the GList has no elements.
-- g_list_previous()

-- #define     g_list_previous(list)

-- A convenience macro to gets the previous element in a GList.
-- list : 	an element in a GList.
-- Returns : 	the previous element, or NULL if there are no previous elements.
-- g_list_next()

-- #define     g_list_next(list)

-- A convenience macro to gets the next element in a GList.
-- list : 	an element in a GList.
-- Returns : 	the next element, or NULL if there are no more elements.
-- g_list_nth ()

-- GList*      g_list_nth                      (GList *list,
--                                              guint n);

-- Gets the element at the given position in a GList.
-- list : 	a GList.
-- n : 	the position of the element, counting from 0.
-- Returns : 	the element, or NULL if the position is off the end of the GList.
-- g_list_nth_data ()

-- gpointer    g_list_nth_data                 (GList *list,
--                                              guint n);

-- Gets the data of the element at the given position.
-- list : 	a GList.
-- n : 	the position of the element.
-- Returns : 	the element's data, or NULL if the position is off the end of the GList.
-- g_list_nth_prev ()

-- GList*      g_list_nth_prev                 (GList *list,
--                                              guint n);

-- Gets the element n places before list.
-- list : 	a GList.
-- n : 	the position of the element, counting from 0.
-- Returns : 	the element, or NULL if the position is off the end of the GList.
-- g_list_find ()

-- GList*      g_list_find                     (GList *list,
--                                              gconstpointer data);

-- Finds the element in a GList which contains the given data.
-- list : 	a GList.
-- data : 	the element data to find.
-- Returns : 	the found GList element, or NULL if it is not found.
-- g_list_find_custom ()

-- GList*      g_list_find_custom              (GList *list,
--                                              gconstpointer data,
--                                              GCompareFunc func);

-- Finds an element in a GList, using a supplied function to find the desired element. It iterates over the list, calling the given function which should return 0 when the desired element is found. The function takes two gconstpointer arguments, the GList element's data as the first argument and the given user data.
-- list : 	a GList.
-- data : 	user data passed to the function.
-- func : 	the function to call for each element. It should return 0 when the desired element is found.
-- Returns : 	the found GList element, or NULL if it is not found.
-- g_list_position ()

-- gint        g_list_position                 (GList *list,
--                                              GList *llink);

-- Gets the position of the given element in the GList (starting from 0).
-- list : 	a GList.
-- llink : 	an element in the GList.
-- Returns : 	the position of the element in the GList, or -1 if the element is not found.
-- g_list_index ()

-- gint        g_list_index                    (GList *list,
--                                              gconstpointer data);

-- Gets the position of the element containing the given data (starting from 0).
-- list : 	a GList.
-- data : 	the data to find.
-- Returns : 	the index of the element containing the data, or -1 if the data is not found.
-- g_list_push_allocator ()

-- void        g_list_push_allocator           (GAllocator *allocator);

-- Sets the allocator to use to allocate GList elements. Use g_list_pop_allocator() to restore the previous allocator.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
-- allocator : 	the GAllocator to use when allocating GList elements.
-- g_list_pop_allocator ()

-- void        g_list_pop_allocator            (void);

-- Restores the previous GAllocator, used when allocating GList elements.

-- Note that this function is not available if GLib has been compiled with --disable-mem-pools
end
