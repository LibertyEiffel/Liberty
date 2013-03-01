-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_FILE_FILTER_INFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_file_filter_info_struct_set_contains (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for contains field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_set_contains"
		}"
		end

	gtk_file_filter_info_struct_set_filename (a_structure: POINTER; a_value: POINTER) is
			-- Setter for filename field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_set_filename"
		}"
		end

	gtk_file_filter_info_struct_set_uri (a_structure: POINTER; a_value: POINTER) is
			-- Setter for uri field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_set_uri"
		}"
		end

	gtk_file_filter_info_struct_set_display_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display_name field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_set_display_name"
		}"
		end

	gtk_file_filter_info_struct_set_mime_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mime_type field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_set_mime_type"
		}"
		end

feature {} -- Low-level queries

	gtk_file_filter_info_struct_get_contains (a_structure: POINTER): INTEGER is
			-- Query for contains field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_get_contains"
		}"
		end

	gtk_file_filter_info_struct_get_filename (a_structure: POINTER): POINTER is
			-- Query for filename field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_get_filename"
		}"
		end

	gtk_file_filter_info_struct_get_uri (a_structure: POINTER): POINTER is
			-- Query for uri field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_get_uri"
		}"
		end

	gtk_file_filter_info_struct_get_display_name (a_structure: POINTER): POINTER is
			-- Query for display_name field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_get_display_name"
		}"
		end

	gtk_file_filter_info_struct_get_mime_type (a_structure: POINTER): POINTER is
			-- Query for mime_type field of GTK_FILE_FILTER_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_file_filter_info_struct_get_mime_type"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFileFilterInfo"
		}"
		end

end -- class GTK_FILE_FILTER_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

