note
	description: "External calls for GTK_ENTRY_COMPLETION"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
					]"					
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ENTRY_COMPLETION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

-- gboolean    (*GtkEntryCompletionMatchFunc)  (GtkEntryCompletion *completion, const gchar *key, GtkTreeIter *iter, gpointer user_data);
	gtk_entry_completion_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_entry  (a_completion: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_set_model  (a_completion, a_model: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_get_model (a_completion: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_set_match_func (a_completion, a_gtkentrycompletionmatchfunc, a_func_data, a_gdestroynotify: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_minimum_key_length (a_completion: POINTER; a_lenght: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_minimum_key_length (a_completion: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_complete (a_completion: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_insert_prefix (a_completion: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_insert_action_text (a_completion: POINTER; an_index: INTEGER; a_text: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_insert_action_markup (a_completion: POINTER; an_index: INTEGER; a_markup: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_delete_action (a_completion: POINTER; an_index: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_text_column (a_completion: POINTER; a_column: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_text_column (a_completion: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_inline_completion (a_completion: POINTER; inline_completion: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_inline_completion (a_completion: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_popup_completion (a_completion: POINTER; popup_completion: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_completion_get_popup_completion (a_completion: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_popup_set_width (a_completion: POINTER; popup_set_width: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_popup_set_width (a_completion: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_set_popup_single_match (a_completion: POINTER; popup_single_match: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_completion_get_popup_single_match (a_completion: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
end
