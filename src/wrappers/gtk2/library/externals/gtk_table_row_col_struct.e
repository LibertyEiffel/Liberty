-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TABLE_ROW_COL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_table_row_col_struct_set_requisition (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for requisition field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_requisition"
		}"
		end

	gtk_table_row_col_struct_set_allocation (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for allocation field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_allocation"
		}"
		end

	gtk_table_row_col_struct_set_spacing (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for spacing field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_spacing"
		}"
		end

	gtk_table_row_col_struct_set_need_expand (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for need_expand field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_need_expand"
		}"
		end

	gtk_table_row_col_struct_set_need_shrink (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for need_shrink field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_need_shrink"
		}"
		end

	gtk_table_row_col_struct_set_expand (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for expand field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_expand"
		}"
		end

	gtk_table_row_col_struct_set_shrink (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for shrink field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_shrink"
		}"
		end

	gtk_table_row_col_struct_set_empty (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for empty field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_set_empty"
		}"
		end

feature {} -- Low-level queries

	gtk_table_row_col_struct_get_requisition (a_structure: POINTER): NATURAL_16 is
			-- Query for requisition field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_requisition"
		}"
		end

	gtk_table_row_col_struct_get_allocation (a_structure: POINTER): NATURAL_16 is
			-- Query for allocation field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_allocation"
		}"
		end

	gtk_table_row_col_struct_get_spacing (a_structure: POINTER): NATURAL_16 is
			-- Query for spacing field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_spacing"
		}"
		end

	gtk_table_row_col_struct_get_need_expand (a_structure: POINTER): NATURAL is
			-- Query for need_expand field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_need_expand"
		}"
		end

	gtk_table_row_col_struct_get_need_shrink (a_structure: POINTER): NATURAL is
			-- Query for need_shrink field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_need_shrink"
		}"
		end

	gtk_table_row_col_struct_get_expand (a_structure: POINTER): NATURAL is
			-- Query for expand field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_expand"
		}"
		end

	gtk_table_row_col_struct_get_shrink (a_structure: POINTER): NATURAL is
			-- Query for shrink field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_shrink"
		}"
		end

	gtk_table_row_col_struct_get_empty (a_structure: POINTER): NATURAL is
			-- Query for empty field of GTK_TABLE_ROW_COL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_table_row_col_struct_get_empty"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTableRowCol"
		}"
		end

end -- class GTK_TABLE_ROW_COL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

