note
	description: "GtkPrintJob -- Represents a print job."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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

class GTK_PRINT_JOB
	-- A GtkPrintJob object represents a job that is sent to a printer. You only
	-- need to deal directly with print jobs if you use the non-portable
	-- GtkPrintUnixDialog API.

	-- Use `surface' to obtain the cairo surface onto which the
	-- pages must be drawn. Use `send' to send the finished job to
	-- the printer. If you don't use cairo GtkPrintJob also supports printing of
	-- manually generated postscript, via `set_source_file'.

	--   Printing support was added in GTK+ 2.10.

inherit G_OBJECT

insert
	GTK
	GTK_PRINT_STATUS
	
create {ANY} dummy, make, from_external_pointer

feature {} -- Creation 
	make (a_title: STRING; a_printer: GTK_PRINTER; some_settings: GTK_PRINT_SETTINGS; a_page_setup: GTK_PAGE_SETUP)
			--   Creates a new GtkPrintJob.
		require
			title_not_void: a_title /= Void
			printer_not_void: a_printer /= Void
			settings_not_void: some_settings /= Void
			page_setup_not_void: a_page_setup /= Void
		do
			from_external_pointer(gtk_print_job_new(a_title.to_external,  a_printer.handle,
																 some_settings.handle, a_page_setup.handle))
		end
	
feature {ANY}
	settings: GTK_PRINT_SETTINGS
			-- the GtkPrintSettings of the print job.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_PRINT_SETTINGS]
		do
			Result := factory.wrapper(gtk_print_job_get_settings(handle))
		ensure not_void: Result/=Void
		end

	printer: GTK_PRINTER
			-- the GtkPrinter of the print job.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_PRINTER]
		do
			Result := factory.wrapper(gtk_print_job_get_printer(handle))
		ensure not_void: Result/=Void
		end
			
	title: CONST_STRING
			-- the job title.
		do
			create Result.from_external (gtk_print_job_get_title(handle))
		ensure not_void: Result /= Void
		end

	status: INTEGER
			-- the status of the print job.
		do
			Result:=gtk_print_job_get_status(handle)
		ensure valid: is_valid_gtk_print_status(Result)
		end

	is_successful: BOOLEAN
			-- Have the last call of `set_source_file' been successful?

	set_source_file (a_filename: STRING)
			-- Send an existing document to the printing system. The file
			-- can be in any format understood by the platforms printing
			-- system (typically PostScript, but on many platforms PDF
			-- may work too). See GTK_PRINTER's `accepts_pdf' and
			-- `accepts_postscript'.

			--   error :    return location for errors
		
			-- `is_successful' will contain the Result of the command. 
			-- If False `gtk.error' will be updated
		require name_not_void: a_filename /= Void
		do
			is_successful:=(gtk_print_job_set_source_file
								 (handle, a_filename.to_external,
								  address_of(gtk.error.handle))).to_boolean
		end

	
	-- TODO: surface: CAIRO_SURFACE is
	--
	-- cairo_surface_t* gtk_print_job_get_surface  (GtkPrintJob *job,
	--                                              GError **error);
	--
	--   Gets a cairo surface onto which the pages of the print job should be
	--   rendered.
	--
	--   job :     a GtkPrintJob
	--   error :   return location for errors, or NULL
	--   Returns : the cairo surface of job
	--
	--   Since 2.10
	--

	--  gtk_print_job_send ()
	--
	-- void        gtk_print_job_send              (GtkPrintJob *job,
	--                                              GtkPrintJobCompleteFunc callback,
	--                                              gpointer user_data,
	--                                              GDestroyNotify dnotify);
	--
	--   Sends the print job off to the printer.
	--
	--   job :       a GtkPrintJob
	--   callback :  function to call when the job completes or an error occurs
	--   user_data : user data that gets passed to callback
	--   dnotify :   destroy notify for user_data
	--
	--   Since 2.10
	--

	set_track_print_status (a_track_status: BOOLEAN)
			-- If `a_track_status' is True, the print job will try to
			-- continue report on the status of the print job in the
			-- printer queues and printer. This can allow your
			-- application to show things like "out of paper" issues, and
			-- when the print job actually reaches the printer.
		
			-- This function is often implemented using some form of
			-- polling, so it should not be enabled unless needed.
		do
			gtk_print_job_set_track_print_status(handle,a_track_status.to_integer)
		end

	tracked_after_printing: BOOLEAN
			--  Will jobs be tracked after printing? For details, see
			--   `set_track_print_status'.
		do
			Result:=gtk_print_job_get_track_print_status(handle).to_boolean
		end
	
feature {ANY} -- TODO: Properties
	--
	--
	--   "page-setup"           GtkPageSetup          : Read / Write / Construct Only
	--   "printer"              GtkPrinter            : Read / Write / Construct Only
	--   "settings"             GtkPrintSettings      : Read / Write / Construct Only
	--   "title"                gchararray            : Read / Write / Construct Only
	--   "track-print-status"   gboolean              : Read / Write
	--Property Details
	--
	--  The "page-setup" property
	--
	--   "page-setup"           GtkPageSetup          : Read / Write / Construct Only
	--
	--   Page Setup.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "printer" property
	--
	--   "printer"              GtkPrinter            : Read / Write / Construct Only
	--
	--   Printer to print the job to.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "settings" property
	--
	--   "settings"             GtkPrintSettings      : Read / Write / Construct Only
	--
	--   Printer settings.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "title" property
	--
	--   "title"                gchararray            : Read / Write / Construct Only
	--
	--   Title of the print job.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "track-print-status" property
	--
	--   "track-print-status"   gboolean              : Read / Write
	--
	--   TRUE if the print job will continue to emit status-changed signals after
	--   the print data has been sent to the printer or print server.
	--
	--   Default value: FALSE
	--

feature {ANY} -- TODO: Signals
	-- "status-changed"
	--             void        user_function      (GtkPrintJob *job,
	--                                             gpointer     user_data)      : Run last
	--Signal Details
	--
	--  The "status-changed" signal
	--
	-- void        user_function                  (GtkPrintJob *job,
	--                                             gpointer     user_data)      : Run last
	--
	--   Gets emitted when the status of a job changes. The signal handler can use
	--   gtk_print_job_get_status() to obtain the new status.
	--
	--   job :       the GtkPrintJob object on which the signal was emitted
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
feature {} -- Unwrapped
	--  GtkPrintJobCompleteFunc ()
	--
	-- void        (*GtkPrintJobCompleteFunc)      (GtkPrintJob *print_job,
	--                                              gpointer user_data,
	--                                              GError *error);
	--
	--   The type of callback that is passed to gtk_print_job_send(). It is called
	--   when the print job has been completely sent.
	--
	--   print_job : the GtkPrintJob
	--   user_data : user data that has been passed to gtk_print_job_send()
	--   error :     a GError that contains error information if the sending of the
	--               print job failed, otherwise NULL

feature {} -- External calls
	-- void (*GtkPrintJobCompleteFunc) (GtkPrintJob *print_job, gpointer
	-- user_data, GError *error);
	
	gtk_print_job_new (a_title, a_printer, a_settings, a_page_setup: POINTER): POINTER
			-- GtkPrintJob* gtk_print_job_new (const gchar *title, GtkPrinter
			-- *printer, GtkPrintSettings *settings, GtkPageSetup *page_setup);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_get_settings (a_job: POINTER): POINTER
			-- GtkPrintSettings* gtk_print_job_get_settings (GtkPrintJob *job);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_get_printer (a_job: POINTER): POINTER
			-- GtkPrinter* gtk_print_job_get_printer (GtkPrintJob *job);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_get_title (a_job: POINTER): POINTER
			-- const gchar* gtk_print_job_get_title (GtkPrintJob *job);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_get_status (a_job: POINTER): INTEGER
			-- 	GtkPrintStatus gtk_print_job_get_status (GtkPrintJob *job);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_set_source_file (a_job, a_filename, an_error_handle: POINTER): INTEGER
			-- gboolean gtk_print_job_set_source_file (GtkPrintJob *job, const
			-- gchar *filename, GError **error);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_print_job_get_surface (a_job, an_error_handle: POINTER): POINTER
			-- cairo_surface_t* gtk_print_job_get_surface (GtkPrintJob *job, GError
			-- **error);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_send (a_job, a_callback, some_user_data, a_destroy_notify: POINTER)
			-- void gtk_print_job_send (GtkPrintJob *job, GtkPrintJobCompleteFunc
			-- callback, gpointer user_data, GDestroyNotify dnotify);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_set_track_print_status (a_job: POINTER; a_track_status: INTEGER)
			-- void gtk_print_job_set_track_print_status (GtkPrintJob *job,
			-- gboolean track_status);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_job_get_track_print_status (a_job: POINTER): INTEGER
			-- 	gboolean gtk_print_job_get_track_print_status (GtkPrintJob *job);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPrintJob)"
		end

	dummy_gobject: POINTER
		do
			unimplemented
		end
	
end -- class GTK_PRINT_JOB
