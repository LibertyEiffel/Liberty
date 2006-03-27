indexing
	description: "Enum GTK_FILE_FILTER_FLAGS These flags indicate what parts of a GtkFileFilterInfo struct are filled or need to be filled.a"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_FILTER_FLAGS
feature  -- enum
	are_valid_gtk_file_filter_flags (some_flags :INTEGER): BOOLEAN is
		do	
			Result:=((some_flags & gtk_file_filter_filename) |
						(some_flags & gtk_file_filter_uri) |
						(some_flags & gtk_file_filter_display_name) |
						(some_flags & gtk_file_filter_mime_type)).to_boolean
		end

	gtk_file_filter_filename: INTEGER is
			-- 	the filename of the file being tested
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_FILENAME"
		end

	gtk_file_filter_uri: INTEGER is
			-- 	the URI for the file being tested
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_URI"
		end

	gtk_file_filter_display_name: INTEGER is
			-- 	the string that will be used to display the file in the file chooser
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_DISPLAY_NAME"
		end

	gtk_file_filter_mime_type: INTEGER is
			-- 	the mime type of the file
		external "C macro use <gtk/gtk.h>"
		alias "GTK_FILE_FILTER_MIME_TYPE"
		end
end
