-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCALE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkscale_struct_set_digits (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for digits field of GTKSCALE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscale_struct_set_digits"
		}"
		end

	gtkscale_struct_set_draw_value (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for draw_value field of GTKSCALE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscale_struct_set_draw_value"
		}"
		end

	gtkscale_struct_set_value_pos (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for value_pos field of GTKSCALE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscale_struct_set_value_pos"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field range.
	gtkscale_struct_get_digits (a_structure: POINTER): INTEGER_32 is
			-- Query for digits field of GTKSCALE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscale_struct_get_digits"
		}"
		end

	gtkscale_struct_get_draw_value (a_structure: POINTER): NATURAL_32 is
			-- Query for draw_value field of GTKSCALE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscale_struct_get_draw_value"
		}"
		end

	gtkscale_struct_get_value_pos (a_structure: POINTER): NATURAL_32 is
			-- Query for value_pos field of GTKSCALE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkscale_struct_get_value_pos"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkScale"
		}"
		end

end -- class GTKSCALE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

