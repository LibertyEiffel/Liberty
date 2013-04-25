-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKUIMANAGER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkuimanager_struct_set_private_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for private_data field of GTKUIMANAGER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkuimanager_struct_set_private_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtkuimanager_struct_get_private_data (a_structure: POINTER): POINTER is
			-- Query for private_data field of GTKUIMANAGER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkuimanager_struct_get_private_data"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkUIManager"
		}"
		end

end -- class GTKUIMANAGER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

