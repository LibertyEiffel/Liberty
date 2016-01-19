-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_IMCONTEXT_SIMPLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_imcontext_simple_struct_set_tables (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tables field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_set_tables"
		}"
		end

	gtk_imcontext_simple_struct_set_compose_buffer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for compose_buffer field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_set_compose_buffer"
		}"
		end

	gtk_imcontext_simple_struct_set_tentative_match (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for tentative_match field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_set_tentative_match"
		}"
		end

	gtk_imcontext_simple_struct_set_tentative_match_len (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for tentative_match_len field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_set_tentative_match_len"
		}"
		end

	gtk_imcontext_simple_struct_set_in_hex_sequence (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for in_hex_sequence field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_set_in_hex_sequence"
		}"
		end

	gtk_imcontext_simple_struct_set_modifiers_dropped (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for modifiers_dropped field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_set_modifiers_dropped"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field object.
	gtk_imcontext_simple_struct_get_tables (a_structure: POINTER): POINTER is
			-- Query for tables field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_get_tables"
		}"
		end

	gtk_imcontext_simple_struct_get_compose_buffer (a_structure: POINTER): POINTER is
			-- Query for compose_buffer field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_get_compose_buffer"
		}"
		end

	gtk_imcontext_simple_struct_get_tentative_match (a_structure: POINTER): NATURAL is
			-- Query for tentative_match field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_get_tentative_match"
		}"
		end

	gtk_imcontext_simple_struct_get_tentative_match_len (a_structure: POINTER): INTEGER is
			-- Query for tentative_match_len field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_get_tentative_match_len"
		}"
		end

	gtk_imcontext_simple_struct_get_in_hex_sequence (a_structure: POINTER): NATURAL is
			-- Query for in_hex_sequence field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_get_in_hex_sequence"
		}"
		end

	gtk_imcontext_simple_struct_get_modifiers_dropped (a_structure: POINTER): NATURAL is
			-- Query for modifiers_dropped field of GTK_IMCONTEXT_SIMPLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_imcontext_simple_struct_get_modifiers_dropped"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkIMContextSimple"
		}"
		end

end -- class GTK_IMCONTEXT_SIMPLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

