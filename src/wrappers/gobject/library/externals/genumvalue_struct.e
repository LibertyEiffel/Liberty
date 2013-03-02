-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GENUMVALUE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	genumvalue_struct_set_value (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for value field of GENUMVALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genumvalue_struct_set_value"
		}"
		end

	genumvalue_struct_set_value_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_name field of GENUMVALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genumvalue_struct_set_value_name"
		}"
		end

	genumvalue_struct_set_value_nick (a_structure: POINTER; a_value: POINTER) is
			-- Setter for value_nick field of GENUMVALUE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genumvalue_struct_set_value_nick"
		}"
		end

feature {} -- Low-level queries

	genumvalue_struct_get_value (a_structure: POINTER): INTEGER_32 is
			-- Query for value field of GENUMVALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genumvalue_struct_get_value"
		}"
		end

	genumvalue_struct_get_value_name (a_structure: POINTER): POINTER is
			-- Query for value_name field of GENUMVALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genumvalue_struct_get_value_name"
		}"
		end

	genumvalue_struct_get_value_nick (a_structure: POINTER): POINTER is
			-- Query for value_nick field of GENUMVALUE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "genumvalue_struct_get_value_nick"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GEnumValue"
		}"
		end

end -- class GENUMVALUE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

