note
	description: "Memory Allocation -- general memory-handling."
	library: "GLib 2"
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL"
	note: "[
	If any call to allocate memory fails, the application is terminated.
			 This also means that there is no need to check if the call succeeded.

			 Every occurrence of gulong n_bytes	is wrapped as n_bytes: INTEGER; this shall change when SmartEiffel will provide NATURAL
			 ]"


deferred class GLIB_MEMORY_ALLOCATION

inherit ANY undefine is_equal, copy end

feature {} -- external features

	-- Prev 	Up 	Home 	GLib Reference Manual 	Next
	-- Top  |  Description
-- Memory Allocation

-- Memory Allocation %GÅ‚Äî%@ general memory-handling.

-- Synopsis

-- #include <glib.h>


-- #define     g_new                           (struct_type, n_structs)
-- #define     g_new0                          (struct_type, n_structs)
-- #define     g_renew                         (struct_type, mem, n_structs)
-- #define     g_try_new                       (struct_type, n_structs)
-- #define     g_try_new0                      (struct_type, n_structs)
-- #define     g_try_renew                     (struct_type, mem, n_structs)

-- gpointer    g_malloc                        (gulong n_bytes);
-- gpointer    g_malloc0                       (gulong n_bytes);
-- gpointer    g_realloc                       (gpointer mem,
--                                              gulong n_bytes);
-- gpointer    g_try_malloc                    (gulong n_bytes);
-- gpointer    g_try_malloc0                   (gulong n_bytes);
-- gpointer    g_try_realloc                   (gpointer mem,
--                                              gulong n_bytes);

-- void        g_free                          (gpointer mem);

-- #define     g_alloca                        (size)
-- #define     g_newa                          (struct_type, n_structs)

-- #define     g_memmove                       (dest,src,len)
-- gpointer    g_memdup                        (gconstpointer mem,
--                                              guint byte_size);

--             GMemVTable;
-- void        g_mem_set_vtable                (GMemVTable *vtable);
-- gboolean    g_mem_is_system_malloc          (void);

-- extern      GMemVTable	*glib_mem_profiler_table;
-- void        g_mem_profile                   (void);

-- Description

-- These functions provide support for allocating and freeing memory.
-- Note

