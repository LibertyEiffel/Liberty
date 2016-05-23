note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_MEMORY_ALLOCATORS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Memory Allocators

-- Memory Allocators %GÅ‚Äî%@ allocates chunks of memory for GList, GSList and GNode.
	
-- Synopsis

-- #include <glib.h>


--             GAllocator;
-- GAllocator* g_allocator_new                 (const gchar *name,
--                                              guint n_preallocs);
-- void        g_allocator_free                (GAllocator *allocator);


-- Description

-- The GAllocator is used as an efficient way to allocate small pieces of memory for use with the GList, GSList and GNode data structures. It uses a GMemChunk so elements are allocated in groups, rather than individually.

-- The GList, GSList and GNode implementations create default GAllocator objects, which are probably sufficient for most purposes. These default allocators use blocks of 128 elements.

-- To use your own GAllocator, create it with g_allocator_new(). Then use g_list_push_allocator(), g_slist_push_allocator() or g_node_push_allocator() before any code which allocates new GList, GSList or GNode elements respectively. After allocating the new elements, you must use g_list_pop_allocator(), g_slist_pop_allocator() or g_node_pop_allocator() to restore the previous allocators.

-- Note that you cannot use the same allocator for GList, GSList and GNode elements. Each must use separate allocators.
-- Details
-- GAllocator

-- typedef struct _GAllocator GAllocator;

-- The GAllocator struct contains private data. and should only be accessed using the following functions.
-- g_allocator_new ()

-- GAllocator* g_allocator_new                 (const gchar *name,
--                                              guint n_preallocs);

-- Creates a new GAllocator.
-- name : 	the name of the GAllocator. This name is used to set the name of the GMemChunk used by the GAllocator, and is only used for debugging.
-- n_preallocs : 	the number of elements in each block of memory allocated. Larger blocks mean less calls to g_malloc(), but some memory may be wasted. (GLib uses 128 elements per block by default.) The value must be between 1 and 65535.
-- Returns : 	a new GAllocator.
-- g_allocator_free ()

-- void        g_allocator_free                (GAllocator *allocator);

-- Frees all of the memory allocated by the GAllocator.
-- allocator : 	a GAllocator.
end
