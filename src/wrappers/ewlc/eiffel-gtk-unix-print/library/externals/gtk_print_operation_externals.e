note
	description: "External calls for GTK_PRINT_OPERATION"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PRINT_OPERATION_EXTERNALS

inherit
	ANY
		undefine
			is_equal,
			copy
		end
	
insert
	GTK_UNIT
	GTK_PRINT_OPERATION_RESULT
	GTK_PRINT_OPERATION_ACTIONS
	GTK_PRINT_STATUS
	
feature {} -- External calls

	-- #include <gtk/gtk.h>

	-- #define GTK_PRINT_ERROR
	gtk_print_operation_new: POINTER is
			-- GtkPrintOperation* gtk_print_operation_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_allow_async (an_operation: POINTER; an_allow_async_bool: INTEGER) is
			-- void gtk_print_operation_set_allow_async
			-- (GtkPrintOperation *op, gboolean allow_async);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_get_error (an_operation, a_gerror_handle: POINTER) is
			-- void gtk_print_operation_get_error (GtkPrintOperation *op,
			-- GError **error);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_default_page_setup (an_operation, a_default_page_setup: POINTER) is
			-- void gtk_print_operation_set_default_page_setup
			-- (GtkPrintOperation *op, GtkPageSetup *default_page_setup);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_get_default_page_setup (an_operation: POINTER): POINTER is
			-- GtkPageSetup* gtk_print_operation_get_default_page_setup
			-- (GtkPrintOperation *op);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_print_settings (an_operation, a_print_settings: POINTER) is
			-- void gtk_print_operation_set_print_settings
			-- (GtkPrintOperation *op, GtkPrintSettings *print_settings);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_get_print_settings (an_operation: POINTER): POINTER is
			-- GtkPrintSettings* gtk_print_operation_get_print_settings
			-- (GtkPrintOperation *op);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_job_name (an_operation, a_job_name: POINTER) is
			-- void gtk_print_operation_set_job_name (GtkPrintOperation
			-- *op, const gchar *job_name);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_print_operation_set_n_pages (an_operation: POINTER; an_n_pages: INTEGER) is
			-- void gtk_print_operation_set_n_pages (GtkPrintOperation
			-- *op, gint n_pages);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_current_page (an_operation: POINTER; a_current_page: INTEGER) is
			-- void gtk_print_operation_set_current_page
			-- (GtkPrintOperation *op, gint current_page);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_use_full_page (an_operation: POINTER; full_page_bool: INTEGER) is
			-- void gtk_print_operation_set_use_full_page (GtkPrintOperation *op, gboolean full_page);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_unit (an_operation: POINTER; a_unit: INTEGER) is
			-- void gtk_print_operation_set_unit (GtkPrintOperation *op, GtkUnit 
			-- unit);
		require valid_unit: is_valid_gtk_unit (a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_export_filename (an_operation, a_filename: POINTER) is
			-- void gtk_print_operation_set_export_filename (GtkPrintOperation *op, const gchar *filename);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_show_progress (an_operation: POINTER; show_progress_bool: INTEGER) is
			-- void gtk_print_operation_set_show_progress (GtkPrintOperation *op, gboolean show_progress);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_track_print_status (an_operation: POINTER; track_status_bool: INTEGER) is
			-- void gtk_print_operation_set_track_print_status (GtkPrintOperation *op, gboolean track_status);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_set_custom_tab_label (an_operation, a_label: POINTER) is
			-- void gtk_print_operation_set_custom_tab_label (GtkPrintOperation *op, const gchar *label);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_run (an_operation: POINTER; an_action: INTEGER; a_parent, an_error_handle: POINTER): INTEGER is
			-- GtkPrintOperationResult gtk_print_operation_run (GtkPrintOperation *op, GtkPrintOperationAction action, GtkWindow *parent, GError **error);
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_print_operation_result(Result)
		end

	gtk_print_operation_cancel (an_operation: POINTER) is
			-- void gtk_print_operation_cancel (GtkPrintOperation *op);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_get_status (an_operation: POINTER): INTEGER is
			-- GtkPrintStatus gtk_print_operation_get_status (GtkPrintOperation *op);
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_print_status (Result)
		end

	gtk_print_operation_get_status_string (an_operation: POINTER): POINTER is
			-- const gchar* gtk_print_operation_get_status_string
			-- (GtkPrintOperation *op);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_is_finished (an_operation: POINTER): INTEGER is
			-- gboolean gtk_print_operation_is_finished (GtkPrintOperation *op);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_run_page_setup_dialog (a_parent, a_page_setup, some_settings: POINTER): POINTER is
			-- GtkPageSetup* gtk_print_run_page_setup_dialog (GtkWindow
			-- *parent, GtkPageSetup *page_setup, GtkPrintSettings
			-- *settings);
		external "C use <gtk/gtk.h>"
		end

	-- void (*GtkPageSetupDoneFunc)         (GtkPageSetup *page_setup, gpointer data);

	gtk_print_run_page_setup_dialog_async (a_parent, a_page_setup, some_settings, a_page_setup_done_func, some_data: POINTER) is
			-- void gtk_print_run_page_setup_dialog_async (GtkWindow
			-- *parent, GtkPageSetup *page_setup, GtkPrintSettings
			-- *settings, GtkPageSetupDoneFunc done_cb, gpointer data);
		external "C use <gtk/gtk.h>"
		end

end
