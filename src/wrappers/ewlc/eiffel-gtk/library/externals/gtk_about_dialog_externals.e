note
	description: "GtkAboutDialog - Display information about an application."
	copyright: "[
					Copyright (C) 2006 Paolo Redaelli, GTK+ team
					
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

deferred class GTK_ABOUT_DIALOG_EXTERNALS

inherit
	ANY undefine is_equal, copy end

feature {} -- External calls 
	gtk_about_dialog_new: POINTER is
			-- 	GtkWidget* gtk_about_dialog_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_program_name (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_name (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		alias "gtk_about_dialog_get_name"
		end

	gtk_about_dialog_set_program_name (an_about, a_name: POINTER) is
			-- 	void gtk_about_dialog_set_name (GtkAboutDialog *about, const gchar *name);
		external "C use <gtk/gtk.h>"
		alias "gtk_about_dialog_set_name"
		end

	gtk_about_dialog_get_version (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_version (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_version (an_about, a_version: POINTER) is
			-- 	void gtk_about_dialog_set_version (GtkAboutDialog *about, const gchar *version);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_copyright (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_copyright (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_copyright (an_about, a_copyright: POINTER) is
			-- 	void gtk_about_dialog_set_copyright (GtkAboutDialog *about, const gchar *copyright);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_comments (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_comments (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_comments (an_about, some_comments: POINTER) is
			-- 	void gtk_about_dialog_set_comments (GtkAboutDialog *about, const gchar *comments);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_license (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_license (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_license (an_about, a_license: POINTER) is
			-- 	void gtk_about_dialog_set_license (GtkAboutDialog *about, const gchar *license);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_wrap_license (an_about: POINTER): INTEGER is
			-- 	gboolean gtk_about_dialog_get_wrap_license (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_wrap_license (an_about: POINTER; wrap_license_bool: INTEGER) is
			-- 	void gtk_about_dialog_set_wrap_license (GtkAboutDialog *about, gboolean wrap_license);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_website (an_about: POINTER): POINTER is
			-- const gchar* gtk_about_dialog_get_website (GtkAboutDialog
			-- *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_website (an_about, a_website: POINTER) is
			-- 	void gtk_about_dialog_set_website (GtkAboutDialog *about, const gchar *website);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_website_label (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_website_label (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_website_label (an_about, a_website_label: POINTER) is
			-- 	void gtk_about_dialog_set_website_label (GtkAboutDialog *about, const gchar *website_label);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_authors (an_about: POINTER): POINTER is
			-- 	const gchar* const * gtk_about_dialog_get_authors (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_authors (an_about, some_authors: POINTER) is
			-- 	void gtk_about_dialog_set_authors (GtkAboutDialog *about, const gchar **authors);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_artists (an_about: POINTER): POINTER is
			-- 	const gchar* const * gtk_about_dialog_get_artists (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_artists (an_about, some_artists: POINTER) is
			-- 	void gtk_about_dialog_set_artists (GtkAboutDialog *about, const gchar **artists);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_documenters (an_about: POINTER): POINTER is
			-- const gchar* const * gtk_about_dialog_get_documenters
			-- (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_documenters (an_about, some_documenters: POINTER) is
			-- void gtk_about_dialog_set_documenters (GtkAboutDialog
			-- *about, const gchar **documenters);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_translator_credits (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_translator_credits (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_translator_credits (an_about, a_translator_credits: POINTER) is
			-- 	void gtk_about_dialog_set_translator_credits (GtkAboutDialog *about, const gchar *translator_credits);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_logo (an_about: POINTER): POINTER is
			-- GdkPixbuf* gtk_about_dialog_get_logo (GtkAboutDialog
			-- *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_logo (an_about, a_logo: POINTER) is
			-- void gtk_about_dialog_set_logo (GtkAboutDialog *about,
			-- GdkPixbuf *logo);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_get_logo_icon_name (an_about: POINTER): POINTER is
			-- 	const gchar* gtk_about_dialog_get_logo_icon_name (GtkAboutDialog *about);
		external "C use <gtk/gtk.h>"
		end

	gtk_about_dialog_set_logo_icon_name (an_about, an_icon_name: POINTER) is
			-- 	void gtk_about_dialog_set_logo_icon_name (GtkAboutDialog *about, const gchar *icon_name);
		external "C use <gtk/gtk.h>"
		end

	--	void (*GtkAboutDialogActivateLinkFunc) (GtkAboutDialog *about,
	--	const gchar *link, gpointer data);
		
	-- GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_email_hook
	-- (GtkAboutDialogActivateLinkFunc func, gpointer data,
	-- GDestroyNotify destroy);

	-- GtkAboutDialogActivateLinkFunc gtk_about_dialog_set_url_hook
	-- (GtkAboutDialogActivateLinkFunc func, gpointer data,
	-- GDestroyNotify destroy) is
		

	-- void gtk_show_about_dialog (GtkWindow *parent, const gchar
	-- *first_property_name, ...);
		
end -- class GTK_ABOUT_DIALOG_EXTERNALS
