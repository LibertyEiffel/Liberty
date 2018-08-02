note
	description: "enum GtkFileChooserAction -- Describes whether a GtkFileChooser is being used to open existing files or to save to a possibly new file."
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

deferred class GTK_FILE_CHOOSER_ACTION

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_file_chooser_action (a_gtk_file_chooser_action: INTEGER): BOOLEAN
		do
			Result:=((a_gtk_file_chooser_action=gtk_file_chooser_action_open) or else
						(a_gtk_file_chooser_action=gtk_file_chooser_action_save) or else
						(a_gtk_file_chooser_action=gtk_file_chooser_action_select_folder) or else
						(a_gtk_file_chooser_action=gtk_file_chooser_action_create_folder))
		end

	gtk_file_chooser_action_open: INTEGER
			-- Indicates open mode. The file chooser will only let the
			-- user pick an existing file.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_OPEN"
		end

	gtk_file_chooser_action_save: INTEGER
			-- Indicates save mode. The file chooser will let the user
			-- pick an existing file, or type in a new filename.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_SAVE"
		end

	gtk_file_chooser_action_select_folder: INTEGER
			-- Indicates an Open mode for selecting folders. The file
			-- chooser will let the user pick an existing folder.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER"
		end

	gtk_file_chooser_action_create_folder: INTEGER
			-- Indicates a mode for creating a new folder. The file
			-- chooser will let the user name an existing or new folder.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER"
		end

end
