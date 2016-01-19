-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TEXT_BUFFER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_text_buffer_struct_set_tag_table (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tag_table field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_tag_table"
		}"
		end

	gtk_text_buffer_struct_set_btree (a_structure: POINTER; a_value: POINTER) is
			-- Setter for btree field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_btree"
		}"
		end

	gtk_text_buffer_struct_set_clipboard_contents_buffers (a_structure: POINTER; a_value: POINTER) is
			-- Setter for clipboard_contents_buffers field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_clipboard_contents_buffers"
		}"
		end

	gtk_text_buffer_struct_set_selection_clipboards (a_structure: POINTER; a_value: POINTER) is
			-- Setter for selection_clipboards field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_selection_clipboards"
		}"
		end

	gtk_text_buffer_struct_set_log_attr_cache (a_structure: POINTER; a_value: POINTER) is
			-- Setter for log_attr_cache field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_log_attr_cache"
		}"
		end

	gtk_text_buffer_struct_set_user_action_count (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for user_action_count field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_user_action_count"
		}"
		end

	gtk_text_buffer_struct_set_modified (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for modified field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_modified"
		}"
		end

	gtk_text_buffer_struct_set_has_selection (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for has_selection field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_set_has_selection"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtk_text_buffer_struct_get_tag_table (a_structure: POINTER): POINTER is
			-- Query for tag_table field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_tag_table"
		}"
		end

	gtk_text_buffer_struct_get_btree (a_structure: POINTER): POINTER is
			-- Query for btree field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_btree"
		}"
		end

	gtk_text_buffer_struct_get_clipboard_contents_buffers (a_structure: POINTER): POINTER is
			-- Query for clipboard_contents_buffers field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_clipboard_contents_buffers"
		}"
		end

	gtk_text_buffer_struct_get_selection_clipboards (a_structure: POINTER): POINTER is
			-- Query for selection_clipboards field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_selection_clipboards"
		}"
		end

	gtk_text_buffer_struct_get_log_attr_cache (a_structure: POINTER): POINTER is
			-- Query for log_attr_cache field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_log_attr_cache"
		}"
		end

	gtk_text_buffer_struct_get_user_action_count (a_structure: POINTER): NATURAL is
			-- Query for user_action_count field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_user_action_count"
		}"
		end

	gtk_text_buffer_struct_get_modified (a_structure: POINTER): NATURAL is
			-- Query for modified field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_modified"
		}"
		end

	gtk_text_buffer_struct_get_has_selection (a_structure: POINTER): NATURAL is
			-- Query for has_selection field of GTK_TEXT_BUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_text_buffer_struct_get_has_selection"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTextBuffer"
		}"
		end

end -- class GTK_TEXT_BUFFER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

