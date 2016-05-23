note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GLIB_MEMORY_CHUNKS
-- Prev 	Up 	Home 	GLib Reference Manual 	Next
-- Top  |  Description
-- Memory Chunks

-- Memory Chunks %GÅ‚Äî%@ efficient way to allocate groups of equal-sized chunks of memory.
	
-- Synopsis

-- #include <glib.h>


-- 				GMemChunk;
-- #define     G_ALLOC_AND_FREE
-- #define     G_ALLOC_ONLY

-- GMemChunk*  g_mem_chunk_new                 (const gchar *name,
-- 															gint atom_size,
-- 															gulong area_size,
-- 															gint type);
-- gpointer    g_mem_chunk_alloc               (GMemChunk *mem_chunk);
-- gpointer    g_mem_chunk_alloc0              (GMemChunk *mem_chunk);
-- void        g_mem_chunk_free                (GMemChunk *mem_chunk,
-- 															gpointer mem);
-- void        g_mem_chunk_destroy             (GMemChunk *mem_chunk);

-- #define     g_mem_chunk_create              (type, pre_alloc, alloc_type)
-- #define     g_chunk_new                     (type, chunk)
-- #define     g_chunk_new0                    (type, chunk)
-- #define     g_chunk_free                    (mem, mem_chunk)

-- void        g_mem_chunk_reset               (GMemChunk *mem_chunk);
-- void        g_mem_chunk_clean               (GMemChunk *mem_chunk);
-- void        g_blow_chunks                   (void);

-- void        g_mem_chunk_info                (void);
-- void        g_mem_chunk_print               (GMemChunk *mem_chunk);

-- Description

-- Memory chunks provide an efficient way to allocate equal-sized pieces of memory, called atoms. They are used extensively within GLib itself. For example, the Doubly Linked Lists use memory chunks to allocate space for elements of the lists.

-- There are two types of memory chunks, G_ALLOC_ONLY, and G_ALLOC_AND_FREE.

-- 	*

-- 		G_ALLOC_ONLY chunks only allow allocation of atoms. The atoms can never be freed individually. The memory chunk can only be free in its entirety.
-- 	*

-- 		G_ALLOC_AND_FREE chunks do allow atoms to be freed individually. The disadvantage of this is that the memory chunk has to keep track of which atoms have been freed. This results in more memory being used and a slight degradation in performance.

-- To create a memory chunk use g_mem_chunk_new() or the convenience macro g_mem_chunk_create().

-- To allocate a new atom use g_mem_chunk_alloc(), g_mem_chunk_alloc0(), or the convenience macros g_chunk_new() or g_chunk_new0().

-- To free an atom use g_mem_chunk_free(), or the convenience macro g_chunk_free(). (Atoms can only be freed if the memory chunk is created with the type set to G_ALLOC_AND_FREE.)

-- To free any blocks of memory which are no longer being used, use g_mem_chunk_clean(). To clean all memory chunks, use g_blow_chunks().

-- To reset the memory chunk, freeing all of the atoms, use g_mem_chunk_reset().

-- To destroy a memory chunk, use g_mem_chunk_destroy().

-- To help debug memory chunks, use g_mem_chunk_info() and g_mem_chunk_print().

-- Example 1. Using a GMemChunk

--   GMemChunk *mem_chunk;
--   gchar *mem[10000];
--   gint i;

--   /* Create a GMemChunk with atoms 50 bytes long, and memory blocks holding
-- 	100 bytes. Note that this means that only 2 atoms fit into each memory
-- 	block and so isn't very efficient. */
--   mem_chunk = g_mem_chunk_new ("test mem chunk", 50, 100, G_ALLOC_AND_FREE);

--   /* Now allocate 10000 atoms. */
--   for (i = 0; i < 10000; i++)
-- 	{
-- 		mem[i] = g_chunk_new (gchar, mem_chunk);

-- 		/* Fill in the atom memory with some junk. */
-- 		for (j = 0; j < 50; j++)
-- 	mem[i][j] = i * j;
-- 	}

