-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBINDINGARG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkbindingarg_struct_set_arg_type (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for arg_type field of GTKBINDINGARG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingarg_struct_set_arg_type"
		}"
		end

feature {} -- Low-level queries

	gtkbindingarg_struct_get_arg_type (a_structure: POINTER): NATURAL_64 is
			-- Query for arg_type field of GTKBINDINGARG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingarg_struct_get_arg_type"
		}"
		end

	-- Unwrappable field d.
feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBindingArg"
		}"
		end

end -- class GTKBINDINGARG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

