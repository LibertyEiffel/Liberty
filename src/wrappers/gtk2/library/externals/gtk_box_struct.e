-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_BOX_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_box_struct_set_children (a_structure: POINTER; a_value: POINTER) is
			-- Setter for children field of GTK_BOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_struct_set_children"
		}"
		end

	gtk_box_struct_set_spacing (a_structure: POINTER; a_value: INTEGER_16) is
			-- Setter for spacing field of GTK_BOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_struct_set_spacing"
		}"
		end

	gtk_box_struct_set_homogeneous (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for homogeneous field of GTK_BOX_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_struct_set_homogeneous"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtk_box_struct_get_children (a_structure: POINTER): POINTER is
			-- Query for children field of GTK_BOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_struct_get_children"
		}"
		end

	gtk_box_struct_get_spacing (a_structure: POINTER): INTEGER_16 is
			-- Query for spacing field of GTK_BOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_struct_get_spacing"
		}"
		end

	gtk_box_struct_get_homogeneous (a_structure: POINTER): NATURAL is
			-- Query for homogeneous field of GTK_BOX_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_box_struct_get_homogeneous"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBox"
		}"
		end

end -- class GTK_BOX_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

