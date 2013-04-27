-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEVIEWCOLUMNCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktreeviewcolumnclass_struct_set_clicked (a_structure: POINTER; a_value: POINTER) is
			-- Setter for clicked field of GTKTREEVIEWCOLUMNCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeviewcolumnclass_struct_set_clicked"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtktreeviewcolumnclass_struct_get_clicked (a_structure: POINTER): POINTER is
			-- Query for clicked field of GTKTREEVIEWCOLUMNCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeviewcolumnclass_struct_get_clicked"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeViewColumnClass"
		}"
		end

end -- class GTKTREEVIEWCOLUMNCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

