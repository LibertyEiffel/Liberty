note
	description: "GtkPrinter represents a printer."
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

class GTK_PRINTER
	-- A GtkPrinter object represents a printer. You only need to deal
	-- directly with printers if you use the non-portable
	-- GtkPrintUnixDialog API.
	
	-- A GtkPrinter allows to get status information about the printer,
	-- such as its description, its location, the number of queued
	-- jobs, etc. Most importantly, a GtkPrinter object can be used to
	-- create a GtkPrintJob object, which lets you print to the
	-- printer.
	
	--   Printing support was added in GTK+ 2.10.

inherit 
	G_OBJECT rename is_default as is_void redefine is_equal end
	COMPARABLE
		rename
			is_default as is_void
		undefine
			copy, is_equal
		redefine
			is_equal,
			compare, three_way_comparison
		end

insert
	GTK_PRINTER_EXTERNALS
		rename is_default as is_void end

create {ANY} dummy, make, from_external_pointer

feature {} -- Creation
	make (a_name: STRING; a_backend: GTK_PRINT_BACKEND; virtual: BOOLEAN)
			-- Creates a new GtkPrinter with `a_name', connected to
			-- `a_backend'. `virtual' tells whether the printer is
			-- virtual.
		require 
			name_not_void: a_name/=Void
			backend_not_void: a_backend /= Void
		do
			from_external_pointer (gtk_printer_new(a_name.to_external,
																a_backend.handle,
																virtual.to_integer))
		end

feature {ANY} -- Queries
	backend: GTK_PRINT_BACKEND
			-- The backend of the printer.
		do
			create Result.from_external_pointer(gtk_printer_get_backend(handle))
		ensure not_void: Result/=Void
		end

	name: CONST_STRING
			-- the name of the printer.
		do
			create Result.from_external(gtk_printer_get_name(handle))
		ensure not_void: Result/=Void
		end

	state_message: CONST_STRING
			-- the state message of printer
		do
			create Result.from_external(gtk_printer_get_state_message(handle))
		ensure not_void: Result/=Void
		end

	description: CONST_STRING
			-- the description of printer
		do
			create Result.from_external(gtk_printer_get_description(handle))
		ensure not_void: Result/=Void
		end

	location: CONST_STRING
			-- The location of the printer.
		do
			create Result.from_external(gtk_printer_get_location(handle))
		end

	icon_name: CONST_STRING
			-- the icon name for printer
		do
			create Result.from_external(gtk_printer_get_icon_name(handle))
		end

	job_count: INTEGER
			-- the number of jobs currently queued on the printer.
		do
			Result:=gtk_printer_get_job_count(handle)
		end
	
	is_active: BOOLEAN
			-- Is the printer currently active? A printer is active when
			-- it accepts new jobs.
		do
			Result:=gtk_printer_is_active(handle).to_boolean
		end

	is_virtual: BOOLEAN
			-- Is the printer virtual? A virtual printer does not
			-- represent actual printer hardware, but something like a
			-- CUPS class.
		do
			Result:=gtk_printer_is_virtual(handle).to_boolean
		end

	is_default: BOOLEAN
			-- Is the printer the default printer?
		do
			Result:=gtk_printer_is_default(handle).to_boolean
		end

	accepts_postscript: BOOLEAN
			-- Does the printer accept input in PostScript format?
		do
			Result:=gtk_printer_accepts_ps(handle).to_boolean
		end

	accepts_pdf: BOOLEAN
			-- Does the printer accept input in PDF format?
		do
			Result:=gtk_printer_accepts_pdf(handle).to_boolean
		end

feature {ANY} -- Comparability
	is_equal (other: like Current): BOOLEAN
		do
			Result:=(compare(other)=0)
		end

	infix "<" (other: like Current): BOOLEAN
		do		
			Result:=(compare(other)<0)
		end

	compare, three_way_comparison (other: like Current): INTEGER
			--   Compares two printers: 0 if the printer match, a
			--   negative value if Current < `other,' or a positive
			--   value if Current > `other'
		do
			Result:=gtk_printer_compare(handle, other.handle)
		end
	
