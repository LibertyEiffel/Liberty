-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKMISC_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkmisc_struct_set_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xalign field of GTKMISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_set_xalign"
		}"
		end

	gtkmisc_struct_set_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yalign field of GTKMISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_set_yalign"
		}"
		end

	gtkmisc_struct_set_xpad (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for xpad field of GTKMISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_set_xpad"
		}"
		end

	gtkmisc_struct_set_ypad (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for ypad field of GTKMISC_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_set_ypad"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field widget.
	gtkmisc_struct_get_xalign (a_structure: POINTER): REAL_32 is
			-- Query for xalign field of GTKMISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_get_xalign"
		}"
		end

	gtkmisc_struct_get_yalign (a_structure: POINTER): REAL_32 is
			-- Query for yalign field of GTKMISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_get_yalign"
		}"
		end

	gtkmisc_struct_get_xpad (a_structure: POINTER): NATURAL_16 is
			-- Query for xpad field of GTKMISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_get_xpad"
		}"
		end

	gtkmisc_struct_get_ypad (a_structure: POINTER): NATURAL_16 is
			-- Query for ypad field of GTKMISC_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkmisc_struct_get_ypad"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkMisc"
		}"
		end

end -- class GTKMISC_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

