-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_FIXED_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_fixed_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GTK_FIXED_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_struct_set_children"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtk_fixed_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GTK_FIXED_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_fixed_struct_get_children"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFixed"
		}"
		end

end -- class GTK_FIXED_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

