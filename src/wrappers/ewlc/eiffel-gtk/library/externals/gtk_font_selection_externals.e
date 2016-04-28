note
	description: "External calls for GTK_FONT_SELECTION"
	copyright: "Copyright (C) 2007 Paolo Redaelli, Gtk team"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FONT_SELECTION_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_font_selection_new: POINTER is
			-- GtkWidget* gtk_font_selection_new (void);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_font_selection_get_font (a_fontsel: POINTER): POINTER is
			-- GdkFont* gtk_font_selection_get_font (GtkFontSelection
			-- *fontsel);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_get_font_name (a_fontsel: POINTER): POINTER is
			-- gchar* gtk_font_selection_get_font_name (GtkFontSelection
			-- *fontsel);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_set_font_name (a_fontsel, a_fontname: POINTER): INTEGER is
			-- gboolean gtk_font_selection_set_font_name
			-- (GtkFontSelection *fontsel, const gchar *fontname);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_get_preview_text (a_fontsel: POINTER): POINTER is
			-- const gchar* gtk_font_selection_get_preview_text
			-- (GtkFontSelection *fontsel);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_selection_set_preview_text (a_fontsel, a_text: POINTER) is
			--	void gtk_font_selection_set_preview_text (GtkFontSelection
			--	*fontsel, const gchar *text);
		external "C use <gtk/gtk.h>"
		end

	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFontSelection)"
		end
end
