indexing
	description: "enum GtkFileChooserAction -- Describes whether a GtkFileChooser is being used to open existing files or to save to a possibly new file."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_CHOOSER_ACTION
feature  -- enum
	is_valid_gtk_file_chooser_action (a_gtk_file_chooser_action: INTEGER): BOOLEAN is
		do	
			Result:=((a_gtk_file_chooser_action=gtk_file_chooser_action_open) or else
						(a_gtk_file_chooser_action=gtk_file_chooser_action_save) or else
						(a_gtk_file_chooser_action=gtk_file_chooser_action_select_folder) or else
						(a_gtk_file_chooser_action=gtk_file_chooser_action_create_folder))
		end

	gtk_file_chooser_action_open: INTEGER is
			-- Indicates open mode. The file chooser will only let the
			-- user pick an existing file.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_OPEN"
		end
	
	gtk_file_chooser_action_save: INTEGER is
			-- Indicates save mode. The file chooser will let the user
			-- pick an existing file, or type in a new filename.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_SAVE"
		end
	
	gtk_file_chooser_action_select_folder: INTEGER is
			-- Indicates an Open mode for selecting folders. The file
			-- chooser will let the user pick an existing folder.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_SELECT_FOLDER"
		end
	
	gtk_file_chooser_action_create_folder: INTEGER is
			-- Indicates a mode for creating a new folder. The file
			-- chooser will let the user name an existing or new folder.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_CHOOSER_ACTION_CREATE_FOLDER"
		end
end
