note
	description: "Enum GtkMessageType -- The type of message being displayed in the dialog."
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

deferred class GTK_MESSAGE_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_message_type (a_gtk_message_type :INTEGER): BOOLEAN
		do
			Result:=((a_gtk_message_type = gtk_message_info) or else
						(a_gtk_message_type = gtk_message_warning) or else
						(a_gtk_message_type = gtk_message_question) or else
						(a_gtk_message_type = gtk_message_error))
		end

	gtk_message_info: INTEGER
			-- 	Informational message 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_INFO"
		end

	gtk_message_warning: INTEGER
			-- 	Nonfatal warning message 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_WARNING"
		end

	gtk_message_question: INTEGER
			-- 	Question requiring a choice 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_QUESTION"
		end

	gtk_message_error: INTEGER
			-- 	Fatal error message 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_MESSAGE_ERROR"
		end

end
