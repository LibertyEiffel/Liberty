-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ALIGNMENT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_alignment_struct_set_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xalign field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_set_xalign"
		}"
		end

	gtk_alignment_struct_set_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yalign field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_set_yalign"
		}"
		end

	gtk_alignment_struct_set_xscale (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xscale field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_set_xscale"
		}"
		end

	gtk_alignment_struct_set_yscale (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yscale field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_set_yscale"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field bin.
	gtk_alignment_struct_get_xalign (a_structure: POINTER): REAL_32 is
			-- Query for xalign field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_get_xalign"
		}"
		end

	gtk_alignment_struct_get_yalign (a_structure: POINTER): REAL_32 is
			-- Query for yalign field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_get_yalign"
		}"
		end

	gtk_alignment_struct_get_xscale (a_structure: POINTER): REAL_32 is
			-- Query for xscale field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_get_xscale"
		}"
		end

	gtk_alignment_struct_get_yscale (a_structure: POINTER): REAL_32 is
			-- Query for yscale field of GTK_ALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_alignment_struct_get_yscale"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAlignment"
		}"
		end

end -- class GTK_ALIGNMENT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

