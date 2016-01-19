-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRECENTFILTERINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkrecentfilterinfo_struct_set_contains (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for contains field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_contains"
		}"
		end

	gtkrecentfilterinfo_struct_set_uri (a_structure: POINTER; a_value: POINTER) is
			-- Setter for uri field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_uri"
		}"
		end

	gtkrecentfilterinfo_struct_set_display_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display_name field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_display_name"
		}"
		end

	gtkrecentfilterinfo_struct_set_mime_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mime_type field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_mime_type"
		}"
		end

	gtkrecentfilterinfo_struct_set_applications (a_structure: POINTER; a_value: POINTER) is
			-- Setter for applications field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_applications"
		}"
		end

	gtkrecentfilterinfo_struct_set_groups (a_structure: POINTER; a_value: POINTER) is
			-- Setter for groups field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_groups"
		}"
		end

	gtkrecentfilterinfo_struct_set_age (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for age field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_set_age"
		}"
		end

feature {} -- Low-level queries

	gtkrecentfilterinfo_struct_get_contains (a_structure: POINTER): INTEGER is
			-- Query for contains field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_contains"
		}"
		end

	gtkrecentfilterinfo_struct_get_uri (a_structure: POINTER): POINTER is
			-- Query for uri field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_uri"
		}"
		end

	gtkrecentfilterinfo_struct_get_display_name (a_structure: POINTER): POINTER is
			-- Query for display_name field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_display_name"
		}"
		end

	gtkrecentfilterinfo_struct_get_mime_type (a_structure: POINTER): POINTER is
			-- Query for mime_type field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_mime_type"
		}"
		end

	gtkrecentfilterinfo_struct_get_applications (a_structure: POINTER): POINTER is
			-- Query for applications field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_applications"
		}"
		end

	gtkrecentfilterinfo_struct_get_groups (a_structure: POINTER): POINTER is
			-- Query for groups field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_groups"
		}"
		end

	gtkrecentfilterinfo_struct_get_age (a_structure: POINTER): INTEGER_32 is
			-- Query for age field of GTKRECENTFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkrecentfilterinfo_struct_get_age"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkRecentFilterInfo"
		}"
		end

end -- class GTKRECENTFILTERINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

