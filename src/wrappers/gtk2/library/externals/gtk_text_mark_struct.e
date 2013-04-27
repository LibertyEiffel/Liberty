-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TEXT_MARK_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_text_mark_struct_set_segment (a_structure: POINTER; a_value: POINTER) is
			-- Setter for segment field of GTK_TEXT_MARK_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_struct_set_segment"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_text_mark_struct_get_segment (a_structure: POINTER): POINTER is
			-- Query for segment field of GTK_TEXT_MARK_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_mark_struct_get_segment"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTextMark"
		}"
		end

end -- class GTK_TEXT_MARK_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

