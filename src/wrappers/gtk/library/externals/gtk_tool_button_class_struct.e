-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TOOL_BUTTON_CLASS_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_tool_button_class_struct_set_button_type (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for button_type field of GTK_TOOL_BUTTON_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_class_struct_set_button_type"
		}"
		end

	gtk_tool_button_class_struct_set_clicked (a_structure: POINTER; a_value: POINTER) is
			-- Setter for clicked field of GTK_TOOL_BUTTON_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_class_struct_set_clicked"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_tool_button_class_struct_get_button_type (a_structure: POINTER): NATURAL_32 is
			-- Query for button_type field of GTK_TOOL_BUTTON_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_class_struct_get_button_type"
		}"
		end

	gtk_tool_button_class_struct_get_clicked (a_structure: POINTER): POINTER is
			-- Query for clicked field of GTK_TOOL_BUTTON_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tool_button_class_struct_get_clicked"
		}"
		end

	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
	-- Unwrappable field _gtk_reserved3.
	-- Unwrappable field _gtk_reserved4.
feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkToolButtonClass"
		}"
		end

end -- class GTK_TOOL_BUTTON_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

