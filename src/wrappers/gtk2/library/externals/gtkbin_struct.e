-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBIN_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkbin_struct_set_child (a_structure: POINTER; a_value: POINTER) is
			-- Setter for child field of GTKBIN_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbin_struct_set_child"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field container.
	gtkbin_struct_get_child (a_structure: POINTER): POINTER is
			-- Query for child field of GTKBIN_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbin_struct_get_child"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBin"
		}"
		end

end -- class GTKBIN_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

