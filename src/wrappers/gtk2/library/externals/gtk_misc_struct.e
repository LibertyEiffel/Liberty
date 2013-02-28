-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_MISC_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_misc_struct_set_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xalign field of GTK_MISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_set_xalign"
		}"
		end

	gtk_misc_struct_set_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yalign field of GTK_MISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_set_yalign"
		}"
		end

	gtk_misc_struct_set_xpad (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for xpad field of GTK_MISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_set_xpad"
		}"
		end

	gtk_misc_struct_set_ypad (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for ypad field of GTK_MISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_set_ypad"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtk_misc_struct_get_xalign (a_structure: POINTER): REAL_32 is
			-- Query for xalign field of GTK_MISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_get_xalign"
		}"
		end

	gtk_misc_struct_get_yalign (a_structure: POINTER): REAL_32 is
			-- Query for yalign field of GTK_MISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_get_yalign"
		}"
		end

	gtk_misc_struct_get_xpad (a_structure: POINTER): NATURAL_16 is
			-- Query for xpad field of GTK_MISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_get_xpad"
		}"
		end

	gtk_misc_struct_get_ypad (a_structure: POINTER): NATURAL_16 is
			-- Query for ypad field of GTK_MISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_misc_struct_get_ypad"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkMisc"
		}"
		end

end -- class GTK_MISC_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

