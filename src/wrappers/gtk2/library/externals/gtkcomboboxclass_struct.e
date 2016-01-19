-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOMBOBOXCLASS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcomboboxclass_struct_set_changed (a_structure: POINTER; a_value: POINTER) is
			-- Setter for changed field of GTKCOMBOBOXCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcomboboxclass_struct_set_changed"
		}"
		end

	gtkcomboboxclass_struct_set_get_active_text (a_structure: POINTER; a_value: POINTER) is
			-- Setter for get_active_text field of GTKCOMBOBOXCLASS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcomboboxclass_struct_set_get_active_text"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_class.
	gtkcomboboxclass_struct_get_changed (a_structure: POINTER): POINTER is
			-- Query for changed field of GTKCOMBOBOXCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcomboboxclass_struct_get_changed"
		}"
		end

	gtkcomboboxclass_struct_get_get_active_text (a_structure: POINTER): POINTER is
			-- Query for get_active_text field of GTKCOMBOBOXCLASS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcomboboxclass_struct_get_get_active_text"
		}"
		end

	-- Unwrappable field _gtk_reserved0.
	-- Unwrappable field _gtk_reserved1.
	-- Unwrappable field _gtk_reserved2.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkComboBoxClass"
		}"
		end

end -- class GTKCOMBOBOXCLASS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

