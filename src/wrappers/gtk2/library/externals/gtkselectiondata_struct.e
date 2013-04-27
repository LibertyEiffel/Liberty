-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSELECTIONDATA_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkselectiondata_struct_set_selection (a_structure: POINTER; a_value: POINTER) is
			-- Setter for selection field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_selection"
		}"
		end

	gtkselectiondata_struct_set_target (a_structure: POINTER; a_value: POINTER) is
			-- Setter for target field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_target"
		}"
		end

	gtkselectiondata_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_type"
		}"
		end

	gtkselectiondata_struct_set_format (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for format field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_format"
		}"
		end

	gtkselectiondata_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_data"
		}"
		end

	gtkselectiondata_struct_set_length (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for length field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_length"
		}"
		end

	gtkselectiondata_struct_set_display (a_structure: POINTER; a_value: POINTER) is
			-- Setter for display field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_set_display"
		}"
		end

feature {} -- Low-level queries

	gtkselectiondata_struct_get_selection (a_structure: POINTER): POINTER is
			-- Query for selection field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_selection"
		}"
		end

	gtkselectiondata_struct_get_target (a_structure: POINTER): POINTER is
			-- Query for target field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_target"
		}"
		end

	gtkselectiondata_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_type"
		}"
		end

	gtkselectiondata_struct_get_format (a_structure: POINTER): INTEGER_32 is
			-- Query for format field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_format"
		}"
		end

	gtkselectiondata_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_data"
		}"
		end

	gtkselectiondata_struct_get_length (a_structure: POINTER): INTEGER_32 is
			-- Query for length field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_length"
		}"
		end

	gtkselectiondata_struct_get_display (a_structure: POINTER): POINTER is
			-- Query for display field of GTKSELECTIONDATA_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkselectiondata_struct_get_display"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkSelectionData"
		}"
		end

end -- class GTKSELECTIONDATA_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

