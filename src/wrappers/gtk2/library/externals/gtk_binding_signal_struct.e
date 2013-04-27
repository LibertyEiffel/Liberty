-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_BINDING_SIGNAL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_binding_signal_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_set_next"
		}"
		end

	gtk_binding_signal_struct_set_signal_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for signal_name field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_set_signal_name"
		}"
		end

	gtk_binding_signal_struct_set_n_args (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for n_args field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_set_n_args"
		}"
		end

	gtk_binding_signal_struct_set_args (a_structure: POINTER; a_value: POINTER) is
			-- Setter for args field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_set_args"
		}"
		end

feature {} -- Low-level queries

	gtk_binding_signal_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_get_next"
		}"
		end

	gtk_binding_signal_struct_get_signal_name (a_structure: POINTER): POINTER is
			-- Query for signal_name field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_get_signal_name"
		}"
		end

	gtk_binding_signal_struct_get_n_args (a_structure: POINTER): NATURAL is
			-- Query for n_args field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_get_n_args"
		}"
		end

	gtk_binding_signal_struct_get_args (a_structure: POINTER): POINTER is
			-- Query for args field of GTK_BINDING_SIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_binding_signal_struct_get_args"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBindingSignal"
		}"
		end

end -- class GTK_BINDING_SIGNAL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

