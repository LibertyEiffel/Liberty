-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_BINDING_ARG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_binding_arg_struct_set_arg_type (a_structure: POINTER; a_value: like long_unsigned) is
			-- Setter for arg_type field of GTK_BINDING_ARG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_arg_struct_set_arg_type"
		}"
		end

feature {} -- Low-level queries

	gtk_binding_arg_struct_get_arg_type (a_structure: POINTER): like long_unsigned is
			-- Query for arg_type field of GTK_BINDING_ARG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_arg_struct_get_arg_type"
		}"
		end

	-- Unwrappable field d.
feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBindingArg"
		}"
		end

end -- class GTK_BINDING_ARG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

