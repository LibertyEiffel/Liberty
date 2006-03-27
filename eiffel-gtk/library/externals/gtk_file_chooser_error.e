indexing
	description: "Enum GtkFileChooserError -- These identify the various errors that can occur while calling GtkFileChooser functions."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_CHOOSER_ERROR
feature  -- enum
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
