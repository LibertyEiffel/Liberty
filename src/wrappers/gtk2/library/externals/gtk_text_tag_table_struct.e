-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TEXT_TAG_TABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_text_tag_table_struct_set_hash (a_structure: POINTER; a_value: POINTER) is
			-- Setter for hash field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_set_hash"
		}"
		end

	gtk_text_tag_table_struct_set_anonymous (a_structure: POINTER; a_value: POINTER) is
			-- Setter for anonymous field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_set_anonymous"
		}"
		end

	gtk_text_tag_table_struct_set_anon_count (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for anon_count field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_set_anon_count"
		}"
		end

	gtk_text_tag_table_struct_set_buffers (a_structure: POINTER; a_value: POINTER) is
			-- Setter for buffers field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_set_buffers"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_text_tag_table_struct_get_hash (a_structure: POINTER): POINTER is
			-- Query for hash field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_get_hash"
		}"
		end

	gtk_text_tag_table_struct_get_anonymous (a_structure: POINTER): POINTER is
			-- Query for anonymous field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_get_anonymous"
		}"
		end

	gtk_text_tag_table_struct_get_anon_count (a_structure: POINTER): INTEGER is
			-- Query for anon_count field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_get_anon_count"
		}"
		end

	gtk_text_tag_table_struct_get_buffers (a_structure: POINTER): POINTER is
			-- Query for buffers field of GTK_TEXT_TAG_TABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_tag_table_struct_get_buffers"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTextTagTable"
		}"
		end

end -- class GTK_TEXT_TAG_TABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