--   /* Now free all of the atoms. Note that since we are going to destroy the
-- 	GMemChunk, this wouldn't normally be used. */
--   for (i = 0; i < 10000; i++)
-- 	{
-- 		g_mem_chunk_free (mem_chunk, mem[i]);
-- 	}

--   /* We are finished with the GMemChunk, so we destroy it. */
--   g_mem_chunk_destroy (mem_chunk);

-- Example 2. Using a GMemChunk with data structures

--   GMemChunk *array_mem_chunk;
--   GRealArray *array;

--   /* Create a GMemChunk to hold GRealArray structures, using the
-- 	g_mem_chunk_create() convenience macro. We want 1024 atoms in each
-- 	memory block, and we want to be able to free individual atoms. */
--   array_mem_chunk = g_mem_chunk_create (GRealArray, 1024, G_ALLOC_AND_FREE);

--   /* Allocate one atom, using the g_chunk_new() convenience macro. */
--   array = g_chunk_new (GRealArray, array_mem_chunk);

--   /* We can now use array just like a normal pointer to a structure. */
--   array->data            = NULL;
--   array->len             = 0;
--   array->alloc           = 0;
--   array->zero_terminated = (zero_terminated ? 1 : 0);
--   array->clear           = (clear ? 1 : 0);
--   array->elt_size        = elt_size;

--   /* We can free the element, so it can be reused. */
--   g_chunk_free (array, array_mem_chunk);

--   /* We destroy the GMemChunk when we are finished with it. */
--   g_mem_chunk_destroy (array_mem_chunk);

-- Details
-- GMemChunk

-- typedef struct _GMemChunk GMemChunk;

-- The GMemChunk struct is an opaque data structure representing a memory chunk. It should be accessed only through the use of the following functions.
-- G_ALLOC_AND_FREE

-- #define G_ALLOC_AND_FREE  2

-- Specifies the type of a GMemChunk. Used in g_mem_chunk_new() and g_mem_chunk_create() to specify that atoms will be freed individually.
-- G_ALLOC_ONLY

-- #define G_ALLOC_ONLY	  1

-- Specifies the type of a GMemChunk. Used in g_mem_chunk_new() and g_mem_chunk_create() to specify that atoms will never be freed individually.
-- g_mem_chunk_new ()

-- GMemChunk*  g_mem_chunk_new                 (const gchar *name,
-- 															gint atom_size,
-- 															gulong area_size,
-- 															gint type);

-- Creates a new GMemChunk.
-- name : 	a string to identify the GMemChunk. It is not copied so it should be valid for the lifetime of the GMemChunk. It is only used in g_mem_chunk_print(), which is used for debugging.
-- atom_size : 	the size, in bytes, of each element in the GMemChunk.
-- area_size : 	the size, in bytes, of each block of memory allocated to contain the atoms.
-- type : 	the type of the GMemChunk. G_ALLOC_AND_FREE is used if the atoms will be freed individually. G_ALLOC_ONLY should be used if atoms will never be freed individually. G_ALLOC_ONLY is quicker, since it does not need to track free atoms, but it obviously wastes memory if you no longer need many of the atoms.
-- Returns : 	the new GMemChunk.
-- g_mem_chunk_alloc ()

-- gpointer    g_mem_chunk_alloc               (GMemChunk *mem_chunk);

-- Allocates an atom of memory from a GMemChunk.
-- mem_chunk : 	a GMemChunk.
-- Returns : 	a pointer to the allocated atom.
-- g_mem_chunk_alloc0 ()

-- gpointer    g_mem_chunk_alloc0              (GMemChunk *mem_chunk);

-- Allocates an atom of memory from a GMemChunk, setting the memory to 0.
-- mem_chunk : 	a GMemChunk.
-- Returns : 	a pointer to the allocated atom.
-- g_mem_chunk_free ()

-- void        g_mem_chunk_free                (GMemChunk *mem_chunk,
-- 															gpointer mem);

