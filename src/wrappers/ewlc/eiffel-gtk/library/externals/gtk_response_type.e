note
	description: "Enum GtkResponseType. Predefined values for use as response ids in GTK_DIALOG add_button. All predefined values are negative, GTK+ leaves positive values for application-defined response ids."
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
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_RESPONSE_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_response_type (a_response :INTEGER): BOOLEAN
		do
			Result:=((a_response = gtk_response_none) or else
						(a_response = gtk_response_reject) or else
						(a_response = gtk_response_accept) or else
						(a_response = gtk_response_delete_event) or else
						(a_response = gtk_response_ok) or else
						(a_response = gtk_response_cancel) or else
						(a_response = gtk_response_close) or else
						(a_response = gtk_response_yes) or else
						(a_response = gtk_response_no) or else
						(a_response = gtk_response_apply) or else
						(a_response = gtk_response_help))
		end

	gtk_response_none: INTEGER
			-- Returned if an action widget has no response id, or if the dialog gets programmatically hidden or destroyed.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_NONE"
		end
	
	gtk_response_reject: INTEGER
			-- Generic response id, not used by GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_REJECT"
		end

	gtk_response_accept: INTEGER
			-- Generic response id, not used by GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_ACCEPT"
		end

	gtk_response_delete_event: INTEGER
			-- Returned if the dialog is deleted.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_DELETE_EVENT"
		end

	gtk_response_ok: INTEGER
			-- 	Returned by OK buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_OK"
		end

	gtk_response_cancel: INTEGER
			-- 	Returned by Cancel buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_CANCEL"
		end

	gtk_response_close: INTEGER
			-- 	Returned by Close buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_CLOSE"
		end

	gtk_response_yes: INTEGER
			-- 	Returned by Yes buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_YES"
		end

	gtk_response_no: INTEGER
			-- 	Returned by No buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_NO"
		end

	gtk_response_apply: INTEGER
			-- 	Returned by Apply buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_APPLY"
		end

	gtk_response_help: INTEGER
			-- 	Returned by Help buttons in GTK+ dialogs.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RESPONSE_HELP"
		end
end

