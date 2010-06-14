-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CLIST_CELL_INFO_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_clist_cell_info_struct_set_row (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for row field of GTK_CLIST_CELL_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_cell_info_struct_set_row"
		}"
		end

	gtk_clist_cell_info_struct_set_column (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for column field of GTK_CLIST_CELL_INFO_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_cell_info_struct_set_column"
		}"
		end

feature {} -- Low-level queries

	gtk_clist_cell_info_struct_get_row (a_structure: POINTER): INTEGER_32 is
			-- Query for row field of GTK_CLIST_CELL_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_cell_info_struct_get_row"
		}"
		end

	gtk_clist_cell_info_struct_get_column (a_structure: POINTER): INTEGER_32 is
			-- Query for column field of GTK_CLIST_CELL_INFO_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_clist_cell_info_struct_get_column"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCListCellInfo"
		}"
		end

end -- class GTK_CLIST_CELL_INFO_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

