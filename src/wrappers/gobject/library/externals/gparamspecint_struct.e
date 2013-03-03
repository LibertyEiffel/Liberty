-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECINT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecint_struct_set_minimum (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for minimum field of GPARAMSPECINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecint_struct_set_minimum"
		}"
		end

	gparamspecint_struct_set_maximum (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for maximum field of GPARAMSPECINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecint_struct_set_maximum"
		}"
		end

	gparamspecint_struct_set_default_value (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for default_value field of GPARAMSPECINT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecint_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecint_struct_get_minimum (a_structure: POINTER): INTEGER_32 is
			-- Query for minimum field of GPARAMSPECINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecint_struct_get_minimum"
		}"
		end

	gparamspecint_struct_get_maximum (a_structure: POINTER): INTEGER_32 is
			-- Query for maximum field of GPARAMSPECINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecint_struct_get_maximum"
		}"
		end

	gparamspecint_struct_get_default_value (a_structure: POINTER): INTEGER_32 is
			-- Query for default_value field of GPARAMSPECINT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecint_struct_get_default_value"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecInt"
		}"
		end

end -- class GPARAMSPECINT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

