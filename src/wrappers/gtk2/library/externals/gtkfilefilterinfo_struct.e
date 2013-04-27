-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFILEFILTERINFO_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkfilefilterinfo_struct_set_contains (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for contains field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_set_contains"
		}"
		end

	gtkfilefilterinfo_struct_set_filename (a_structure: POINTER; a_value: POINTER) is
			-- Setter for filename field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_set_filename"
		}"
		end

	gtkfilefilterinfo_struct_set_uri (a_structure: POINTER; a_value: POINTER) is
			-- Setter for uri field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_set_uri"
		}"
		end

	gtkfilefilterinfo_struct_set_display_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display_name field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_set_display_name"
		}"
		end

	gtkfilefilterinfo_struct_set_mime_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for mime_type field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_set_mime_type"
		}"
		end

feature {} -- Low-level queries

	gtkfilefilterinfo_struct_get_contains (a_structure: POINTER): INTEGER is
			-- Query for contains field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_get_contains"
		}"
		end

	gtkfilefilterinfo_struct_get_filename (a_structure: POINTER): POINTER is
			-- Query for filename field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_get_filename"
		}"
		end

	gtkfilefilterinfo_struct_get_uri (a_structure: POINTER): POINTER is
			-- Query for uri field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_get_uri"
		}"
		end

	gtkfilefilterinfo_struct_get_display_name (a_structure: POINTER): POINTER is
			-- Query for display_name field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_get_display_name"
		}"
		end

	gtkfilefilterinfo_struct_get_mime_type (a_structure: POINTER): POINTER is
			-- Query for mime_type field of GTKFILEFILTERINFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfilefilterinfo_struct_get_mime_type"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFileFilterInfo"
		}"
		end

end -- class GTKFILEFILTERINFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

