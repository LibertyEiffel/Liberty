-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_PAGE_RANGE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_page_range_struct_set_start (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for start field of GTK_PAGE_RANGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_range_struct_set_start"
		}"
		end

	gtk_page_range_struct_set_end_field (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for end field of GTK_PAGE_RANGE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_range_struct_set_end_field"
		}"
		end

feature {} -- Low-level queries

	gtk_page_range_struct_get_start (a_structure: POINTER): INTEGER is
			-- Query for start field of GTK_PAGE_RANGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_range_struct_get_start"
		}"
		end

	gtk_page_range_struct_get_end_field (a_structure: POINTER): INTEGER is
			-- Query for end field of GTK_PAGE_RANGE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_page_range_struct_get_end_field"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkPageRange"
		}"
		end

end -- class GTK_PAGE_RANGE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

