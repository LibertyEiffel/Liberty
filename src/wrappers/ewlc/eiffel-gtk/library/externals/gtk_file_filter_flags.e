note
	description: "Enum GTK_FILE_FILTER_FLAGS These flags indicate what parts of a GtkFileFilterInfo struct are filled or need to be filled.a"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_FILE_FILTER_FLAGS

inherit ANY undefine is_equal, copy end

feature {} -- enum

	are_valid_file_filter_flags (some_flags :INTEGER): BOOLEAN
		do	
			Result:=((some_flags & gtk_file_filter_filename) |
						(some_flags & gtk_file_filter_uri) |
						(some_flags & gtk_file_filter_display_name) |
						(some_flags & gtk_file_filter_mime_type)).to_boolean
		end

	gtk_file_filter_filename: INTEGER
			-- 	the filename of the file being tested
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_FILENAME"
		end

	gtk_file_filter_uri: INTEGER
			-- 	the URI for the file being tested
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_URI"
		end

	gtk_file_filter_display_name: INTEGER
			-- 	the string that will be used to display the file in the file chooser
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_DISPLAY_NAME"
		end

	gtk_file_filter_mime_type: INTEGER
			-- 	the mime type of the file
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_MIME_TYPE"
		end
end
