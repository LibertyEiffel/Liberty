note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class G_STRING_CHUNK
	-- String Chunks, an efficient storage of groups of strings.
	
	-- String chunks are used to store groups of strings. Memory is
	-- allocated in blocks, and as strings are added to the
	-- GStringChunk they are copied into the next free position in a
	-- block. When a block is full a new block is allocated.

	-- When storing a large number of strings, string chunks are more
	-- efficient than using the C function `g_strdup' since fewer calls
	-- to `malloc' are needed, and less memory is wasted in memory
	-- allocation overheads.

	-- By adding strings with `insert_const' it is also possible to
	-- remove duplicates.
	
	-- To add strings to a GStringChunk use g_string_chunk_insert().
	
	-- To add strings to a GStringChunk, but without duplicating
	-- strings which are already in the GStringChunk, use
	-- g_string_chunk_insert_const().

inherit 
	C_STRUCT
	EIFFEL_OWNED

insert GLIB_STRING_CHUNK_EXTERNALS
	
create {ANY} make, from_external_pointer
	
feature {ANY}
	make (a_size: INTEGER)
			-- Creates a new G_STRING_CHUNK, with `a_size' the default
			-- size of the blocks of memory which are allocated to store
			-- the strings. If a particular string is larger than this
			-- default size, a larger block of memory will be allocated
			-- for it.
		do
			from_external_pointer(g_string_chunk_new(a_size))
		end

	-- g_string_chunk_insert ()

	-- gchar*      g_string_chunk_insert           (GStringChunk *chunk,
	--                                              const gchar *string);

	-- Adds a copy of string to the GStringChunk. It returns a pointer to the new copy of the string in the GStringChunk. The characters in the string can be changed, if necessary, though you should not change anything after the end of the string.

	-- Unlike g_string_chunk_insert_const(), this function does not check for duplicates. Also strings added with g_string_chunk_insert() will not be searched by g_string_chunk_insert_const() when looking for duplicates.
	-- chunk : 	a GStringChunk.
	-- string : 	the string to add.
	-- Returns : 	a pointer to the copy of string within the GStringChunk.
	-- g_string_chunk_insert_const ()

	-- gchar*      g_string_chunk_insert_const     (GStringChunk *chunk,
	--                                              const gchar *string);

	-- Adds a copy of string to the GStringChunk, unless the same string has already been added to the GStringChunk with g_string_chunk_insert_const().

	-- This function is useful if you need to copy a large number of strings but do not want to waste space storing duplicates. But you must remember that there may be several pointers to the same string, and so any changes made to the strings should be done very carefully.

	-- Note that g_string_chunk_insert_const() will not return a pointer to a string added with g_string_chunk_insert(), even if they do match.
	-- chunk : 	a GStringChunk.
	-- string : 	the string to add.
	-- Returns : 	a pointer to the new or existing copy of string within the GStringChunk.
	-- g_string_chunk_insert_len ()

	-- gchar*      g_string_chunk_insert_len       (GStringChunk *chunk,
	--                                              const gchar *string,
	--                                              gssize len);

	-- Adds a copy of the first len bytes of string to the GStringChunk. The copy is nul-terminated.

	-- The characters in the string can be changed, if necessary, though you should not change anything after the end of the string.

	-- chunk : 	a GStringChunk
	-- string : 	bytes to insert
	-- len : 	number of bytes of string to insert, or -1 to insert a nul-terminated string.
	-- Returns : 	a pointer to the copy of string within the GStringChunk

	-- Since 2.4
	-- g_string_chunk_free ()

	-- void        g_string_chunk_free             (GStringChunk *chunk);

	-- Frees all memory allocated by the GStringChunk. After calling g_string_chunk_free() it is not safe to access any of the strings which were contained within it.
	-- chunk : 	a GStringChunk.
end
