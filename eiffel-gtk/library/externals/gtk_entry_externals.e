indexing
	description: "External calls for GTK_ENTRY"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ENTRY_EXTERNALS

feature {NONE} -- External calls

	gtk_entry_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_set_text (an_entry, a_text: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_position (an_entry: POINTER; a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_text (an_entry: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_select_region (an_entry: POINTER; a_start, an_end: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_visibility (an_entry: POINTER; visible: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_invisible_char (an_entry: POINTER; a_character: INTEGER) is
			-- Currently (version 2.9.1) `a_character' is a gunichar,
			-- mapped as guint32
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_editable (an_entry: POINTER; editable: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_max_length (an_entry: POINTER; a_max: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_activates_default (an_entry: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_has_frame         (an_entry: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_width_chars       (an_entry: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_activates_default (an_entry: POINTER; setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_has_frame         (an_entry: POINTER; setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_width_chars       (an_entry: POINTER; n_chars: INTEGER) is
		external "C use <gtk/gtk.h>"
	end

	gtk_entry_get_invisible_char    (an_entry: POINTER): INTEGER is
			-- Result is gunichar. At GLib's 2.9.1 is mapped as guint32
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_set_alignment (an_entry: POINTER; an_xalign: REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_alignment (an_entry: POINTER): REAL is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_get_layout (an_entry: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_layout_offsets (an_entry,an_x,an_y: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_layout_index_to_text_index(an_entry: POINTER; layout_index: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_text_index_to_layout_index(an_entry: POINTER; text_index: INTEGER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_get_max_length        (an_entry: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_get_visibility        (an_entry: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_set_completion        (an_entry,a_gtkentrycompletion: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_completion (an_entry: POINTER): POINTER  is
		external "C use <gtk/gtk.h>"
		end
	



-- Signals

-- "activate"  void        user_function      (an_entry: POINTER; gpointer  user_data)      : Run last / Action
-- "backspace" void        user_function      (an_entry: POINTER; gpointer  user_data)      : Run last / Action
-- "copy-clipboard"
--             void        user_function      (an_entry: POINTER; gpointer  user_data)      : Run last / Action
-- "cut-clipboard"
--             void        user_function      (an_entry: POINTER; gpointer  user_data)      : Run last / Action
-- "delete-from-cursor"
--             void        user_function      (GtkEntry     *entry, GtkDeleteType arg1, gint          arg2, gpointer      user_data)      : Run last / Action
-- "insert-at-cursor"
--             void        user_function      (an_entry: POINTER; gchar    *arg1, gpointer  user_data)      : Run last / Action
-- "move-cursor"
--             void        user_function      (GtkEntry       *entry, GtkMovementStep arg1, gint            arg2, gboolean        arg3, gpointer        user_data)      : Run last / Action
-- "paste-clipboard"
--             void        user_function      (an_entry: POINTER; gpointer  user_data)      : Run last / Action
-- "populate-popup"
--             void        user_function      (an_entry: POINTER; GtkMenu  *arg1, gpointer  user_data)      : Run last
-- "toggle-overwrite"
--             void        user_function      (an_entry: POINTER; gpointer  user_data)      : Run last / Action


end
