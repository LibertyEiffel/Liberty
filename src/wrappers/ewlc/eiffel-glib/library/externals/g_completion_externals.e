note
	description: "External calls for G_COMPLETION"
	copyright: "Copyright (C) 2007 Paolo Redaelli"
	license: "LGPL v2 or later"

deferred class G_COMPLETION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	-- gchar* (*GCompletionFunc) (gpointer );
	
	g_completion_new (a_gcompletionfunc:POINTER): POINTER
			-- 	GCompletion* g_completion_new (GCompletionFunc func);
		external "C use <glib.h>"
		end

	g_completion_add_items (a_cmp, some_items: POINTER)
			--  void g_completion_add_items (GCompletion *cmp, GList *items);
		external "C use <glib.h>"
		end
	
	g_completion_remove_items (a_cmp, some_items: POINTER)
			--  void g_completion_remove_items (GCompletion *cmp, GList *items);
		external "C use <glib.h>"
		end
		
	g_completion_clear_items (a_cmp: POINTER)
			--  void g_completion_clear_items (GCompletion *cmp);
		external "C use <glib.h>"
		end
		
	g_completion_complete (a_cmp, a_prefix, a_new_prefix_ref: POINTER): POINTER
			--  GList* g_completion_complete (GCompletion *cmp, const gchar *prefix, gchar **new_prefix);
		external "C use <glib.h>"
		end
		
	g_completion_complete_utf8 (a_cmp, a_prefix, a_new_prefix_ref: POINTER): POINTER
			--  GList* g_completion_complete_utf8 (GCompletion *cmp, const gchar *prefix, gchar **new_prefix);
		external "C use <glib.h>"
		end
	
	g_completion_set_compare (a_cmp, a_gcompletion_strncmp: POINTER)
			--  void g_completion_set_compare (GCompletion *cmp, GCompletionStrncmpFunc strncmp_func);
		external "C use <glib.h>"
		end
		
	--  gint (*GCompletionStrncmpFunc) (const gchar *s1, const gchar *s2, gsize n);
		
	g_completion_free (a_cmp: POINTER)
			--  void g_completion_free (GCompletion *cmp);
		external "C use <glib.h>"
		end
		
feature {ANY} -- size
 struct_size: INTEGER
		external "C inline use <gib.h>"
		alias "sizeof(GCompletion)"
		end
end
