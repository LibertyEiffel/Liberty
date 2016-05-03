note
	description: "External calls for GTK_PRINTER"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PRINTER_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_printer_new (a_name, a_backend: POINTER; virtual_bool: INTEGER): POINTER is
			-- GtkPrinter* gtk_printer_new (const gchar *name,
			-- GtkPrintBackend *backend, gboolean virtual_);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_printer_get_backend (a_printer: POINTER): POINTER is
			-- 	GtkPrintBackend* gtk_printer_get_backend (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_get_name (a_printer: POINTER): POINTER is
			-- 	const gchar* gtk_printer_get_name (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_get_state_message (a_printer: POINTER): POINTER is
			-- 	const gchar* gtk_printer_get_state_message (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_get_description (a_printer: POINTER): POINTER is
			-- 	const gchar* gtk_printer_get_description (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_get_location (a_printer: POINTER): POINTER is
			-- 	const gchar* gtk_printer_get_location (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_get_icon_name (a_printer: POINTER): POINTER is
			-- 	const gchar* gtk_printer_get_icon_name (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_get_job_count (a_printer: POINTER): INTEGER is
			-- 	gint gtk_printer_get_job_count (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_is_active (a_printer: POINTER): INTEGER is
			-- 	gboolean gtk_printer_is_active (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_is_virtual (a_printer: POINTER): INTEGER is
			-- 	gboolean gtk_printer_is_virtual (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_is_default (a_printer: POINTER): INTEGER is
			-- 	gboolean gtk_printer_is_default (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_accepts_ps (a_printer: POINTER): INTEGER is
			-- 	gboolean gtk_printer_accepts_ps (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_accepts_pdf (a_printer: POINTER): INTEGER is
			-- 	gboolean gtk_printer_accepts_pdf (GtkPrinter *printer);
		external "C use <gtk/gtk.h>"
		end

	gtk_printer_compare (an_a, a_b: POINTER): INTEGER is
			-- 	gint gtk_printer_compare (GtkPrinter *a, GtkPrinter *b);
		external "C use <gtk/gtk.h>"
		end

	-- gboolean (*GtkPrinterFunc) (GtkPrinter *printer, gpointer data);
	gtk_enumerate_printers (a_func, some_data, a_destroy_notify: POINTER; wait_bool: INTEGER): INTEGER is
			-- 	void gtk_enumerate_printers (GtkPrinterFunc func, gpointer data, GDestroyNotify destroy, gboolean wait);
		external "C use <gtk/gtk.h>"
		end


feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPrinter)"
		end
end
