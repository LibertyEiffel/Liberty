-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBUTTONBOX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkbuttonbox_struct_set_child_min_width (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for child_min_width field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_set_child_min_width"
		}"
		end

	gtkbuttonbox_struct_set_child_min_height (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for child_min_height field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_set_child_min_height"
		}"
		end

	gtkbuttonbox_struct_set_child_ipad_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for child_ipad_x field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_set_child_ipad_x"
		}"
		end

	gtkbuttonbox_struct_set_child_ipad_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for child_ipad_y field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_set_child_ipad_y"
		}"
		end

	gtkbuttonbox_struct_set_layout_style (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for layout_style field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_set_layout_style"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field box.
	gtkbuttonbox_struct_get_child_min_width (a_structure: POINTER): INTEGER_32 is
			-- Query for child_min_width field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_get_child_min_width"
		}"
		end

	gtkbuttonbox_struct_get_child_min_height (a_structure: POINTER): INTEGER_32 is
			-- Query for child_min_height field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_get_child_min_height"
		}"
		end

	gtkbuttonbox_struct_get_child_ipad_x (a_structure: POINTER): INTEGER_32 is
			-- Query for child_ipad_x field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_get_child_ipad_x"
		}"
		end

	gtkbuttonbox_struct_get_child_ipad_y (a_structure: POINTER): INTEGER_32 is
			-- Query for child_ipad_y field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_get_child_ipad_y"
		}"
		end

	gtkbuttonbox_struct_get_layout_style (a_structure: POINTER): INTEGER is
			-- Query for layout_style field of GTKBUTTONBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbuttonbox_struct_get_layout_style"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkButtonBox"
		}"
		end

end -- class GTKBUTTONBOX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

