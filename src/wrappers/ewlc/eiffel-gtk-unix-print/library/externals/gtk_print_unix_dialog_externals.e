note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PRINT_UNIX_DIALOG_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_print_unix_dialog_new (a_title, a_parent: POINTER): POINTER is
			-- GtkWidget* gtk_print_unix_dialog_new (const gchar *title, GtkWindow
			-- *parent);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_set_page_setup (a_dialog, a_page_setup: POINTER) is
			-- void gtk_print_unix_dialog_set_page_setup (GtkPrintUnixDialog *dialog, GtkPageSetup *page_setup);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_get_page_setup (a_dialog: POINTER): POINTER is
			-- GtkPageSetup* gtk_print_unix_dialog_get_page_setup (GtkPrintUnixDialog *dialog);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_set_current_page (a_dialog: POINTER; a_current_page: INTEGER) is
			-- void gtk_print_unix_dialog_set_current_page (GtkPrintUnixDialog
			-- *dialog, gint current_page);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_get_current_page (a_dialog: POINTER): INTEGER is
			-- gint gtk_print_unix_dialog_get_current_page (GtkPrintUnixDialog
			-- *dialog);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_set_settings (a_dialog, some_settings: POINTER) is
			-- void gtk_print_unix_dialog_set_settings (GtkPrintUnixDialog *dialog,
			-- GtkPrintSettings *settings);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_get_settings (a_dialog: POINTER): POINTER is
			-- GtkPrintSettings* gtk_print_unix_dialog_get_settings
			-- (GtkPrintUnixDialog *dialog);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_get_selected_printer (a_dialog: POINTER): POINTER is
			-- GtkPrinter* gtk_print_unix_dialog_get_selected_printer
			-- (GtkPrintUnixDialog *dialog);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_add_custom_tab (a_dialog, a_child, a_tab_label: POINTER) is
			-- void gtk_print_unix_dialog_add_custom_tab (GtkPrintUnixDialog *dialog, GtkWidget *child, GtkWidget *tab_label);
		external "C use <gtk/gtkprintunixdialog.h>"
		end

	gtk_print_unix_dialog_set_manual_capabilities (a_dialog: POINTER; some_capabilities: INTEGER) is
			-- void gtk_print_unix_dialog_set_manual_capabilities
			-- (GtkPrintUnixDialog *dialog, GtkPrintCapabilities capabilities);
		external "C use <gtk/gtkprintunixdialog.h>"
		end
end
