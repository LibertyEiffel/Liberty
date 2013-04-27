-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_SCALE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_scale_struct_set_digits (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for digits field of GTK_SCALE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_struct_set_digits"
		}"
		end

	gtk_scale_struct_set_draw_value (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for draw_value field of GTK_SCALE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_struct_set_draw_value"
		}"
		end

	gtk_scale_struct_set_value_pos (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for value_pos field of GTK_SCALE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_struct_set_value_pos"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field range.
	gtk_scale_struct_get_digits (a_structure: POINTER): INTEGER is
			-- Query for digits field of GTK_SCALE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_struct_get_digits"
		}"
		end

	gtk_scale_struct_get_draw_value (a_structure: POINTER): NATURAL is
			-- Query for draw_value field of GTK_SCALE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_struct_get_draw_value"
		}"
		end

	gtk_scale_struct_get_value_pos (a_structure: POINTER): NATURAL is
			-- Query for value_pos field of GTK_SCALE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scale_struct_get_value_pos"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkScale"
		}"
		end

end -- class GTK_SCALE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

