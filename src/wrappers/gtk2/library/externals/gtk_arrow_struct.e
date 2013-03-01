-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ARROW_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_arrow_struct_set_arrow_type (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for arrow_type field of GTK_ARROW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_struct_set_arrow_type"
		}"
		end

	gtk_arrow_struct_set_shadow_type (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for shadow_type field of GTK_ARROW_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_struct_set_shadow_type"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field misc.
	gtk_arrow_struct_get_arrow_type (a_structure: POINTER): INTEGER_16 is
			-- Query for arrow_type field of GTK_ARROW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_struct_get_arrow_type"
		}"
		end

	gtk_arrow_struct_get_shadow_type (a_structure: POINTER): INTEGER_16 is
			-- Query for shadow_type field of GTK_ARROW_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_arrow_struct_get_shadow_type"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkArrow"
		}"
		end

end -- class GTK_ARROW_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

