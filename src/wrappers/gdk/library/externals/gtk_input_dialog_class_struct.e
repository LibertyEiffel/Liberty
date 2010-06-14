-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_INPUT_DIALOG_CLASS_STRUCT

inherit ANY undefine is_equal, copy end

insert GTK_TYPES
feature {} -- Low-level setters

	gtk_input_dialog_class_struct_set_enable_device (a_structure: POINTER; a_value: POINTER) is
			-- Setter for enable_device field of GTK_INPUT_DIALOG_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_dialog_class_struct_set_enable_device"
		}"
		end

	gtk_input_dialog_class_struct_set_disable_device (a_structure: POINTER; a_value: POINTER) is
			-- Setter for disable_device field of GTK_INPUT_DIALOG_CLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_dialog_class_struct_set_disable_device"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtk_input_dialog_class_struct_get_enable_device (a_structure: POINTER): POINTER is
			-- Query for enable_device field of GTK_INPUT_DIALOG_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_dialog_class_struct_get_enable_device"
		}"
		end

	gtk_input_dialog_class_struct_get_disable_device (a_structure: POINTER): POINTER is
			-- Query for disable_device field of GTK_INPUT_DIALOG_CLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_input_dialog_class_struct_get_disable_device"
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
			feature_name: "sizeof__GtkInputDialogClass"
		}"
		end

end -- class GTK_INPUT_DIALOG_CLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

