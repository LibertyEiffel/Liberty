-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKBINDINGSIGNAL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkbindingsignal_struct_set_next (a_structure: POINTER; a_value: POINTER) is
			-- Setter for next field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_set_next"
		}"
		end

	gtkbindingsignal_struct_set_signal_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for signal_name field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_set_signal_name"
		}"
		end

	gtkbindingsignal_struct_set_n_args (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_args field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_set_n_args"
		}"
		end

	gtkbindingsignal_struct_set_args (a_structure: POINTER; a_value: POINTER) is
			-- Setter for args field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_set_args"
		}"
		end

feature {} -- Low-level queries

	gtkbindingsignal_struct_get_next (a_structure: POINTER): POINTER is
			-- Query for next field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_get_next"
		}"
		end

	gtkbindingsignal_struct_get_signal_name (a_structure: POINTER): POINTER is
			-- Query for signal_name field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_get_signal_name"
		}"
		end

	gtkbindingsignal_struct_get_n_args (a_structure: POINTER): NATURAL_32 is
			-- Query for n_args field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_get_n_args"
		}"
		end

	gtkbindingsignal_struct_get_args (a_structure: POINTER): POINTER is
			-- Query for args field of GTKBINDINGSIGNAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkbindingsignal_struct_get_args"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkBindingSignal"
		}"
		end

end -- class GTKBINDINGSIGNAL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

