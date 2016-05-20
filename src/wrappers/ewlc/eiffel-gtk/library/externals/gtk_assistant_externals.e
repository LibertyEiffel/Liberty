note
	description: "External calls for GTK_ASSISTANT"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ASSISTANT_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GTK_ASSISTANT_PAGE_TYPE_ENUM

feature {} -- External calls
	 gtk_assistant_new: POINTER is
			--  GtkWidget* gtk_assistant_new (void);
		external "C use <gtk/gtk.h>"
		end
	
	 gtk_assistant_get_current_page (an_assistant: POINTER): INTEGER is
			--  gint gtk_assistant_get_current_page (GtkAssistant *assistant);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_set_current_page (an_assistant: POINTER; a_page_num: INTEGER) is
			-- void gtk_assistant_set_current_page (GtkAssistant
			-- *assistant, gint page_num);
		external "C use <gtk/gtk.h>"
		end

	 gtk_assistant_get_n_pages (an_assistant: POINTER): INTEGER is
			--  gint gtk_assistant_get_n_pages (GtkAssistant *assistant);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_assistant_get_nth_page (an_assistant: POINTER; a_page_num: INTEGER): POINTER is
			-- GtkWidget* gtk_assistant_get_nth_page (GtkAssistant
			-- *assistant, gint page_num);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_prepend_page (an_assistant, a_page: POINTER): INTEGER is
			-- gint gtk_assistant_prepend_page (GtkAssistant *assistant,
			-- GtkWidget *page);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_append_page (an_assistant, a_page: POINTER): INTEGER is
		--  gint gtk_assistant_append_page (GtkAssistant *assistant, GtkWidget *page);
	external "C use <gtk/gtk.h>"
	end

	 gtk_assistant_insert_page (an_assistant, a_page: POINTER; a_position: INTEGER): INTEGER is
		--  gint gtk_assistant_insert_page (GtkAssistant *assistant, GtkWidget *page, gint position);
	external "C use <gtk/gtk.h>"
	end

	-- TODO: gint (*GtkAssistantPageFunc) (gint current_page, gpointer 
	-- data);
	
	gtk_assistant_set_forward_page_func (an_assistant, a_page_func, some_data, a_destroy_notify: POINTER) is
			-- void gtk_assistant_set_forward_page_func (GtkAssistant
			-- *assistant, GtkAssistantPageFunc page_func, gpointer data,
			-- GDestroyNotify destroy);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_set_page_type (an_assistant, a_page: POINTER; a_page_type: INTEGER) is
			-- void gtk_assistant_set_page_type (GtkAssistant *assistant,
			-- GtkWidget *page, GtkAssistantPageType type);
	external "C use <gtk/gtk.h>"
	end

	gtk_assistant_get_page_type (an_assistant, a_page: POINTER): INTEGER is
			-- GtkAssistantPageType gtk_assistant_get_page_type
			-- (GtkAssistant *assistant, GtkWidget *page);
		external "C use <gtk/gtk.h>"
			-- TODO: ensure valid_assistant_page_type: is_valid_gtk_assistant_page_type(Result)
		end

	gtk_assistant_set_page_title (an_assistant, a_page, a_title: POINTER) is
			--  void gtk_assistant_set_page_title (GtkAssistant
			--  *assistant, GtkWidget *page, const gchar *title);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_get_page_title (an_assistant, a_page: POINTER): POINTER is
			-- const gchar* gtk_assistant_get_page_title (GtkAssistant
			-- *assistant, GtkWidget *page);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_assistant_set_page_header_image (an_assistant, a_page, a_pixbuf: POINTER) is
			-- void gtk_assistant_set_page_header_image (GtkAssistant
			-- *assistant, GtkWidget *page, GdkPixbuf *pixbuf);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_get_page_header_image (an_assistant, a_page: POINTER): POINTER is
			-- GdkPixbuf* gtk_assistant_get_page_header_image
			-- (GtkAssistant *assistant, GtkWidget *page);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_set_page_side_image (an_assistant, a_page, a_pixbuf: POINTER) is
			-- void gtk_assistant_set_page_side_image (GtkAssistant
			-- *assistant, GtkWidget *page, GdkPixbuf *pixbuf);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_get_page_side_image (an_assistant, a_page: POINTER): POINTER is
			-- GdkPixbuf* gtk_assistant_get_page_side_image (GtkAssistant
			-- *assistant, GtkWidget *page);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_set_page_complete (an_assistant, a_page: POINTER; a_complete_bool: INTEGER) is
			-- void gtk_assistant_set_page_complete (GtkAssistant
			-- *assistant, GtkWidget *page, gboolean complete);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_assistant_get_page_complete (an_assistant, a_page: POINTER): INTEGER is
			-- gboolean gtk_assistant_get_page_complete (GtkAssistant
			-- *assistant, GtkWidget *page);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_assistant_add_action_widget (an_assistant, a_child: POINTER) is
			-- void gtk_assistant_add_action_widget (GtkAssistant *assistant, GtkWidget *child);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_assistant_remove_action_widget (an_assistant, a_child: POINTER) is
			--  void gtk_assistant_remove_action_widget (GtkAssistant *assistant, GtkWidget *child);
		external "C use <gtk/gtk.h>"
		end

	gtk_assistant_update_buttons_state (an_assistant: POINTER) is
			--  void gtk_assistant_update_buttons_state (GtkAssistant *assistant);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAssistant)"
		end
end
