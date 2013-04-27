-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKIMCONTEXTSIMPLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkimcontextsimple_struct_set_tables (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tables field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_set_tables"
		}"
		end

	gtkimcontextsimple_struct_set_compose_buffer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for compose_buffer field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_set_compose_buffer"
		}"
		end

	gtkimcontextsimple_struct_set_tentative_match (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for tentative_match field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_set_tentative_match"
		}"
		end

	gtkimcontextsimple_struct_set_tentative_match_len (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for tentative_match_len field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_set_tentative_match_len"
		}"
		end

	gtkimcontextsimple_struct_set_in_hex_sequence (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for in_hex_sequence field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_set_in_hex_sequence"
		}"
		end

	gtkimcontextsimple_struct_set_modifiers_dropped (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for modifiers_dropped field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_set_modifiers_dropped"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field object.
	gtkimcontextsimple_struct_get_tables (a_structure: POINTER): POINTER is
			-- Query for tables field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_get_tables"
		}"
		end

	gtkimcontextsimple_struct_get_compose_buffer (a_structure: POINTER): POINTER is
			-- Query for compose_buffer field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_get_compose_buffer"
		}"
		end

	gtkimcontextsimple_struct_get_tentative_match (a_structure: POINTER): NATURAL_32 is
			-- Query for tentative_match field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_get_tentative_match"
		}"
		end

	gtkimcontextsimple_struct_get_tentative_match_len (a_structure: POINTER): INTEGER_32 is
			-- Query for tentative_match_len field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_get_tentative_match_len"
		}"
		end

	gtkimcontextsimple_struct_get_in_hex_sequence (a_structure: POINTER): NATURAL_32 is
			-- Query for in_hex_sequence field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_get_in_hex_sequence"
		}"
		end

	gtkimcontextsimple_struct_get_modifiers_dropped (a_structure: POINTER): NATURAL_32 is
			-- Query for modifiers_dropped field of GTKIMCONTEXTSIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkimcontextsimple_struct_get_modifiers_dropped"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkIMContextSimple"
		}"
		end

end -- class GTKIMCONTEXTSIMPLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

