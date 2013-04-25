-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCOLORSELECTION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkcolorselection_struct_set_private_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for private_data field of GTKCOLORSELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselection_struct_set_private_data"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gtkcolorselection_struct_get_private_data (a_structure: POINTER): POINTER is
			-- Query for private_data field of GTKCOLORSELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkcolorselection_struct_get_private_data"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkColorSelection"
		}"
		end

end -- class GTKCOLORSELECTION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

