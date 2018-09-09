note
	description: "External calls for "
	copyright: "Copyright (C) 2007-2018: $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GLIB_STRING_CHUNK_EXTERNALS

inherit
	ANY undefine is_equal, copy end
	GLIB_BASIC_TYPES
	
feature  {} -- External calls
	
	g_string_chunk_new (a_size: like gsize): POINTER
			-- GStringChunk* g_string_chunk_new (gsize size);
		external "C use <glib.h>"
		end
	
	g_string_chunk_insert (a_chunk, a_const_string: POINTER): POINTER
			-- gchar* g_string_chunk_insert (GStringChunk *chunk, const
			-- gchar *string);
		external "C use <glib.h>"
		end

	g_string_chunk_insert_const (a_chunk, a_const_string: POINTER): POINTER
			-- gchar* g_string_chunk_insert_const (GStringChunk *chunk,
			-- const gchar *string);
		external "C use <glib.h>"
		end

	g_string_chunk_insert_len (a_chunk, a_const_string: POINTER; a_len: like gssize): POINTER
			-- gchar* g_string_chunk_insert_len (GStringChunk *chunk,
			-- const gchar *string, gssize len);
		external "C use <glib.h>"
		end

	g_string_chunk_free (a_chunk: POINTER)
			-- void g_string_chunk_free (GStringChunk *chunk);
		external "C use <glib.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GStringChunk)"
		end
end
