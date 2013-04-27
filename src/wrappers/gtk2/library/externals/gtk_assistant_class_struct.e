-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ASSISTANT_CLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_assistant_class_struct_set_prepare (a_structure: POINTER; a_value: POINTER) is
			-- Setter for prepare field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_set_prepare"
		}"
		end

	gtk_assistant_class_struct_set_apply (a_structure: POINTER; a_value: POINTER) is
			-- Setter for apply field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_set_apply"
		}"
		end

	gtk_assistant_class_struct_set_close (a_structure: POINTER; a_value: POINTER) is
			-- Setter for close field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_set_close"
		}"
		end

	gtk_assistant_class_struct_set_cancel (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cancel field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_set_cancel"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_assistant_class_struct_get_prepare (a_structure: POINTER): POINTER is
			-- Query for prepare field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_get_prepare"
		}"
		end

	gtk_assistant_class_struct_get_apply (a_structure: POINTER): POINTER is
			-- Query for apply field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_get_apply"
		}"
		end

	gtk_assistant_class_struct_get_close (a_structure: POINTER): POINTER is
			-- Query for close field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_get_close"
		}"
		end

	gtk_assistant_class_struct_get_cancel (a_structure: POINTER): POINTER is
			-- Query for cancel field of GTK_ASSISTANT_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_assistant_class_struct_get_cancel"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
	-- Unwrappable field _gtk_reserved5.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAssistantClass"
		}"
		end

end -- class GTK_ASSISTANT_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

