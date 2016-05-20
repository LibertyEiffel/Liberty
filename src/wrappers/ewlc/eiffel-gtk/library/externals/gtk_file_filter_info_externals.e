note
	description: "External calls for GTL_FILE_FILTER_INFO A GtkFileFilterInfo struct is used to pass information about the tested file to gtk_file_filter_filter()."
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

deferred class GTK_FILE_FILTER_INFO_EXTERNALS

inherit
	ANY undefine is_equal, copy end
	GTK_FILE_FILTER_FLAGS

feature {} -- Getters

	get_contains (a_gtk_file_filter_info: POINTER): INTEGER is
		-- Flags indicating which of the following fields need are filled
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo get contains use <gtk/gtk.h>"
			-- TODO: it seems that external features cannot have postconditions....
			-- ensure are_valid_file_filter_flags (Result)
		end
	
	get_filename (a_gtk_file_filter_info: POINTER): POINTER is
		-- 	the filename of the file being tested
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo get contains use <gtk/gtk.h>"
		end

	get_uri (a_gtk_file_filter_info: POINTER): POINTER is 
		-- 	the URI for the file being tested
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo get contains use <gtk/gtk.h>"
		end

	get_display_name (a_gtk_file_filter_info: POINTER): POINTER is
		-- 	the string that will be used to display the file in the file chooser
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo get contains use <gtk/gtk.h>"
		end

	get_mime_type (a_gtk_file_filter_info: POINTER): POINTER is
		-- 	the mime type of the file
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo get contains use <gtk/gtk.h>"
		end

feature {} -- Setters
	set_contains (a_gtk_file_filter_info: POINTER; a_contains: INTEGER) is
		-- Flags indicating which of the following fields need are filled
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo set contains use <gtk/gtk.h>"
			-- TODO: it seems that external features cannot have postconditions....
			-- ensure are_valid_file_filter_flags (Result)
		end

	set_filename (a_gtk_file_filter_info, a_filename: POINTER) is
		-- 	the filename of the file being tested
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo set contains use <gtk/gtk.h>"
		end

	set_uri (a_gtk_file_filter_info, an_uri: POINTER) is
		-- 	the URI for the file being tested
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo set contains use <gtk/gtk.h>"
		end

	set_display_name (a_gtk_file_filter_info: POINTER; a_display_name: POINTER) is
		-- 	the string that will be used to display the file in the file chooser
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo set contains use <gtk/gtk.h>"
		end
	
	set_mime_type (a_gtk_file_filter_info: POINTER; a_mime_type: POINTER) is
			-- 	the mime type of the file
		require a_gtk_file_filter_info.is_not_null
			a_mime_type.is_not_null
		external "C struct GtkFileFilterInfo set contains use <gtk/gtk.h>"
		end

end
