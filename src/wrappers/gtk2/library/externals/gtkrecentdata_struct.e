-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrecentdata_struct_set_display_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display_name field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_display_name"
		}"
		end

	gtkrecentdata_struct_set_description (a_structure: POINTER; a_value: POINTER) is
			-- Setter for description field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_description"
		}"
		end

	gtkrecentdata_struct_set_mime_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mime_type field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_mime_type"
		}"
		end

	gtkrecentdata_struct_set_app_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for app_name field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_app_name"
		}"
		end

	gtkrecentdata_struct_set_app_exec (a_structure: POINTER; a_value: POINTER) is
			-- Setter for app_exec field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_app_exec"
		}"
		end

	gtkrecentdata_struct_set_groups (a_structure: POINTER; a_value: POINTER) is
			-- Setter for groups field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_groups"
		}"
		end

	gtkrecentdata_struct_set_is_private (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for is_private field of GTKRECENTDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_set_is_private"
		}"
		end

feature {} -- Low-level queries

	gtkrecentdata_struct_get_display_name (a_structure: POINTER): POINTER is
			-- Query for display_name field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_display_name"
		}"
		end

	gtkrecentdata_struct_get_description (a_structure: POINTER): POINTER is
			-- Query for description field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_description"
		}"
		end

	gtkrecentdata_struct_get_mime_type (a_structure: POINTER): POINTER is
			-- Query for mime_type field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_mime_type"
		}"
		end

	gtkrecentdata_struct_get_app_name (a_structure: POINTER): POINTER is
			-- Query for app_name field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_app_name"
		}"
		end

	gtkrecentdata_struct_get_app_exec (a_structure: POINTER): POINTER is
			-- Query for app_exec field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_app_exec"
		}"
		end

	gtkrecentdata_struct_get_groups (a_structure: POINTER): POINTER is
			-- Query for groups field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_groups"
		}"
		end

	gtkrecentdata_struct_get_is_private (a_structure: POINTER): INTEGER_32 is
			-- Query for is_private field of GTKRECENTDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentdata_struct_get_is_private"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentData"
		}"
		end

end -- class GTKRECENTDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

