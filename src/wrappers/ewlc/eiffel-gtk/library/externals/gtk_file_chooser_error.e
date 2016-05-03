note
	description: "Enum GtkFileChooserError -- These identify the various errors that can occur while calling GtkFileChooser functions."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GTK_FILE_CHOOSER_ERROR

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_file_chooser_error (a_gtk_file_chooser_error :INTEGER): BOOLEAN is
		do
			Result:=((a_gtk_file_chooser_error=gtk_file_chooser_error_nonexistent) or else
						(a_gtk_file_chooser_error=gtk_file_chooser_error_bad_filename))
		end

	gtk_file_chooser_error_nonexistent: INTEGER is
			-- 	Indicates that a file does not exist.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ERROR_NONEXISTENT"
		end

	gtk_file_chooser_error_bad_filename: INTEGER is
			-- 	Indicates a malformed filename.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ERROR_BAD_FILENAME"
		end

end
