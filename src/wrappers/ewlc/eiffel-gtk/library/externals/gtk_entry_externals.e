note
	description: "External calls for GTK_ENTRY"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GTK_ENTRY_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_entry_new: POINTER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_set_text (an_entry, a_text: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_position (an_entry: POINTER; a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_text (an_entry: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_select_region (an_entry: POINTER; a_start, an_end: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_visibility (an_entry: POINTER; visible: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_invisible_char (an_entry: POINTER; a_character: INTEGER)
			-- Currently (version 2.9.1) `a_character' is a gunichar,
			-- mapped as guint32
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_editable (an_entry: POINTER; editable: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_max_length (an_entry: POINTER; a_max: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_activates_default (an_entry: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_has_frame         (an_entry: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_width_chars       (an_entry: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_activates_default (an_entry: POINTER; setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_has_frame         (an_entry: POINTER; setting: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_set_width_chars       (an_entry: POINTER; n_chars: INTEGER)
		external "C use <gtk/gtk.h>"
	end

	gtk_entry_get_invisible_char    (an_entry: POINTER): INTEGER
			-- Result is gunichar. At GLib's 2.9.1 is mapped as guint32
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_set_alignment (an_entry: POINTER; an_xalign: REAL)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_alignment (an_entry: POINTER): REAL
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_get_layout (an_entry: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_layout_offsets (an_entry,an_x,an_y: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_layout_index_to_text_index(an_entry: POINTER; layout_index: INTEGER): INTEGER
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_text_index_to_layout_index(an_entry: POINTER; text_index: INTEGER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_get_max_length        (an_entry: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_get_visibility        (an_entry: POINTER): INTEGER
		external "C use <gtk/gtk.h>"
		end
	
	gtk_entry_set_completion        (an_entry,a_gtkentrycompletion: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_entry_get_completion (an_entry: POINTER): POINTER
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
