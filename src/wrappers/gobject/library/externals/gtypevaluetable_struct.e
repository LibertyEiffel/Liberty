-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTYPEVALUETABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gtypevaluetable_struct_set_value_init (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_init field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_value_init"
		}"
		end

	gtypevaluetable_struct_set_value_free (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_free field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_value_free"
		}"
		end

	gtypevaluetable_struct_set_value_copy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_copy field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_value_copy"
		}"
		end

	gtypevaluetable_struct_set_value_peek_pointer (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_peek_pointer field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_value_peek_pointer"
		}"
		end

	gtypevaluetable_struct_set_collect_format (a_structure: POINTER; a_value: POINTER) is
			-- Setter for collect_format field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_collect_format"
		}"
		end

	gtypevaluetable_struct_set_collect_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for collect_value field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_collect_value"
		}"
		end

	gtypevaluetable_struct_set_lcopy_format (a_structure: POINTER; a_value: POINTER) is
			-- Setter for lcopy_format field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_lcopy_format"
		}"
		end

	gtypevaluetable_struct_set_lcopy_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for lcopy_value field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_set_lcopy_value"
		}"
		end

feature {} -- Low-level queries

	gtypevaluetable_struct_get_value_init (a_structure: POINTER): POINTER is
			-- Query for value_init field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_value_init"
		}"
		end

	gtypevaluetable_struct_get_value_free (a_structure: POINTER): POINTER is
			-- Query for value_free field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_value_free"
		}"
		end

	gtypevaluetable_struct_get_value_copy (a_structure: POINTER): POINTER is
			-- Query for value_copy field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_value_copy"
		}"
		end

	gtypevaluetable_struct_get_value_peek_pointer (a_structure: POINTER): POINTER is
			-- Query for value_peek_pointer field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_value_peek_pointer"
		}"
		end

	gtypevaluetable_struct_get_collect_format (a_structure: POINTER): POINTER is
			-- Query for collect_format field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_collect_format"
		}"
		end

	gtypevaluetable_struct_get_collect_value (a_structure: POINTER): POINTER is
			-- Query for collect_value field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_collect_value"
		}"
		end

	gtypevaluetable_struct_get_lcopy_format (a_structure: POINTER): POINTER is
			-- Query for lcopy_format field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_lcopy_format"
		}"
		end

	gtypevaluetable_struct_get_lcopy_value (a_structure: POINTER): POINTER is
			-- Query for lcopy_value field of GTYPEVALUETABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtypevaluetable_struct_get_lcopy_value"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTypeValueTable"
		}"
		end

end -- class GTYPEVALUETABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

