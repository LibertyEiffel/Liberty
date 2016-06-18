note
	description: "GtkPrintOperation: High-level Printing API."
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

class GTK_PRINT_OPERATION
	-- GTK_PRINT_OPERATION is the high-level, portable printing API. It
	-- looks a bit different than other GTK+ dialogs such as the
	-- GtkFileChooser, since some platforms don't expose enough
	-- infrastructure to implement a good print dialog. On such
	-- platforms, GtkPrintOperation uses the native print dialog.  On
	-- platforms which do not provide a native print dialog, GTK+ uses
	-- its own, see GtkPrintUnixDialog.
	
	-- The typical way to use the high-level printing API is to create
	-- a GtkPrintOperation object with `make' when the user selects to
	-- print. Then you set some properties on it, e.g. the page size,
	-- any GtkPrintSettings from previous print operations, the number
	-- of pages, the current page, etc.

	-- Then you start the print operation by calling `run'.  It will
	-- then show a dialog, let the user select a printer and options.
	-- When the user finished the dialog various signals will be
	-- emitted on the GtkPrintOperation, the main one being
	-- ::draw-page, which you are supposed to catch and render the page
	-- on the provided GtkPrintContext using Cairo.

	-- TODO: Eiffellize this C Example: The high-level printing API

	-- static GtkPrintSettings *settings = NULL;
	--
	-- static void
	-- do_print (void)
	-- {
	--   GtkPrintOperation *print;
	--   GtkPrintOperationResult res;
	--
	--   print = gtk_print_operation_new ();
	--
	--   if (settings != NULL)
	--     gtk_print_operation_set_print_settings (print, settings);
	--
	--   g_signal_connect (print, "begin_print", G_CALLBACK (begin_print), NULL);
	--   g_signal_connect (print, "draw_page", G_CALLBACK (draw_page), NULL);
	--
	--   res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG,
	--                                  GTK_WINDOW (main_window), NULL);
	--
	--   if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
	--     {
	--       if (settings != NULL)
	--         g_object_unref (settings);
	--       settings = g_object_ref (gtk_print_operation_get_print_settings (print));
	--     }
	--
	--   g_object_unref (print);
	-- }

	--   By default GtkPrintOperation uses an external application to do print
	--   preview. To implement a custom print preview, an application must connect
	--   to the preview signal. The functions
	--   GTK_PRINT_OPERATION_PRINT_preview_render_page(),
	--   gtk_print_operation_preview_end_preview() and
	--   gtk_print_operation_preview_is_selected() are useful when implementing a
	--   print preview.

	--   Printing support was added in GTK+ 2.10.

inherit 
	G_OBJECT
	GTK_PRINT_OPERATION_PREVIEW
		redefine
			struct_size
		end
	
insert
	GTK_PRINT_OPERATION_EXTERNALS
	GTK_PRINT_OPERATION_ACTIONS
	G_OBJECT_FACTORY[GTK_PAGE_SETUP]
		-- SHARED_G_ERROR
	GTK -- to get error
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkPrintOperation.
		do
			from_external_pointer(gtk_print_operation_new)
		end

