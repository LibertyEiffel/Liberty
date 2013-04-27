-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_STATUSBAR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_statusbar_struct_set_frame (a_structure: POINTER; a_value: POINTER) is
			-- Setter for frame field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_frame"
		}"
		end

	gtk_statusbar_struct_set_label (a_structure: POINTER; a_value: POINTER) is
			-- Setter for label field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_label"
		}"
		end

	gtk_statusbar_struct_set_messages (a_structure: POINTER; a_value: POINTER) is
			-- Setter for messages field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_messages"
		}"
		end

	gtk_statusbar_struct_set_keys (a_structure: POINTER; a_value: POINTER) is
			-- Setter for keys field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_keys"
		}"
		end

	gtk_statusbar_struct_set_seq_context_id (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for seq_context_id field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_seq_context_id"
		}"
		end

	gtk_statusbar_struct_set_seq_message_id (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for seq_message_id field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_seq_message_id"
		}"
		end

	gtk_statusbar_struct_set_grip_window (a_structure: POINTER; a_value: POINTER) is
			-- Setter for grip_window field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_grip_window"
		}"
		end

	gtk_statusbar_struct_set_has_resize_grip (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for has_resize_grip field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_set_has_resize_grip"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_widget.
	gtk_statusbar_struct_get_frame (a_structure: POINTER): POINTER is
			-- Query for frame field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_frame"
		}"
		end

	gtk_statusbar_struct_get_label (a_structure: POINTER): POINTER is
			-- Query for label field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_label"
		}"
		end

	gtk_statusbar_struct_get_messages (a_structure: POINTER): POINTER is
			-- Query for messages field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_messages"
		}"
		end

	gtk_statusbar_struct_get_keys (a_structure: POINTER): POINTER is
			-- Query for keys field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_keys"
		}"
		end

	gtk_statusbar_struct_get_seq_context_id (a_structure: POINTER): NATURAL is
			-- Query for seq_context_id field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_seq_context_id"
		}"
		end

	gtk_statusbar_struct_get_seq_message_id (a_structure: POINTER): NATURAL is
			-- Query for seq_message_id field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_seq_message_id"
		}"
		end

	gtk_statusbar_struct_get_grip_window (a_structure: POINTER): POINTER is
			-- Query for grip_window field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_grip_window"
		}"
		end

	gtk_statusbar_struct_get_has_resize_grip (a_structure: POINTER): NATURAL is
			-- Query for has_resize_grip field of GTK_STATUSBAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_struct_get_has_resize_grip"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkStatusbar"
		}"
		end

end -- class GTK_STATUSBAR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

