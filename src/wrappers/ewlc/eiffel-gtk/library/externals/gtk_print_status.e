note
	description: "Enum "
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_PRINT_STATUS
	-- The status gives a rough indication of the completion of a
	-- running print operation.
	
inherit ANY undefine is_equal, copy end

feature {ANY}  -- enum
	is_valid_gtk_print_status (a_status: INTEGER): BOOLEAN
		do	
			Result:=((a_status = gtk_print_status_initial) or else
						(a_status = gtk_print_status_preparing) or else
						(a_status = gtk_print_status_generating_data) or else
						(a_status = gtk_print_status_sending_data) or else
						(a_status = gtk_print_status_pending) or else
						(a_status = gtk_print_status_pending_issue) or else
						(a_status = gtk_print_status_printing) or else
						(a_status = gtk_print_status_finished) or else
						(a_status = gtk_print_status_finished_aborted))
		end
	
	gtk_print_status_initial: INTEGER
			-- The printing has not started yet; this status is set
			-- initially, and while the print dialog is shown.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_INITIAL"
		end
	
	gtk_print_status_preparing: INTEGER
				-- This status is set while the begin-print signal is
				-- emitted and during pagination.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_PREPARING"
		end

	gtk_print_status_generating_data: INTEGER
				-- This status is set while the pages are being rendered.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_GENERATING_DATA"
		end

	gtk_print_status_sending_data: INTEGER
				-- The print job is being sent off to the printer.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_SENDING_DATA"
		end

	gtk_print_status_pending: INTEGER
				-- The print job has been sent to the printer, but is not
				-- printed for some reason, e.g. the printer may be
				-- stopped.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_PENDING"
		end

	gtk_print_status_pending_issue: INTEGER
				-- Some problem has occurred during printing, e.g. a paper
				-- jam.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_PENDING_ISSUE"
		end

	gtk_print_status_printing: INTEGER
				-- The printer is processing the print job.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_PRINTING"
		end

	gtk_print_status_finished: INTEGER
				-- The printing has been completed successfully.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_FINISHED"
		end

	gtk_print_status_finished_aborted: INTEGER
				-- The printing has been aborted.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_PRINT_STATUS_FINISHED_ABORTED"
		end
end