-- Frees an atom in a GMemChunk. This should only be called if the GMemChunk was created with G_ALLOC_AND_FREE. Otherwise it will simply return.
-- mem_chunk : 	a GMemChunk.
-- mem : 	a pointer to the atom to free.
-- g_mem_chunk_destroy ()

-- void        g_mem_chunk_destroy             (GMemChunk *mem_chunk);

-- Frees all of the memory allocated for a GMemChunk.
-- mem_chunk : 	a GMemChunk.
-- g_mem_chunk_create()

-- #define     g_mem_chunk_create(type, pre_alloc, alloc_type)

-- A convenience macro for creating a new GMemChunk. It calls g_mem_chunk_new(), using the given type to create the GMemChunk name. The atom size is determined using sizeof(), and the area size is calculated by multiplying the pre_alloc parameter with the atom size.
-- type : 	the type of the atoms, typically a structure name.
-- pre_alloc : 	the number of atoms to store in each block of memory.
-- alloc_type : 	the type of the GMemChunk. G_ALLOC_AND_FREE is used if the atoms will be freed individually. G_ALLOC_ONLY should be used if atoms will never be freed individually. G_ALLOC_ONLY is quicker, since it does not need to track free atoms, but it obviously wastes memory if you no longer need many of the atoms.
-- Returns : 	the new GMemChunk.
-- g_chunk_new()

-- #define     g_chunk_new(type, chunk)

-- A convenience macro to allocate an atom of memory from a GMemChunk. It calls g_mem_chunk_alloc() and casts the returned atom to a pointer to the given type, avoiding a type cast in the source code.
-- type : 	the type of the GMemChunk atoms, typically a structure name.
-- chunk : 	a GMemChunk.
-- Returns : 	a pointer to the allocated atom, cast to a pointer to type.
-- g_chunk_new0()

-- #define     g_chunk_new0(type, chunk)

-- A convenience macro to allocate an atom of memory from a GMemChunk. It calls g_mem_chunk_alloc0() and casts the returned atom to a pointer to the given type, avoiding a type cast in the source code.
-- type : 	the type of the GMemChunk atoms, typically a structure name.
-- chunk : 	a GMemChunk.
-- Returns : 	a pointer to the allocated atom, cast to a pointer to type.
-- g_chunk_free()

-- #define     g_chunk_free(mem, mem_chunk)

-- A convenience macro to free an atom of memory from a GMemChunk. It simply switches the arguments and calls g_mem_chunk_free() It is included simply to complement the other convenience macros, g_chunk_new() and g_chunk_new0().
-- mem : 	a pointer to the atom to be freed.
-- mem_chunk : 	a GMemChunk.
-- g_mem_chunk_reset ()

-- void        g_mem_chunk_reset               (GMemChunk *mem_chunk);

-- Resets a GMemChunk to its initial state. It frees all of the currently allocated blocks of memory.
-- mem_chunk : 	a GMemChunk.
-- g_mem_chunk_clean ()

-- void        g_mem_chunk_clean               (GMemChunk *mem_chunk);

-- Frees any blocks in a GMemChunk which are no longer being used.
-- mem_chunk : 	a GMemChunk.
-- g_blow_chunks ()

-- void        g_blow_chunks                   (void);

-- Calls g_mem_chunk_clean() on all GMemChunk objects.
-- g_mem_chunk_info ()

-- void        g_mem_chunk_info                (void);

-- Outputs debugging information for all GMemChunk objects currently in use. It outputs the number of GMemChunk objects currently allocated, and calls g_mem_chunk_print() to output information on each one.
-- g_mem_chunk_print ()

-- void        g_mem_chunk_print               (GMemChunk *mem_chunk);

-- Outputs debugging information for a GMemChunk. It outputs the name of the GMemChunk (set with g_mem_chunk_new()), the number of bytes used, and the number of blocks of memory allocated.
-- mem_chunk : 	a GMemChunk.
end
