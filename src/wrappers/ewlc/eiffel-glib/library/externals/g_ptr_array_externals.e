note
	description: "External calls for "
	copyright: "Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class G_PTR_ARRAY_EXTERNALS

inherit ANY undefine is_equal, copy end
feature {} 
-- #include <glib.h>

	g_ptr_array_new: POINTER
			-- GPtrArray*  g_ptr_array_new                 (void);
		external "C use <glib.h>"
		end
	
	g_ptr_array_sized_new (a_size: INTEGER): POINTER
			-- GPtrArray* g_ptr_array_sized_new (guint reserved_size);
		
			-- TODO: `a_size' should be NATURAL
		external "C use <glib.h>"
		end

	g_ptr_array_add (an_array, some_data: POINTER)
			-- void g_ptr_array_add (GPtrArray *array, gpointer data);
		external "C use <glib.h>"
		end

	g_ptr_array_remove (an_array, some_data: POINTER): INTEGER
			-- gboolean g_ptr_array_remove (GPtrArray *array, gpointer
			-- data);
		external "C use <glib.h>"
		end

	g_ptr_array_remove_index (an_array: POINTER; an_index: INTEGER): POINTER
			-- gpointer g_ptr_array_remove_index (GPtrArray *array, guint
			-- index_);

			-- TODO: `an_index' should be NATURAL
		external "C use <glib.h>"
		end

	g_ptr_array_remove_fast (an_array, some_data: POINTER): INTEGER
			-- gboolean g_ptr_array_remove_fast (GPtrArray *array,
			-- gpointer data);
		external "C use <glib.h>"
		end

	g_ptr_array_remove_index_fast(an_array: POINTER; an_index: INTEGER): POINTER
			-- gpointer g_ptr_array_remove_index_fast (GPtrArray *array,
			-- guint index_);

			-- TODO: `an_index' should be NATURAL
		external "C use <glib.h>"
		end

	g_ptr_array_remove_range (an_array: POINTER; an_index, a_length: INTEGER)
			-- void g_ptr_array_remove_range (GPtrArray *array, guint
			-- index_, guint length);

			-- TODO: `an_index' and `a_length' should be NATURAL
		external "C use <glib.h>"
		end
	
	g_ptr_array_sort (an_array, a_compare_func: POINTER)
			-- void g_ptr_array_sort (GPtrArray *array, GCompareFunc
			-- compare_func);
		external "C use <glib.h>"
		end

	g_ptr_array_sort_with_data (an_array, a_compare_func, a_user_data: POINTER)
			-- void g_ptr_array_sort_with_data (GPtrArray *array,
			-- GCompareDataFunc compare_func, gpointer user_data);
		external "C use <glib.h>"
		end

	g_ptr_array_set_size (an_array: POINTER; a_length: INTEGER)
			-- void g_ptr_array_set_size (GPtrArray *array, gint length);
		external "C use <glib.h>"
		end
	
	g_ptr_array_index (an_array: POINTER; an_index: INTEGER): POINTER
			-- #define g_ptr_array_index (array,index_)
		external "C macro use <glib.h>"
		end

	g_ptr_array_free (an_array: POINTER; a_free_seg: INTEGER): INTEGER
			-- gpointer* g_ptr_array_free (GPtrArray *array, gboolean
			-- free_seg);
		external "C use <glib.h>"
		end

	g_ptr_array_foreach (an_array, a_func, a_user_data: POINTER)
			-- void g_ptr_array_foreach (GPtrArray *array, GFunc func,
			-- gpointer user_data);
		external "C use <glib.h>"
		end

feature {} -- Structure access
-- Details
	-- GPtrArray

-- typedef struct {
--   gpointer *pdata;
--   guint	    len;
-- } GPtrArray;

-- Contains the public fields of a pointer array.
-- gpointer *pdata; 	points to the array of pointers, which may be moved when the array grows.
-- guint len; 	number of pointers in the array.
	
	get_pdata (a_struct: POINTER): POINTER
		external "C struct GPtrArray get pdata use <glib.h>"
		end
	
	get_len (a_struct: POINTER): INTEGER
			-- TODO: should be NATURAL
		external "C struct GPtrArray get len use <glib.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <glib.h>"
		alias "sizeof(GPtrArray)"
		end
end
