note
	copyright: "(C) 2005 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class G_SLIST_EXTERNALS
	
inherit ANY undefine is_equal, copy end

feature {} -- external calls
	
	g_slist_alloc: POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_append (a_list, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_prepend (a_list, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end

	g_slist_insert (a_list, some_data: POINTER; a_position: INTEGER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_insert_before (a_slist, a_sibling, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_insert_sorted (a_list, some_data, a_gcomparefunc: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_remove (a_list, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_remove_link (a_list, a_link: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_delete_link (a_list, a_link: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_remove_all (a_list, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_free (a_list: POINTER) is
		external "C use <glib.h>"
		end
	
	g_slist_free_1 (a_list: POINTER) is
		external "C use <glib.h>"
		end

	g_slist_length (a_list: POINTER): INTEGER is
		external "C use <glib.h>"
		ensure Result >=0 -- TODO shall be NATURAL since it is a guint
		end
	
	g_slist_copy                    (a_list: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_reverse                 (a_list: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_sort (a_list, a_gcomparefunc: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_sort_with_data (a_list, a_gcomparedatafunc, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_concat (a_list, another: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_foreach (a_list,a_gfunc, some_data: POINTER) is
		external "C use <glib.h>"
		end

	g_slist_last (a_list: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_next (a_list: POINTER): POINTER is
		external "C macro use <glib.h>"
		end

	g_slist_nth (a_list: POINTER; a_guint: INTEGER): POINTER is
		require positive_guint: a_guint>=0
		external "C use <glib.h>"
		end
	
	g_slist_nth_data (a_list: POINTER;a_guint: INTEGER): POINTER is
		require positive_guint: a_guint>=0
		external "C use <glib.h>"
		end

	g_slist_find (a_list, some_data: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_find_custom (a_list, some_data, a_gcomparefunc: POINTER): POINTER is
		external "C use <glib.h>"
		end
	
	g_slist_position (a_list,a_link: POINTER): INTEGER is
		external "C use <glib.h>"
		end
	
	g_slist_index (a_list, some_data: POINTER): INTEGER is
		external "C use <glib.h>"
		end

	g_slist_push_allocator (an_allocator: POINTER) is
		external "C use <glib.h>"
		end
	
	g_slist_pop_allocator is
		external "C use <glib.h>"
		end

feature {ANY} -- Accessing GSList structure
	g_slist_get_data (a_gslist: POINTER): POINTER is
		external "C struct GSList get data use <glib.h>"
		end
	g_slist_get_next (a_gslist: POINTER): POINTER is
		external "C struct GSList get next use <glib.h>"
		end

	g_slist_set_data (a_gslist,a_data: POINTER) is
		external "C struct GSList set data use <glib.h>"
		end
	g_slist_set_next (a_gslist,a_next: POINTER) is
		external "C struct GSList set next use <glib.h>"
		end

end
