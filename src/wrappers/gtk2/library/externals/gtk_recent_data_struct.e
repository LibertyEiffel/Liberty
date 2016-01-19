-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_RECENT_DATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_recent_data_struct_set_display_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display_name field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_display_name"
		}"
		end

	gtk_recent_data_struct_set_description (a_structure: POINTER; a_value: POINTER) is
			-- Setter for description field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_description"
		}"
		end

	gtk_recent_data_struct_set_mime_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mime_type field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_mime_type"
		}"
		end

	gtk_recent_data_struct_set_app_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for app_name field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_app_name"
		}"
		end

	gtk_recent_data_struct_set_app_exec (a_structure: POINTER; a_value: POINTER) is
			-- Setter for app_exec field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_app_exec"
		}"
		end

	gtk_recent_data_struct_set_groups (a_structure: POINTER; a_value: POINTER) is
			-- Setter for groups field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_groups"
		}"
		end

	gtk_recent_data_struct_set_is_private (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for is_private field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_set_is_private"
		}"
		end

feature {} -- Low-level queries

	gtk_recent_data_struct_get_display_name (a_structure: POINTER): POINTER is
			-- Query for display_name field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_display_name"
		}"
		end

	gtk_recent_data_struct_get_description (a_structure: POINTER): POINTER is
			-- Query for description field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_description"
		}"
		end

	gtk_recent_data_struct_get_mime_type (a_structure: POINTER): POINTER is
			-- Query for mime_type field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_mime_type"
		}"
		end

	gtk_recent_data_struct_get_app_name (a_structure: POINTER): POINTER is
			-- Query for app_name field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_app_name"
		}"
		end

	gtk_recent_data_struct_get_app_exec (a_structure: POINTER): POINTER is
			-- Query for app_exec field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_app_exec"
		}"
		end

	gtk_recent_data_struct_get_groups (a_structure: POINTER): POINTER is
			-- Query for groups field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_groups"
		}"
		end

	gtk_recent_data_struct_get_is_private (a_structure: POINTER): INTEGER is
			-- Query for is_private field of GTK_RECENT_DATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_recent_data_struct_get_is_private"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentData"
		}"
		end

end -- class GTK_RECENT_DATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

