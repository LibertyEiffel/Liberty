-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMMULTICONTEXT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimmulticontext_struct_set_slave (a_structure: POINTER; a_value: POINTER) is
			-- Setter for slave field of GTKIMMULTICONTEXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimmulticontext_struct_set_slave"
		}"
		end

	gtkimmulticontext_struct_set_priv (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv field of GTKIMMULTICONTEXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimmulticontext_struct_set_priv"
		}"
		end

	gtkimmulticontext_struct_set_context_id (a_structure: POINTER; a_value: POINTER) is
			-- Setter for context_id field of GTKIMMULTICONTEXT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimmulticontext_struct_set_context_id"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field object.
	gtkimmulticontext_struct_get_slave (a_structure: POINTER): POINTER is
			-- Query for slave field of GTKIMMULTICONTEXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimmulticontext_struct_get_slave"
		}"
		end

	gtkimmulticontext_struct_get_priv (a_structure: POINTER): POINTER is
			-- Query for priv field of GTKIMMULTICONTEXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimmulticontext_struct_get_priv"
		}"
		end

	gtkimmulticontext_struct_get_context_id (a_structure: POINTER): POINTER is
			-- Query for context_id field of GTKIMMULTICONTEXT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimmulticontext_struct_get_context_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkIMMulticontext"
		}"
		end

end -- class GTKIMMULTICONTEXT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

