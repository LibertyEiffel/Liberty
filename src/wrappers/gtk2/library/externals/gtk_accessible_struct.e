-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ACCESSIBLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_accessible_struct_set_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widget field of GTK_ACCESSIBLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_struct_set_widget"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_accessible_struct_get_widget (a_structure: POINTER): POINTER is
			-- Query for widget field of GTK_ACCESSIBLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accessible_struct_get_widget"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccessible"
		}"
		end

end -- class GTK_ACCESSIBLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

