note
	description: "GtkPrintUnixDialog -- A print dialog."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

class GTK_PRINT_UNIX_DIALOG
	-- GtkPrintUnixDialog implements a print dialog for platforms which don't
	-- provide a native print dialog, like Unix. It can be used very much like
	-- any other GTK+ dialog, at the cost of the portability offered by the
	-- high-level printing API

	-- In order to print something with GtkPrintUnixDialog, you need to use
	-- gtk_print_unix_dialog_get_selected_printer() to obtain a GtkPrinter object
	-- and use it to construct a GtkPrintJob using gtk_print_job_new().

	-- GtkPrintUnixDialog uses the following response values:

	--   GTK_RESPONSE_OK     for the "Print" button
	--   GTK_RESPONSE_APPLY  for the "Preview" button
	--   GTK_RESPONSE_CANCEL for the "Cancel" button

	-- Printing support was added in GTK+ 2.10.

inherit
	GTK_DIALOG
		rename
			make as dialog_make
		redefine
			dummy_gobject,
			struct_size
		end
	-- TODO: GtkPrintUnixDialog implements AtkImplementorIface.
	
insert
	GTK_PRINT_UNIX_DIALOG_EXTERNALS
	GTK_PRINT_CAPABILITIES
	
create {ANY} dummy, make, from_external_pointer

feature {} -- Creation
	make (a_title: STRING; a_parent: GTK_WINDOW)
			-- Creates a new GtkPrintUnixDialog with `a_title' and `a_parent' as
			-- the transient parent of the dialog. Both `a_title' and `a_parent'
			-- can be Void.
		do
			from_external_pointer(gtk_print_unix_dialog_new
										 (null_or_string(a_title),
										  null_or(a_parent)))
		end

feature {ANY}
	set_page_setup (a_setup: GTK_PAGE_SETUP)
			--   Sets the page setup of the GtkPrintUnixDialog.
		require setup_not_void: a_setup/=Void
		do
			gtk_print_unix_dialog_set_page_setup(handle,a_setup.handle)
		end

	page_setup: GTK_PAGE_SETUP
			-- the page setup of dialog.
		do
			create Result.from_external_pointer(gtk_print_unix_dialog_get_page_setup(handle))
		end

	set_current_page (a_page: INTEGER)
			-- Sets the current page number. If `a_page' is not -1, this enables
			-- the current page choice for the range of pages to print.
		do
			gtk_print_unix_dialog_set_current_page(handle,a_page)
		end

	current_page: INTEGER
			-- the current page of dialog
		do
			Result:=gtk_print_unix_dialog_get_current_page(handle)
		end

	set_settings (some_settings: GTK_PRINT_SETTINGS)
			-- Sets the GtkPrintSettings for the GtkPrintUnixDialog to
			-- `some_settings' that can be Void. Typically, this is used to restore
			-- saved print settings from a previous print operation before the
			-- print dialog is shown.
		do
			gtk_print_unix_dialog_set_settings(handle,null_or(some_settings))
		end

	settings: GTK_PRINT_SETTINGS
			-- a new GtkPrintSettings object that represents the current values in
			-- the print dialog.
		do
			create Result.from_external_pointer(gtk_print_unix_dialog_get_settings(handle))
			-- Note: the original C documantation says "Note that this creates a
			-- new object, and you need to unref it if don't want to keep
			-- it". Since GTK_PRINT_SETTINGS is a G_OBJECT that ref the underlying
			-- C structure during `from_external_pointer' we can safely unref it
			-- here and let the Garbage Collector handle it nicely.
			Result.unref
		ensure not_void: Result/=Void
		end

	selected_printer: GTK_PRINTER
			-- the currently selected printer
		do
			create Result.from_external_pointer(handle)
		ensure not_void: Result/=Void
		end

	add_custom_tab (a_tab, a_label: GTK_WIDGET)
			--   Adds `a_tab' to the print dialog as a custom tab using `a_label'.
		do
			gtk_print_unix_dialog_add_custom_tab(handle,a_tab.handle,a_label.handle)
		end

	set_manual_capabilities (some_capabilities: INTEGER)
			-- Specify the printing capabilities your application
			-- supports.  For instance, if you can handle scaling the
			-- output then you pass `gtk_print_capability_scale'. If you
			-- don't pass that, then the dialog will only let you select
			-- the scale if the printing system automatically handles
			-- scaling.
		require valid_capabilities: are_valid_print_capabilities(some_capabilities)
		do
			gtk_print_unix_dialog_set_manual_capabilities(handle,some_capabilities)
		end
	
feature {ANY} -- TODO: Properties
	--   "current-page"         gint                  : Read / Write
	--   "page-setup"           GtkPageSetup          : Read / Write
	--   "print-settings"       GtkPrintSettings      : Read / Write
	--   "selected-printer"     GtkPrinter            : Read
		--Property Details
	--
	--  The "current-page" property
	--
	--   "current-page"         gint                  : Read / Write
	--
	--   The current page in the document.
	--
	--   Allowed values: >= -1
	--
	--   Default value: -1
	--
	--   --------------------------------------------------------------------------
	--
	--  The "page-setup" property
	--
	--   "page-setup"           GtkPageSetup          : Read / Write
	--
	--   The GtkPageSetup to use.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "print-settings" property
	--
	--   "print-settings"       GtkPrintSettings      : Read / Write
	--
	--   The GtkPrintSettings used for initializing the dialog.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "selected-printer" property
	--
	--   "selected-printer"     GtkPrinter            : Read
	--
	--   The GtkPrinter which is selected.

feature {ANY}

	struct_size: INTEGER
		external "C inline use <gtk/gtkprintunixdialog.h>"
		alias "sizeof(GtkPrintUnixDialog)"
		end
	

	dummy_gobject: POINTER
		do
			Result:=(gtk_print_unix_dialog_new
						(default_pointer, default_pointer))
		end
end -- class GTK_PRINT_UNIX_DIALOG

