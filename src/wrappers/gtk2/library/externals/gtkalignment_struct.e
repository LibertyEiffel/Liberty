-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKALIGNMENT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkalignment_struct_set_xalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xalign field of GTKALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_set_xalign"
		}"
		end

	gtkalignment_struct_set_yalign (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yalign field of GTKALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_set_yalign"
		}"
		end

	gtkalignment_struct_set_xscale (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for xscale field of GTKALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_set_xscale"
		}"
		end

	gtkalignment_struct_set_yscale (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for yscale field of GTKALIGNMENT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_set_yscale"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field bin.
	gtkalignment_struct_get_xalign (a_structure: POINTER): REAL_32 is
			-- Query for xalign field of GTKALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_get_xalign"
		}"
		end

	gtkalignment_struct_get_yalign (a_structure: POINTER): REAL_32 is
			-- Query for yalign field of GTKALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_get_yalign"
		}"
		end

	gtkalignment_struct_get_xscale (a_structure: POINTER): REAL_32 is
			-- Query for xscale field of GTKALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_get_xscale"
		}"
		end

	gtkalignment_struct_get_yscale (a_structure: POINTER): REAL_32 is
			-- Query for yscale field of GTKALIGNMENT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkalignment_struct_get_yscale"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAlignment"
		}"
		end

end -- class GTKALIGNMENT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