-- If any call to allocate memory fails, the application is terminated. This also means that there is no need to check if the call succeeded.
-- Details

	
	-- 	g_new ()
	
	-- #define     g_new(struct_type, n_structs)
	
	-- 	Allocates n_structs elements of type struct_type. The returned pointer
	-- 	is cast to a pointer to the given type. If n_structs is 0 it returns
	-- 	NULL.
	-- 	struct_type : the type of the elements to allocate.
	-- 	n_structs : the number of elements to allocate.
	-- 	Returns : a pointer to the allocated memory, cast to a pointer to
	-- 	struct_type.
	-- 	_________________________________________________________________

	-- g_new0()

	-- #define     g_new0(struct_type, n_structs)

	-- 	Allocates n_structs elements of type struct_type, initialized to 0's.
	-- 	The returned pointer is cast to a pointer to the given type. If
	-- 	n_structs is 0 it returns NULL.
	-- 	struct_type : the type of the elements to allocate.
	-- 	n_structs : the number of elements to allocate.
	-- 	Returns : a pointer to the allocated memory, cast to a pointer to
	-- 	struct_type.
	-- 	_________________________________________________________________

	-- g_renew()

	-- #define     g_renew(struct_type, mem, n_structs)

	-- 	Reallocates the memory pointed to by mem, so that it now has space for
	-- 	n_structs elements of type struct_type. It returns the new address of
	-- 	the memory, which may have been moved.
	-- 	struct_type : the type of the elements to allocate.
	-- 	mem : the currently allocated memory.
	-- 	n_structs : the number of elements to allocate.
	-- 	Returns : a pointer to the new allocated memory, cast to a pointer to
	-- 	struct_type.
	-- 	_________________________________________________________________

	-- g_try_new()

	-- #define     g_try_new(struct_type, n_structs)

	-- 	Attempts to allocate n_structs elements of type struct_type, and
	-- 	returns NULL on failure. Contrast with g_new(), which aborts the
	-- 	program on failure. The returned pointer is cast to a pointer to the
	-- 	given type. If n_structs is 0 it returns NULL.
	-- 	struct_type : the type of the elements to allocate.
	-- 	n_structs : the number of elements to allocate.
	-- 	Returns : a pointer to the allocated memory, cast to a pointer to
	-- 	struct_type.

	-- 	Since 2.8
	-- 	_________________________________________________________________

	-- g_try_new0()

	-- #define     g_try_new0(struct_type, n_structs)

	-- 	Attempts to allocate n_structs elements of type struct_type,
	-- 	initialized to 0's, and returns NULL on failure. Contrast with
	-- 	g_new0(), which aborts the program on failure. The returned
	-- 	pointer is cast to a pointer to the given type. If n_counts is 0 it
	-- 	returns NULL.
	-- 	struct_type : the type of the elements to allocate.
	-- 	n_structs : the number of elements to allocate.
	-- 	Returns : a pointer to the allocated memory, cast to a pointer to
	-- 	struct_type.

	-- 	Since 2.8
	-- 	_________________________________________________________________

	-- g_try_renew()

	-- #define     g_try_renew(struct_type, mem, n_structs)

	-- 	Attempts to reallocate the memory pointed to by mem, so that it now
	-- 	has space for n_structs elements of type struct_type, and returns NULL
	-- 	on failure. Contrast with g_renew(), which aborts the program on
	-- 	failure. It returns the new address of the memory, which may have been
	-- 	moved.
	-- 	struct_type : the type of the elements to allocate.
	-- 	mem : the currently allocated memory.
	-- 	n_structs : the number of elements to allocate.
	-- 	Returns : a pointer to the new allocated memory, cast to a pointer to
	-- 	struct_type.

	-- 	Since 2.8
	-- 	_________________________________________________________________

	g_malloc (n_bytes: INTEGER): POINTER
			-- Allocates `n_bytes' bytes of memory. If `n_bytes' is 0 it
			-- returns NULL.  Returns : a pointer to the allocated
			-- memory.
		obsolete "use g_try_malloc"
		external "C use <glib.h>"
		end

	g_malloc0 (n_bytes: INTEGER): POINTER
			-- Allocates `n_bytes' bytes of memory, initialized to
			-- 0's. If n_bytes is 0 it returns NULL.  n_bytes : the
			-- number of bytes to allocate.  Returns : a pointer to the
			-- allocated memory.
		obsolete "use g_try_malloc0"
		external "C use <glib.h>"
		end

	g_realloc (mem: POINTER; n_bytes: INTEGER): POINTER
			-- Reallocates the memory pointed to by mem, so that it now
			-- has space for n_bytes bytes of memory. It returns the new
			-- address of the memory, which may have been moved. mem may
			-- be NULL, in which case it's considered to have
			-- zero-length. n_bytes may be 0, in which case NULL will be
			-- returned.  mem : the memory to reallocate.  n_bytes : new
			-- size of the memory in bytes.  Returns : the new address of
			-- the allocated memory.
		obsolete "use g_try_realloc"
		external "C use <glib.h>"
		end
	
	g_try_malloc (n_bytes: INTEGER): POINTER
			-- Attempts to allocate `n_bytes', and returns NULL on
			-- failure. Contrast with g_malloc, which aborts the program
			-- on failure. Returns: the allocated memory, or NULL.
		external "C use <glib.h>"
		end

	g_try_malloc0 (n_bytes: INTEGER): POINTER
			-- Attempts to allocate `n_bytes', initialized to 0's, and
			-- returns NULL on failure. Contrast with g_malloc0, which
			-- aborts the program on failure. Returns : the allocated
			-- memory, or NULL.
		external "C use <glib.h>"
		end

	g_try_realloc (mem: POINTER; n_bytes: INTEGER): POINTER
			-- Attempts to realloc mem to a new size, n_bytes, and
			-- returns NULL on failure. Contrast with g_realloc(), which
			-- aborts the program on failure. If mem is NULL, behaves the
			-- same as g_try_malloc().  mem : previously-allocated
			-- memory, or NULL.  n_bytes : number of bytes to allocate.
			-- Returns : the allocated memory, or NULL.
		external "C use <glib.h>"
		end

	g_free (mem: POINTER)
			-- Frees the memory pointed to by `mem'. If mem is NULL it
			-- simply returns.
		external "C use <glib.h>"
		end
			

	-- g_alloca()

	-- #define     g_alloca(size)

	-- 	Allocates size bytes on the stack; these bytes will be freed when the
	-- 	current stack frame is cleaned up. This macro essentially just wraps
	-- 	the alloca() function present on most UNIX variants. Thus it provides
	-- 	the same advantages and pitfalls as alloca():

	-- 	+ alloca() is very fast, as on most systems it's implemented by just
	-- 	adjusting the stack pointer register.

	-- 	+ It doesn't cause any memory fragmentation, within its scope,
	-- 	separate alloca() blocks just build up and are released together at
	-- 	function end.

	-- 	- Allocation sizes have to fit into the current stack frame. For
	-- 	instance in a threaded environment on Linux, the per-thread stack size
	-- 	is limited to 2 Megabytes, so be sparse with alloca() uses.

	-- 	- Allocation failure due to insufficient stack space is not indicated
	-- 	with a NULL return like e.g. with malloc(). Instead, most systems
	-- 	probably handle it the same way as out of stack space situations from
	-- 	infinite function recursion, i.e. with a segmentation fault.

	-- 	- Special care has to be taken when mixing alloca() with GNU C
	-- 	variable sized arrays. Stack space allocated with alloca() in the same
	-- 	scope as a variable sized array will be freed together with the
	-- 	variable sized array upon exit of that scope, and not upon exit of the
	-- 	enclosing function scope.

	-- 	size :    number of bytes to allocate.
	-- 	Returns : space for size bytes, allocated on the stack
	-- 	_________________________________________________________________

	-- g_newa()

	-- #define     g_newa(struct_type, n_structs)

	-- 	Wraps g_alloca() in a more typesafe manner.
	-- 	struct_type : Type of memory chunks to be allocated
	-- 	n_structs : Number of chunks to be allocated
	-- 	Returns : Pointer to stack space for n_structs chunks of type
	-- 	struct_type
	-- 	_________________________________________________________________

	-- g_memmove()

	-- #define     g_memmove(dest,src,len)

	g_memmove(src, dst: POINTER; len:INTEGER)
			-- 	Copies a block of memory len bytes long, from src to dest. The source
			-- 	and destination areas may overlap.
		-- 	dest : the destination address to copy the bytes to.
		-- 	src :  the source address to copy the bytes from.
		-- 	len :  the number of bytes to copy.
		external "C inline use <string.h>"
		alias "memmove"
		end

	-- 	In order to use this function, you must include string.h yourself,
	-- 	because this macro will typically simply resolve to memmove() and GLib
	-- 	does not include string.h for you.

	-- 	dest : the destination address to copy the bytes to.
	-- 	src :  the source address to copy the bytes from.
	-- 	len :  the number of bytes to copy.
	-- 	_________________________________________________________________

	-- g_memdup ()

	-- gpointer    g_memdup                        (gconstpointer mem,
	-- 															guint byte_size);

	-- 	Allocates byte_size bytes of memory, and copies byte_size bytes into
	-- 	it from mem. If mem is NULL it returns NULL.
	-- 	mem : the memory to copy.
	-- 	byte_size : the number of bytes to copy.
	-- 	Returns : a pointer to the newly-allocated copy of the memory, or NULL
	-- 	if mem is NULL.
	-- 	_________________________________________________________________

	-- GMemVTable

	-- typedef struct {
	--   gpointer (*malloc)      (gsize    n_bytes);
	--   gpointer (*realloc)     (gpointer mem,
	-- 									gsize    n_bytes);
	--   void     (*free)        (gpointer mem);
	--   /* optional; set to NULL if not used ! */
	--   gpointer (*calloc)      (gsize    n_blocks,
	-- 									gsize    n_block_bytes);
	--   gpointer (*try_malloc)  (gsize    n_bytes);
	--   gpointer (*try_realloc) (gpointer mem,
	-- 									gsize    n_bytes);
	-- } GMemVTable;

	-- 	A set of functions used to perform memory allocation. The same
	-- 	GMemVTable must be used for all allocations in the same program; a
	-- 	call to g_mem_set_vtable(), if it exists, should be prior to any
	-- 	use of GLib.
	-- 	malloc () function to use for allocating memory.
	-- 	realloc () function to use for reallocating memory.
	-- 	free () function to use to free memory.
	-- 	calloc () function to use for allocating zero-filled memory.
	-- 	try_malloc () function to use for allocating memory without a default
	-- 	error handler.
	-- 	try_realloc () function to use for reallocating memory without a
	-- 	default error handler.
	-- 	_________________________________________________________________

	-- g_mem_set_vtable ()

	-- void        g_mem_set_vtable                (GMemVTable *vtable);

	-- 	Sets the GMemVTable to use for memory allocation. You can use this
	-- 	to provide custom memory allocation routines. This function must be
	-- 	called before using any other GLib functions. The vtable only needs to
	-- 	provide malloc(), realloc(), and free() functions; GLib can provide
	-- 	default implementations of the others. The malloc() and realloc()
	-- 	implementations should return NULL on failure, GLib will handle
	-- 	error-checking for you. vtable is copied, so need not persist after
	-- 	this function has been called.
	-- 	vtable : table of memory allocation routines.
	-- 	_________________________________________________________________

	-- g_mem_is_system_malloc ()

	-- gboolean    g_mem_is_system_malloc          (void);

	-- 	Checks whether the allocator used by g_malloc() is the system's
	-- 	malloc implementation. If it returns TRUE memory allocated with
	-- 	malloc() can be used interchangeable with memory allocated using
	-- 	g_malloc(). This function is useful for avoiding an extra copy of
	-- 	allocated memory returned by a non-GLib-based API.

	-- 	A different allocator can be set using g_mem_set_vtable().

	-- 	Returns : if TRUE, malloc() and g_malloc() can be mixed.
	-- 	_________________________________________________________________

	-- glib_mem_profiler_table

	-- extern GMemVTable       *glib_mem_profiler_table;

	-- 	A GMemVTable containing profiling variants of the memory
	-- 	allocation functions. Use them together with g_mem_profile() in
	-- 	order to get information about the memory allocation pattern of your
	-- 	program.
	-- 	_________________________________________________________________

	-- g_mem_profile ()

	-- void        g_mem_profile                   (void);

	-- 	Outputs a summary of memory usage.

	-- 	It outputs the frequency of allocations of different sizes, the total
	-- 	number of bytes which have been allocated, the total number of bytes
	-- 	which have been freed, and the difference between the previous two
	-- 	values, i.e. the number of bytes still in use.

	-- 	Note that this function will not output anything unless you have
	-- 	previously installed the glib_mem_profiler_table with
	-- 	g_mem_set_vtable().

end
	
