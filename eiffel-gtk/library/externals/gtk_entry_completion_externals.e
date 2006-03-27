indexing
	description: "External calls for GTK_ENTRY_COMPLETION"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ENTRY_COMPLETION_EXTERNALS

feature {NONE} -- External calls

-- gboolean    (*GtkEntryCompletionMatchFunc)  (GtkEntryCompletion *completion, const gchar *key, GtkTreeIter *iter, gpointer user_data);
	gtk_entry_completion_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_entry  (a_completion: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_set_model  (a_completion, a_model: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_get_model (a_completion: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_set_match_func (a_completion, a_gtkentrycompletionmatchfunc, a_func_data, a_gdestroynotify: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_minimum_key_length (a_completion: POINTER; a_lenght: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_minimum_key_length (a_completion: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_complete (a_completion: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_insert_prefix (a_completion: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_insert_action_text (a_completion: POINTER; an_index: INTEGER; a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_insert_action_markup (a_completion: POINTER; an_index: INTEGER; a_markup: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_delete_action (a_completion: POINTER; an_index: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_text_column (a_completion: POINTER; a_column: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_text_column (a_completion: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_inline_completion (a_completion: POINTER; inline_completion: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_inline_completion (a_completion: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_popup_completion (a_completion: POINTER; popup_completion: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_get_popup_completion (a_completion: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_popup_set_width (a_completion: POINTER; popup_set_width: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_popup_set_width (a_completion: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_popup_single_match (a_completion: POINTER; popup_single_match: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_popup_single_match (a_completion: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
end
