-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFIXEDCHILD_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkfixedchild_struct_set_widget (a_structure: POINTER; a_value: POINTER) is
			-- Setter for widget field of GTKFIXEDCHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfixedchild_struct_set_widget"
		}"
		end

	gtkfixedchild_struct_set_x (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for x field of GTKFIXEDCHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfixedchild_struct_set_x"
		}"
		end

	gtkfixedchild_struct_set_y (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for y field of GTKFIXEDCHILD_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfixedchild_struct_set_y"
		}"
		end

feature {} -- Low-level queries

	gtkfixedchild_struct_get_widget (a_structure: POINTER): POINTER is
			-- Query for widget field of GTKFIXEDCHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfixedchild_struct_get_widget"
		}"
		end

	gtkfixedchild_struct_get_x (a_structure: POINTER): INTEGER_32 is
			-- Query for x field of GTKFIXEDCHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfixedchild_struct_get_x"
		}"
		end

	gtkfixedchild_struct_get_y (a_structure: POINTER): INTEGER_32 is
			-- Query for y field of GTKFIXEDCHILD_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkfixedchild_struct_get_y"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkFixedChild"
		}"
		end

end -- class GTKFIXEDCHILD_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

