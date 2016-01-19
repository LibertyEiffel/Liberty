-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_CELL_RENDERER_TEXT_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_cell_renderer_text_class_struct_set_edited (a_structure: POINTER; a_value: POINTER) is
			-- Setter for edited field of GTK_CELL_RENDERER_TEXT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_class_struct_set_edited"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_cell_renderer_text_class_struct_get_edited (a_structure: POINTER): POINTER is
			-- Query for edited field of GTK_CELL_RENDERER_TEXT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_text_class_struct_get_edited"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkCellRendererTextClass"
		}"
		end

end -- class GTK_CELL_RENDERER_TEXT_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