feature {ANY} -- Setters
	set_allow_async (a_setting: BOOLEAN)
			-- Sets whether the `run' feature may return before the print
			-- operation is completed. Note that some platforms may not
			-- allow asynchronous operation. Make `a_setting' True to
			-- allow asynchronous operation.
		do
			gtk_print_operation_set_allow_async(handle, a_setting.to_integer) 
		ensure set: a_setting = async_allowed
		end

	set_default_page_setup (a_default_page_setup: GTK_PAGE_SETUP)
			-- Makes `a_default_page_setup' the default page setup.
			
			-- This page setup will be used by gtk_print_operation_run(),
			-- but it can be overridden on a per-page basis by connecting
			-- to the ::request-page-setup signal.

			-- `a_default_page_setup' can be Void. TODO: what's the 
			-- meaning of a Void page setup?

		do
			gtk_print_operation_set_default_page_setup
			(handle, null_or(a_default_page_setup))
		end

	set_print_settings (some_print_settings: GTK_PRINT_SETTINGS)
			-- Sets the print settings. This is typically used to
			-- re-establish print settings from a previous print
			-- operation, see `run'.
			
			-- `some_print_settings' can be Void.
		do
			gtk_print_operation_set_print_settings
			(handle, null_or(some_print_settings))
		end

	set_job_name (a_job_name: STRING)
			-- Sets the name of the print job. The name is used to
			-- identify the job (e.g.  in monitoring applications like
			-- eggcups). If you don't set a job name, GTK+ picks a
			-- default one by numbering successive print jobs.
		require name_not_void: a_job_name /= Void
		do
			gtk_print_operation_set_job_name(handle,a_job_name.to_external)
		end

	set_n_pages (a_number: INTEGER)
			-- Sets the number of pages in the document.

			-- This must be set to a positive number before the rendering
			-- starts. It may be set in a ::begin-print signal hander.
	
			-- Note that the page numbers passed to the
			-- ::request-page-setup and ::draw-page signals are 0-based,
			-- i.e. if the user chooses to print all pages, the last
			-- ::draw-page signal will be for page n_pages - 1.  
		require non_negative: a_number>=0
		do
			gtk_print_operation_set_n_pages (handle, a_number)
		end

	set_current_page (a_current_page_number: INTEGER)
			-- Sets the current page; `a_current_page_number'
		
			-- If this is called before `run', the user will be able to
			-- select to print only the current page.
		
			-- Note that this only makes sense for pre-paginated documents.
		do
			gtk_print_operation_set_current_page(handle,a_current_page_number)
		end

	set_use_full_page (a_setting: BOOLEAN)
			-- If `a_setting' is True, the transformation for the cairo
			-- context obtained from GTK_PRINT_CONTEXT puts the origin at
			-- the top left corner of the page (which may not be the top
			-- left corner of the sheet, depending on page orientation
			-- and the number of pages per sheet). Otherwise, the origin
			-- is at the top left corner of the imageable area
			-- (i.e. inside the margins).
		do
			gtk_print_operation_set_use_full_page(handle, a_setting.to_integer)
		end

	set_unit (a_unit: INTEGER)
			-- Sets up the transformation for the cairo context obtained
			-- from GtkPrintContext in such a way that distances are
			-- measured in `a_unit'.
		require valid_unit: is_valid_gtk_unit(a_unit)
		do
			gtk_print_operation_set_unit (handle, a_unit)
		end

	set_export_filename (a_file_name: STRING)
			-- Sets up the GtkPrintOperation to generate a file instead
			-- of showing the print dialog. The indended use of this
			-- function is for implementing "Export to PDF"
			-- actions. Currently, PDF is the only supported format.
			
			-- "Print to PDF" support is independent of this and is done
			-- by letting the user pick the "Print to PDF" item from the
			-- list of printers in the print dialog.
		require name_not_void: a_file_name/=Void
		do
			gtk_print_operation_set_export_filename(handle,
																 a_file_name.to_external)
		end

	set_show_progress (a_setting: BOOLEAN)
			-- If `a_setting' is True, the print operation will show a
			-- progress dialog during the print operation.
		do
			gtk_print_operation_set_show_progress(handle,a_setting.to_integer)
		end
	
	set_track_print_status (a_setting: BOOLEAN)
			-- If `a_setting' is True, the print operation will try to
			-- continue report on the status of the print job in the
			-- printer queues and printer. This can allow your
			-- application to show things like "out of paper" issues, and
			-- when the print job actually reaches the printer.

			-- This feature is often implemented using some form of
			-- polling, so it should not be enabled unless needed.
		do
			gtk_print_operation_set_track_print_status
			(handle,a_setting.to_integer)
		end

	set_custom_tab_label (a_label: STRING)
			-- Sets the label for the tab holding custom widgets to 
			-- `a_label'; if Void the default label is used
		do
			if a_label=Void then
				gtk_print_operation_set_custom_tab_label(handle,default_pointer)
			else
				gtk_print_operation_set_custom_tab_label(handle,a_label.to_external)
			end
		end
	
feature {ANY} -- Getters
	-- TODO: void        gtk_print_operation_get_error   (GtkPrintOperation *op,
	--                                              GError **error);
	
	--   Call this when the result of a print operation is
	--   GTK_PRINT_OPERATION_RESULT_ERROR, either as returned by
	--   gtk_print_operation_run(), or in the ::done signal handler. The returned
	--   GError will contain more details on what went wrong.
	--
	--   op :    a GtkPrintOperation
	--   error : return location for the error
	--

	default_page_setup: GTK_PAGE_SETUP
			-- The default page setup. Can be Void
		local ptr: POINTER; r: G_OBJECT_EXPANDED_FACTORY[GTK_PAGE_SETUP]
		do
			ptr:=gtk_print_operation_get_default_page_setup(handle)
			if ptr.is_not_null then
				Result := existant_wrapper(ptr)
				if Result=Void then
					create Result.from_external_pointer(ptr)
				end    				
			end
		end

	settings: GTK_PRINT_SETTINGS
			-- The current print settings. Void until either
			-- `set_print_settings' or `run' have been called.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_PRINT_SETTINGS]
		do
			Result := factory.wrapper_or_void (gtk_print_operation_get_print_settings(handle))
		end

	operation_result: INTEGER
			-- The result of the last `run' call.
		
	run (an_action: INTEGER; a_parent: GTK_WINDOW)
			-- Runs the print operation, by first letting the user modify
			-- print settings in the print dialog, and then print the
			-- document.

			-- Normally that this function does not return until the
			-- rendering of all pages is complete. You can connect to the
			-- ::status-changed signal on op to obtain some information
			-- about the progress of the print operation.

			-- Furthermore, it may use a recursive mainloop to show the
			-- print dialog.
			
			-- If you call `set_allow_async' (which changes the
			-- allow-async property) the operation will run asyncronously
			-- if this is supported on the platform. The ::done signal
			-- will be emitted with the operation results when the
			-- operation is done (i.e. when the dialog is canceled, or
			-- when the print succeeds or fails).

			--   parent :  Transient parent of the dialog, or NULL
			--   error :   Return location for errors, or NULL

			-- `status' will be the result of the print operation. A
			-- return value of `gtk_print_operation_result_apply'
			-- indicates that the printing was completed successfully. In
			-- this case, it is a good idea to store the used print
			-- settings (the `settings' feature) reuse with the next
			-- print operation. A value of
			-- `gtk_print_operation_result_in_progress' means the
			-- operation is running asynchronously, and will emit the
			-- ::done signal when done.

			-- TODO: Eiffellize the following example:
		
			-- if (settings != NULL)
			--   gtk_print_operation_set_print_settings (print, settings);
			--
			-- if (page_setup != NULL)
			--   gtk_print_operation_set_default_page_setup (print, page_setup);
			--
			-- g_signal_connect (print, "begin-print",
			--                   G_CALLBACK (begin_print), &data);
			-- g_signal_connect (print, "draw-page",
			--                   G_CALLBACK (draw_page), &data);
			--
			-- res = gtk_print_operation_run (print, GTK_PRINT_OPERATION_ACTION_PRINT_DIALOG, parent, &error);
			--
			-- if (res == GTK_PRINT_OPERATION_RESULT_ERROR)
			--  {
			--    error_dialog = gtk_message_dialog_new (GTK_WINDOW (parent),
			--                                              GTK_DIALOG_DESTROY_WITH_PARENT,
			--                                              GTK_MESSAGE_ERROR,
			--                                              GTK_BUTTONS_CLOSE,
			--                                              "Error printing file:\ns",
			--                                              error->message);
			--    g_signal_connect (error_dialog, "response",
			--                      G_CALLBACK (gtk_widget_destroy), NULL);
			--    gtk_widget_show (error_dialog);
			--    g_error_free (error);
			--  }
			-- else if (res == GTK_PRINT_OPERATION_RESULT_APPLY)
			--  {
			--    if (settings != NULL)
			-- g_object_unref (settings);
			--    settings = g_object_ref (gtk_print_operation_get_print_settings (print));
			--  }
			--
		do
			operation_result:=gtk_print_operation_run(handle, an_action,
												  null_or(a_parent),
												  address_of(gtk.error.handle))
		ensure valid_result: is_valid_gtk_print_operation_result (operation_result)
		end

	cancel
			-- Cancels a running print operation. This feature may be
			-- called from a begin-print, paginate or draw-page signal
			-- handler to stop the currently running print operation.
		do
			gtk_print_operation_cancel(handle)
		end

	status: INTEGER
			-- the status of the print operation. Also see
			-- `status_string'.
		do
			Result:=gtk_print_operation_get_status(handle)
		ensure valid: is_valid_gtk_print_status(Result)
		end
	
	status_string: CONST_STRING
			-- a string representation of the status of the print
			-- operation. The string is translated and suitable for
			-- displaying the print status e.g. in a GtkStatusbar.
		
			-- Use `status' to obtain a status value that is suitable for
			-- programmatic use.
		do
			create Result.from_external(gtk_print_operation_get_status_string(handle))
		end

	is_finished: BOOLEAN
			-- Is the print operation finished?
		
			-- This is a convenience feature to find out if the print
			-- operation is finished, either successfully
			-- (`gtk_print_status_finished') or unsuccessfully
			-- (`gtk_print_status_finished_aborted').
		
			-- Note: when you enable print status tracking the print
			-- operation can be in a non-finished state even after done
			-- has been called, as the operation status then tracks the
			-- print job status on the printer.
		do
			Result:=gtk_print_operation_is_finished(handle).to_boolean
		end

	error: G_ERROR
			-- Detailed error description of what went wrong, useful when
			-- the result of a print operation is
			-- `gtk_print_operation_result_error', either as returned by
			-- `run', or in the ::done signal handler.
		do
			create Result.empty
			gtk_print_operation_get_error(handle, address_of(error.handle))
		end

	-- TODO: GtkPageSetup* gtk_print_run_page_setup_dialog
	--                                             (GtkWindow *parent,
	--                                              GtkPageSetup *page_setup,
	--                                              GtkPrintSettings *settings);
	--
	--   Runs a page setup dialog, letting the user modify the values from
	--   page_setup. If the user cancels the dialog, the returned GtkPageSetup is
	--   identical to the passed in page_setup, otherwise it contains the
	--   modifications done in the dialog.
	--
	--   Note that this function may use a recursive mainloop to show the page
	--   setup dialog. See gtk_print_run_page_setup_dialog_async() if this is a
	--   problem.
	--
	--   parent :     transient parent, or NULL
	--   page_setup : an existing GtkPageSetup, or NULL
	--   settings :   a GtkPrintSettings
	--   Returns :    a new GtkPageSetup
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkPageSetupDoneFunc ()
	--
	-- void        (*GtkPageSetupDoneFunc)         (GtkPageSetup *page_setup,
	--                                              gpointer data);
	--
	--   The type of function that is passed to
	--   gtk_print_run_page_setup_dialog_async(). This function will be called when
	--   the page setup dialog is dismissed, and also serves as destroy notify for
	--   data.
	--
	--   page_setup : the GtkPageSetup that has been
	--   data :       user data that has been passed to
	--                gtk_print_run_page_setup_dialog_async().
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_print_run_page_setup_dialog_async ()
	--
	-- void        gtk_print_run_page_setup_dialog_async
	--                                             (GtkWindow *parent,
	--                                              GtkPageSetup *page_setup,
	--                                              GtkPrintSettings *settings,
	--                                              GtkPageSetupDoneFunc done_cb,
	--                                              gpointer data);
	--
	--   Runs a page setup dialog, letting the user modify the values from
	--   page_setup.
	--
	--   In contrast to gtk_print_run_page_setup_dialog(), this function returns
	--   after showing the page setup dialog on platforms that support this, and
	--   calls done_cb from a signal handler for the ::response signal of the
	--   dialog.
	--
	--   parent :     transient parent, or NULL
	--   page_setup : an existing GtkPageSetup, or NULL
	--   settings :   a GtkPrintSettings
	--   done_cb :    a function to call when the user saves the modified page
	--                setup
	--   data :       user data to pass to done_cb
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--
feature {ANY} -- Property Details
--Properties
	--
	--
	--   "allow-async"          gboolean              : Read / Write
	--   "current-page"         gint                  : Read / Write
	--   "custom-tab-label"     gchararray            : Read / Write
	--   "default-page-setup"   GtkPageSetup          : Read / Write
	--   "export-filename"      gchararray            : Read / Write
	--   "job-name"             gchararray            : Read / Write
	--   "n-pages"              gint                  : Read / Write
	--   "print-settings"       GtkPrintSettings      : Read / Write
	--   "show-progress"        gboolean              : Read / Write
	--   "status"               GtkPrintStatus        : Read
	--   "status-string"        gchararray            : Read
	--   "track-print-status"   gboolean              : Read / Write
	--   "unit"                 GtkUnit               : Read / Write
	--   "use-full-page"        gboolean              : Read / Write
	--

	async_allowed: BOOLEAN
			-- May the print operation run asynchronously?

			-- Wraps the "allow-async" property

			--  "allow-async" gboolean : Read / Write

			-- Some systems don't support asynchronous printing, but
			-- those that do will return
			-- `gtk_print_operation_result_in_progress' as the status,
			-- and emit the done signal when the operation is actually
			-- done.

			-- The Windows port does not support asynchronous operation
			-- at all (this is unlikely to change). On other platforms,
			-- all actions except for GTK_PRINT_OPERATION_ACTION_EXPORT
			-- support asynchronous operation.

			--   Default value: FALSE
		do
			Result:=boolean_property_from_pspec(allow_async_property_spec)
		end
		
	--
	--  The "current-page" property
	--
	--   "current-page"         gint                  : Read / Write
	--
	--   The current page in the document.
	--
	--   If this is set before gtk_print_operation_run(), the user will be able to
	--   select to print only the current page.
	--
	--   Note that this only makes sense for pre-paginated documents.
	--
	--   Allowed values: >= -1
	--
	--   Default value: -1
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "custom-tab-label" property
	--
	--   "custom-tab-label"     gchararray            : Read / Write
	--
	--   Used as the label of the tab containing custom widgets. Note that this
	--   property may be ignored on some platforms.
	--
	--   If this is NULL, GTK+ uses a default label.
	--
	--   Default value: NULL
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "default-page-setup" property
	--
	--   "default-page-setup"   GtkPageSetup          : Read / Write
	--
	--   The GtkPageSetup used by default.
	--
	--   This page setup will be used by gtk_print_operation_run(), but it can be
	--   overridden on a per-page basis by connecting to the ::request-page-setup
	--   signal.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "export-filename" property
	--
	--   "export-filename"      gchararray            : Read / Write
	--
	--   The name of a file file to generate instead of showing the print dialog.
	--   Currently, PDF is the only supported format.
	--
	--   The intended use of this property is for implementing "Export to PDF"
	--   actions.
	--
	--   "Print to PDF" support is independent of this and is done by letting the
	--   user pick the "Print to PDF" item from the list of printers in the print
	--   dialog.
	--
	--   Default value: NULL
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "job-name" property
	--
	--   "job-name"             gchararray            : Read / Write
	--
	--   A string used to identify the job (e.g. in monitoring applications like
	--   eggcups).
	--
	--   If you don't set a job name, GTK+ picks a default one by numbering
	--   successive print jobs.
	--
	--   Default value: ""
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "n-pages" property
	--
	--   "n-pages"              gint                  : Read / Write
	--
	--   The number of pages in the document.
	--
	--   This must be set to a positive number before the rendering starts. It may
	--   be set in a ::begin-print signal hander.
	--
	--   Note that the page numbers passed to the ::request-page-setup and
	--   ::draw-page signals are 0-based, i.e. if the user chooses to print all
	--   pages, the last ::draw-page signal will be for page n_pages - 1.
	--
	--   Allowed values: >= -1
	--
	--   Default value: -1
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "print-settings" property
	--
	--   "print-settings"       GtkPrintSettings      : Read / Write
	--
	--   The GtkPrintSettings used for initializing the dialog.
	--
	--   Setting this property is typically used to re-establish print settings
	--   from a previous print operation, see gtk_print_operation_run().
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "show-progress" property
	--
	--   "show-progress"        gboolean              : Read / Write
	--
	--   Determines whether to show a progress dialog during the print operation.
	--
	--   Default value: FALSE
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "status" property
	--
	--   "status"               GtkPrintStatus        : Read
	--
	--   The status of the print operation.
	--
	--   Default value: GTK_PRINT_STATUS_INITIAL
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "status-string" property
	--
	--   "status-string"        gchararray            : Read
	--
	--   A string representation of the status of the print operation. The string
	--   is translated and suitable for displaying the print status e.g. in a
	--   GtkStatusbar.
	--
	--   See the ::status property for a status value that is suitable for
	--   programmatic use.
	--
	--   Default value: ""
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "track-print-status" property
	--
	--   "track-print-status"   gboolean              : Read / Write
	--
	--   If TRUE, the print operation will try to continue report on the status of
	--   the print job in the printer queues and printer. This can allow your
	--   application to show things like "out of paper" issues, and when the print
	--   job actually reaches the printer. However, this is often implemented using
	--   polling, and should not be enabled unless needed.
	--
	--   Default value: FALSE
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "unit" property
	--
	--   "unit"                 GtkUnit               : Read / Write
	--
	--   The transformation for the cairo context obtained from GtkPrintContext is
	--   set up in such a way that distances are measured in units of unit.
	--
	--   Default value: GTK_UNIT_PIXEL
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "use-full-page" property
	--
	--   "use-full-page"        gboolean              : Read / Write
	--
	--   If TRUE, the transformation for the cairo context obtained from
	--   GtkPrintContext puts the origin at the top left corner of the page (which
	--   may not be the top left corner of the sheet, depending on page orientation
	--   and the number of pages per sheet). Otherwise, the origin is at the top
	--   left corner of the imageable area (i.e. inside the margins).
	--
	--   Default value: FALSE
	--
	--   Since 2.10
	--
feature {ANY} -- TODO: Signal Details
		--Signals
	--
	--
	-- "begin-print"
	--             void        user_function      (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gpointer           user_data)      : Run last
	-- "create-custom-widget"
	--             GObject*    user_function      (GtkPrintOperation *operation,
	--                                             gpointer           user_data)      : Run last
	-- "custom-widget-apply"
	--             void        user_function      (GtkPrintOperation *operation,
	--                                             GtkWidget         *widget,
	--                                             gpointer           user_data)      : Run last
	-- "done"      void        user_function      (GtkPrintOperation      *operation,
	--                                             GtkPrintOperationResult result,
	--                                             gpointer                user_data)      : Run last
	-- "draw-page" void        user_function      (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gint               page_nr,
	--                                             gpointer           user_data)      : Run last
	-- "end-print" void        user_function      (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gpointer           user_data)      : Run last
	-- "paginate"  gboolean    user_function      (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gpointer           user_data)      : Run last
	-- "preview"   gboolean    user_function      (GtkPrintOperation        *operation,
	--                                             GtkPrintOperationPreview *preview,
	--                                             GtkPrintContext          *context,
	--                                             GtkWindow                *parent,
	--                                             gpointer                  user_data)      : Run last
	-- "request-page-setup"
	--             void        user_function      (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gint               page_nr,
	--                                             GtkPageSetup      *setup,
	--                                             gpointer           user_data)      : Run last
	-- "status-changed"
	--             void        user_function      (GtkPrintOperation *operation,
	--                                             gpointer           user_data)      : Run last
	--
	--
	--  The "begin-print" signal
	--
	-- void        user_function                  (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted after the user has finished changing print settings in the dialog,
	--   before the actual rendering starts.
	--
	--   A typical use for this signal is to use the parameters from the
	--   GtkPrintContext and paginate the document accordingly, and then set the
	--   number of pages with gtk_print_operation_set_n_pages().
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   context :   the GtkPrintContext for the current operation
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "create-custom-widget" signal
	--
	-- GObject*    user_function                  (GtkPrintOperation *operation,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted when displaying the print dialog. If you return a widget in a
	--   handler for this signal it will be added to a custom tab in the print
	--   dialog. You typically return a container widget with multiple widgets in
	--   it.
	--
	--   The print dialog owns the returned widget, and its lifetime isn't
	--   controlled by the app. However, the widget is guaranteed to stay around
	--   until the custom-widget-apply signal is emitted on the operation. Then you
	--   can read out any information you need from the widgets.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   user_data : user data set when the signal handler was connected.
	--   Returns :   A custom widget that gets embedded in the print dialog, or
	--               NULL
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "custom-widget-apply" signal
	--
	-- void        user_function                  (GtkPrintOperation *operation,
	--                                             GtkWidget         *widget,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted right before begin-print if you added a custom widget in the
	--   create-custom-widget handler. When you get this signal you should read the
	--   information from the custom widgets, as the widgets are not guaraneed to
	--   be around at a later time.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   widget :    the custom widget added in create-custom-widget
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "done" signal
	--
	-- void        user_function                  (GtkPrintOperation      *operation,
	--                                             GtkPrintOperationResult result,
	--                                             gpointer                user_data)      : Run last
	--
	--   Emitted when the print operation run has finished doing everything
	--   required for printing. result gives you information about what happened
	--   during the run. If result is GTK_PRINT_OPERATION_RESULT_ERROR then you can
	--   call gtk_print_operation_get_error() for more information.
	--
	--   If you enabled print status tracking then
	--   gtk_print_operation_is_finished() may still return FALSE after this was
	--   emitted.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   result :    the result of the print operation
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "draw-page" signal
	--
	-- void        user_function                  (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gint               page_nr,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted for every page that is printed. The signal handler must render the
	--   page_nr's page onto the cairo context obtained from context using
	--   gtk_print_context_get_cairo_context().
	--
	-- static void
	-- draw_page (GtkPrintOperation *operation,
	--            GtkPrintContext   *context,
	--            gint               page_nr,
	--            gpointer           user_data)
	-- {
	--   cairo_t *cr;
	--   PangoLayout *layout;
	--   gdouble width, text_height;
	--   gint layout_height;
	--   PangoFontDescription *desc;
	--
	--   cr = gtk_print_context_get_cairo_context (context);
	--   width = gtk_print_context_get_width (context);
	--
	--   cairo_rectangle (cr, 0, 0, width, HEADER_HEIGHT);
	--
	--   cairo_set_source_rgb (cr, 0.8, 0.8, 0.8);
	--   cairo_fill (cr);
	--
	--   layout = gtk_print_context_create_pango_layout (context);
	--
	--   desc = pango_font_description_from_string ("sans 14");
	--   pango_layout_set_font_description (layout, desc);
	--   pango_font_description_free (desc);
	--
	--   pango_layout_set_text (layout, "some text", -1);
	--   pango_layout_set_width (layout, width);
	--   pango_layout_set_alignment (layout, PANGO_ALIGN_CENTER);
	--
	--   pango_layout_get_size (layout, NULL, &layout_height);
	--   text_height = (gdouble)layout_height / PANGO_SCALE;
	--
	--   cairo_move_to (cr, width / 2,  (HEADER_HEIGHT - text_height) / 2);
	--   pango_cairo_show_layout (cr, layout);
	--
	--   g_object_unref (layout);
	-- }
	--
	--   Use gtk_print_operation_set_use_full_page() and
	--   gtk_print_operation_set_unit() before starting the print operation to set
	--   up the transformation of the cairo context according to your needs.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   context :   the GtkPrintContext for the current operation
	--   page_nr :   the number of the currently printed page
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "end-print" signal
	--
	-- void        user_function                  (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted after all pages have been rendered. A handler for this signal can
	--   clean up any resources that have been allocated in the ::begin-print
	--   handler.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   context :   the GtkPrintContext for the current operation
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "paginate" signal
	--
	-- gboolean    user_function                  (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted after the begin-print signal, but before the actual rendering
	--   starts. It keeps getting emitted until it returns FALSE.
	--
	--   This signal is intended to be used for paginating the document in small
	--   chunks, to avoid blocking the user interface for a long time. The signal
	--   handler should update the number of pages using
	--   gtk_print_operation_set_n_pages(), and return TRUE if the document has
	--   been completely paginated.
	--
	--   If you don't need to do pagination in chunks, you can simply do it all in
	--   the begin-print handler, and set the number of pages from there.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   context :   the GtkPrintContext for the current operation
	--   user_data : user data set when the signal handler was connected.
	--   Returns :   TRUE if pagination is complete
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "preview" signal
	--
	-- gboolean    user_function                  (GtkPrintOperation        *operation,
	--                                             GtkPrintOperationPreview *preview,
	--                                             GtkPrintContext          *context,
	--                                             GtkWindow                *parent,
	--                                             gpointer                  user_data)      : Run last
	--
	--   Gets emitted when a preview is requested from the native dialog.
	--
	--   The default handler for this signal uses an external viewer application to
	--   preview.
	--
	--   To implement a custom print preview, an application must return TRUE from
	--   its handler for this signal. In order to use the provided context for the
	--   preview implementation, it must be given a suitable cairo context with
	--   gtk_print_context_set_cairo_context().
	--
	--   The custom preview implementation can use
	--   gtk_print_operation_preview_is_selected() and
	--   gtk_print_operation_preview_render_page() to find pages which are selected
	--   for print and render them. The preview must be finished by calling
	--   gtk_print_operation_preview_end_preview() (typically in response to the
	--   user clicking a close button).
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   preview :   the GtkPrintPreviewOperation for the current operation
	--   context :   the GtkPrintContext that will be used
	--   parent :    the GtkWindow to use as window parent, or NULL
	--   user_data : user data set when the signal handler was connected.
	--   Returns :   TRUE if the listener wants to take over control of the preview
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "request-page-setup" signal
	--
	-- void        user_function                  (GtkPrintOperation *operation,
	--                                             GtkPrintContext   *context,
	--                                             gint               page_nr,
	--                                             GtkPageSetup      *setup,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted once for every page that is printed, to give the application a
	--   chance to modify the page setup. Any changes done to setup will be in
	--   force only for printing this page.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   context :   the GtkPrintContext for the current operation
	--   page_nr :   the number of the currently printed page
	--   setup :     the GtkPageSetup
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
	--
	--   --------------------------------------------------------------------------
	--
	--  The "status-changed" signal
	--
	-- void        user_function                  (GtkPrintOperation *operation,
	--                                             gpointer           user_data)      : Run last
	--
	--   Emitted at between the various phases of the print operation. See
	--   GtkPrintStatus for the phases that are being discriminated. Use
	--   gtk_print_operation_get_status() to find out the current status.
	--
	--   operation : the GtkPrintOperation on which the signal was emitted
	--   user_data : user data set when the signal handler was connected.
	--
feature {} -- Unwrapped code

	-- #define GTK_PRINT_ERROR gtk_print_error_quark ()
	--
	--   The GQuark used for GtkPrintError errors.

feature {} -- Hastened property spec
	allow_async_property_spec: G_PARAM_SPEC
		once
			Result := find_property (allow_async_property_name)
		end

	allow_async_property_name: STRING is "allow-async"
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPrintOperation)"
		end

end -- class GTK_PRINT_OPERATION
