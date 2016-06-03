note
	description: "A page setup dialog."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_PAGE_SETUP_UNIX_DIALOG
	-- GtkPageSetupUnixDialog implements a page setup dialog for
	-- platforms which don't provide a native page setup dialog, like
	-- Unix. It can be used very much like any other GTK+ dialog, at
	-- the cost of the portability offered by the high-level printing
	-- API
	
	-- Printing support was added in GTK+ 2.10.

inherit
	GTK_DIALOG
		rename
			make as make_dialog
		redefine
			dummy_gobject,
			struct_size
		end
	
	-- TODO: AtkImplementorIface

create {ANY} dummy, make, from_external_pointer

feature {} -- Creation
	make (a_title: STRING; a_parent: GTK_WINDOW) is
			-- Creates a new page setup dialog.
			
			-- `a_title': the title of the dialog, or Void.
		
			-- `a_parent':  transient parent of the dialog, or Void
		do
			from_external_pointer(gtk_page_setup_unix_dialog_new
										 (null_or_string(a_title),
										  null_or(a_parent)))
		end

	set_page_setup (a_page_setup: GTK_PAGE_SETUP) is
			-- Sets the GtkPageSetup from which the page setup dialog
			-- takes its values.
		require setup_not_void: a_page_setup/=Void
		do
			gtk_page_setup_unix_dialog_set_page_setup(handle,a_page_setup.handle)
		end

	page_setup: GTK_PAGE_SETUP is
			--  the current page setup
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_PAGE_SETUP]
		do
			Result := factory.wrapper_or_void(gtk_page_setup_unix_dialog_get_page_setup(handle))
		end

	set_print_settings (some_settings: GTK_PRINT_SETTINGS) is
			--Sets the GtkPrintSettings from which the page setup dialog takes its
		require settings_not_void: some_settings/= Void
		do
			gtk_page_setup_unix_dialog_set_print_settings
			(handle,some_settings.handle)
		ensure set: print_settings = some_settings
		end

	print_settings: GTK_PRINT_SETTINGS is
			-- The current print settings
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_PRINT_SETTINGS]
		do
			Result := factory.wrapper_or_void(gtk_page_setup_unix_dialog_get_print_settings(handle))
		end

feature {} -- External calls
	-- #include <gtk/gtkpagesetupunixdialog.h>
	
	gtk_page_setup_unix_dialog_new  (a_title, a_parent: POINTER): POINTER is
			-- GtkWidget* gtk_page_setup_unix_dialog_new (const gchar
			-- *title, GtkWindow *parent);
		external "C use <gtk/gtkpagesetupunixdialog.h>"
		end

	gtk_page_setup_unix_dialog_set_page_setup (a_dialog, a_page_setup: POINTER) is
			--	void gtk_page_setup_unix_dialog_set_page_setup
			--	(GtkPageSetupUnixDialog *dialog, GtkPageSetup
			--	*page_setup);
		external "C use <gtk/gtkpagesetupunixdialog.h>"
		end

	gtk_page_setup_unix_dialog_get_page_setup (a_dialog: POINTER): POINTER is
			--	GtkPageSetup* gtk_page_setup_unix_dialog_get_page_setup
			--	(GtkPageSetupUnixDialog *dialog);
		external "C use <gtk/gtkpagesetupunixdialog.h>"
		end

	gtk_page_setup_unix_dialog_set_print_settings (a_dialog, a_print_settings: POINTER) is
			-- void gtk_page_setup_unix_dialog_set_print_settings
			-- (GtkPageSetupUnixDialog *dialog, GtkPrintSettings
			-- *print_settings);
		external "C use <gtk/gtkpagesetupunixdialog.h>"
		end

	gtk_page_setup_unix_dialog_get_print_settings (a_dialog: POINTER): POINTER is
			-- GtkPrintSettings*
			-- gtk_page_setup_unix_dialog_get_print_settings
			-- (GtkPageSetupUnixDialog *dialog);
		external "C use <gtk/gtkpagesetupunixdialog.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtkpagesetupunixdialog.h>"
		alias "sizeof(GtkPageSetupUnixDialog)"
		end

	dummy_gobject: POINTER is
		do
			Result:=(gtk_page_setup_unix_dialog_new
						(default_pointer, default_pointer))
		end
end -- class GTK_PAGE_SETUP_UNIX_DIALOG
