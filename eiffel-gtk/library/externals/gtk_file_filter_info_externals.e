
indexing
	description: "External calls for GTL_FILE_FILTER_INFO A GtkFileFilterInfo struct is used to pass information about the tested file to gtk_file_filter_filter()."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_FILE_FILTER_INFO_EXTERNALS
inherit GTK_FILE_FILTER_FLAGS
feature {NONE} -- Getters

	get_contains (a_gtk_file_filter_info: POINTER): INTEGER is
		-- Flags indicating which of the following fields need are filled
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo get contains use <gtk/gtk.h>"
			-- TODO: it seems that external features cannot have postconditions....
			-- ensure are_valid_gtk_file_filter_flags (Result)
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

feature {NONE} -- Setters
	set_contains (a_gtk_file_filter_info: POINTER; a_contains: INTEGER) is
		-- Flags indicating which of the following fields need are filled
		require a_gtk_file_filter_info.is_not_null
		external "C struct GtkFileFilterInfo set contains use <gtk/gtk.h>"	
			-- TODO: it seems that external features cannot have postconditions....
			-- ensure are_valid_gtk_file_filter_flags (Result)
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
