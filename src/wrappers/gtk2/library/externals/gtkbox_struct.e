-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBOX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkbox_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GTKBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbox_struct_set_children"
		}"
		end

	gtkbox_struct_set_spacing (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for spacing field of GTKBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbox_struct_set_spacing"
		}"
		end

	gtkbox_struct_set_homogeneous (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for homogeneous field of GTKBOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbox_struct_set_homogeneous"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtkbox_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GTKBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbox_struct_get_children"
		}"
		end

	gtkbox_struct_get_spacing (a_structure: POINTER): INTEGER_16 is
			-- Query for spacing field of GTKBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbox_struct_get_spacing"
		}"
		end

	gtkbox_struct_get_homogeneous (a_structure: POINTER): NATURAL_32 is
			-- Query for homogeneous field of GTKBOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbox_struct_get_homogeneous"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBox"
		}"
		end

end -- class GTKBOX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

