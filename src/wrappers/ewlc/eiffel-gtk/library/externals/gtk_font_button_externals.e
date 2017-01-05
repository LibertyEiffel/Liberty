note
	description: "External calls for GTK_FONT_BUTTON"
	copyright: "Copyright (C) 2007-2017: $EWLC_developer, $original_copyright_holder"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FONT_BUTTON_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	
	 gtk_font_button_new: POINTER
			-- 	GtkWidget*  gtk_font_button_new             (void);
		external "C use <gtk/gtk.h>"
		end

	 gtk_font_button_new_with_font (a_font_name: POINTER): POINTER
			-- GtkWidget* gtk_font_button_new_with_font (const gchar
			-- *fontname);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_set_font_name (a_font_button, a_font_name: POINTER): INTEGER
			-- gboolean gtk_font_button_set_font_name (GtkFontButton
			-- *font_button, const gchar *fontname);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_get_font_name  (a_font_button: POINTER): POINTER
			-- 	const gchar* gtk_font_button_get_font_name  (GtkFontButton *font_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_set_show_style (a_font_button: POINTER; a_font_style: INTEGER)
			-- void gtk_font_button_set_show_style (GtkFontButton
			-- *font_button, gboolean show_style);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_get_show_style (a_font_button: POINTER): INTEGER
			-- gboolean gtk_font_button_get_show_style (GtkFontButton
			-- *font_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_set_show_size (a_font_button: POINTER; a_show_size: INTEGER)
			-- void gtk_font_button_set_show_size (GtkFontButton
			-- *font_button, gboolean show_size);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_get_show_size (a_font_button: POINTER): INTEGER
			-- gboolean gtk_font_button_get_show_size (GtkFontButton
			-- *font_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_set_use_font (a_font_button: POINTER; a_use_font: INTEGER)
			-- void gtk_font_button_set_use_font (GtkFontButton
			-- *font_button, gboolean use_font);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_get_use_font (a_font_button: POINTER): INTEGER
			-- gboolean gtk_font_button_get_use_font (GtkFontButton
			-- *font_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_set_use_size (a_font_button: POINTER; a_use_size: INTEGER)
			-- void gtk_font_button_set_use_size (GtkFontButton
			-- *font_button, gboolean use_size);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_get_use_size (a_font_button: POINTER): INTEGER
			-- gboolean gtk_font_button_get_use_size (GtkFontButton
			-- *font_button);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_set_title (a_font_button, a_title: POINTER)
			-- void gtk_font_button_set_title (GtkFontButton
			-- *font_button, const gchar *title);
		external "C use <gtk/gtk.h>"
		end

	gtk_font_button_get_title (a_font_button: POINTER): POINTER
			-- const gchar* gtk_font_button_get_title (GtkFontButton
			-- *font_button);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkFontButton)"
		end
end
