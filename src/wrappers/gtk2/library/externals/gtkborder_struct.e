-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBORDER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkborder_struct_set_left (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for left field of GTKBORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_set_left"
		}"
		end

	gtkborder_struct_set_right (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for right field of GTKBORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_set_right"
		}"
		end

	gtkborder_struct_set_top (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for top field of GTKBORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_set_top"
		}"
		end

	gtkborder_struct_set_bottom (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for bottom field of GTKBORDER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_set_bottom"
		}"
		end

feature {} -- Low-level queries

	gtkborder_struct_get_left (a_structure: POINTER): INTEGER_32 is
			-- Query for left field of GTKBORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_get_left"
		}"
		end

	gtkborder_struct_get_right (a_structure: POINTER): INTEGER_32 is
			-- Query for right field of GTKBORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_get_right"
		}"
		end

	gtkborder_struct_get_top (a_structure: POINTER): INTEGER_32 is
			-- Query for top field of GTKBORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_get_top"
		}"
		end

	gtkborder_struct_get_bottom (a_structure: POINTER): INTEGER_32 is
			-- Query for bottom field of GTKBORDER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkborder_struct_get_bottom"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBorder"
		}"
		end

end -- class GTKBORDER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