feature {ANY} -- TODO unwrapped 

	-- TODO: wrap gtk_enumerate_printers 

	-- void gtk_enumerate_printers (GtkPrinterFunc func, gpointer data,
	-- GDestroyNotify destroy, gboolean wait);

	--   Calls a function for all GtkPrinters. If func returns TRUE, the
	--   enumeration is stopped.
	--
	--   func :    a function to call for each printer
	--   data :    user data to pass to func
	--   destroy : function to call if data is no longer needed
	--   wait :    if TRUE, wait in a recursive mainloop until all printers are
	--             enumerated; otherwise return early
	--
	--   Since 2.10
	--

	--  GtkPrinterFunc ()
	--
	-- gboolean    (*GtkPrinterFunc)               (GtkPrinter *printer,
	--                                              gpointer data);
	--
	--   The type of function passed to gtk_enumerate_printers(). Note that you
	--   need to ref printer, if you want to keep a reference to it after the
	--   function has returned.
	--
	--   printer : a GtkPrinter
	--   data :    user data passed to gtk_enumerate_printers()
	--   Returns : TRUE to stop the enumeration, FALSE to continue
	--
	--   --------------------------------------------------------------------------
	--

feature {ANY} -- TODO: Properties
	--
	--
	--   "accepts-pdf"          gboolean              : Read / Write / Construct Only
	--   "accepts-ps"           gboolean              : Read / Write / Construct Only
	--   "backend"              GtkPrintBackend       : Read / Write / Construct Only
	--   "icon-name"            gchararray            : Read
	--   "is-virtual"           gboolean              : Read / Write / Construct Only
	--   "job-count"            gint                  : Read
	--   "location"             gchararray            : Read
	--   "name"                 gchararray            : Read / Write / Construct Only
	--   "state-message"        gchararray            : Read
	--
	--Property Details
	--
	--  The "accepts-pdf" property
	--
	--   "accepts-pdf"          gboolean              : Read / Write / Construct Only
	--
	--   TRUE if this printer can accept PDF.
	--
	--   Default value: TRUE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "accepts-ps" property
	--
	--   "accepts-ps"           gboolean              : Read / Write / Construct Only
	--
	--   TRUE if this printer can accept PostScript.
	--
	--   Default value: TRUE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "backend" property
	--
	--   "backend"              GtkPrintBackend       : Read / Write / Construct Only
	--
	--   Backend for the printer.
	--
	--   --------------------------------------------------------------------------
	--
	--  The "icon-name" property
	--
	--   "icon-name"            gchararray            : Read
	--
	--   The icon name to use for the printer.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "is-virtual" property
	--
	--   "is-virtual"           gboolean              : Read / Write / Construct Only
	--
	--   FALSE if this represents a real hardware printer.
	--
	--   Default value: FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  The "job-count" property
	--
	--   "job-count"            gint                  : Read
	--
	--   Number of jobs queued in the printer.
	--
	--   Allowed values: >= 0
	--
	--   Default value: 0
	--
	--   --------------------------------------------------------------------------
	--
	--  The "location" property
	--
	--   "location"             gchararray            : Read
	--
	--   The location of the printer.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "name" property
	--
	--   "name"                 gchararray            : Read / Write / Construct Only
	--
	--   Name of the printer.
	--
	--   Default value: NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  The "state-message" property
	--
	--   "state-message"        gchararray            : Read
	--
	--   String giving the current state of the printer.
	--
	--   Default value: NULL
	--

feature {ANY} 	-- TODO: Signals
	--
	--
	-- "details-acquired"
	--             void        user_function      (GtkPrinter *printer,
	--                                             gboolean    success,
	--                                             gpointer    user_data)      : Run last
	--Signal Details
	--
	--  The "details-acquired" signal
	--
	-- void        user_function                  (GtkPrinter *printer,
	--                                             gboolean    success,
	--                                             gpointer    user_data)      : Run last
	--
	--   Gets emitted in response to a request for detailed information about a
	--   printer from the print backend. The success parameter indicates if the
	--   information was actually obtained.
	--
	--   printer :   the GtkPrinter on which the signal is emitted
	--   success :   TRUE if the details were successfully acquired
	--   user_data : user data set when the signal handler was connected.
	--
	--   Since 2.10
feature {ANY}
	dummy_gobject: POINTER
		do
			unimplemented
		end
	
end -- class GTK_PRINTER
