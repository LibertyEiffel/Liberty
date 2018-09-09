note
	description: "enum GtkFileChooserAction -- Used as a return value of handlers for the confirm-overwrite signal of a GtkFileChooser. This value determines whether the file chooser will present the stock confirmation dialog, accept the user's choice of a filename, or let the user choose another filename."
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

deferred class GTK_FILE_CHOOSER_CONFIRMATION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_file_chooser_confirmation (a_gtk_file_chooser_confirmation: INTEGER): BOOLEAN
		do
			Result:=((a_gtk_file_chooser_confirmation=gtk_file_chooser_confirmation_confirm) or else
						(a_gtk_file_chooser_confirmation=gtk_file_chooser_confirmation_accept_filename) or else
						(a_gtk_file_chooser_confirmation=gtk_file_chooser_confirmation_select_again))
		end

	gtk_file_chooser_confirmation_confirm: INTEGER
			-- 	The file chooser will present its stock dialog to confirm about overwriting an existing file.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_CONFIRMATION_CONFIRM"
		end
	
	gtk_file_chooser_confirmation_accept_filename: INTEGER
			-- 	The file chooser will terminate and accept the user's choice of a file name.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_CONFIRMATION_ACCEPT_FILENAME"
		end

	gtk_file_chooser_confirmation_select_again: INTEGER
			-- 	The file chooser will continue running, so as to let the user select another file name.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_CONFIRMATION_SELECT_AGAIN"
		end
end
