-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECFLOAT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecfloat_struct_set_minimum (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for minimum field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_set_minimum"
		}"
		end

	gparamspecfloat_struct_set_maximum (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for maximum field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_set_maximum"
		}"
		end

	gparamspecfloat_struct_set_default_value (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for default_value field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_set_default_value"
		}"
		end

	gparamspecfloat_struct_set_epsilon (a_structure: POINTER; a_value: REAL_32) is
			-- Setter for epsilon field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_set_epsilon"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecfloat_struct_get_minimum (a_structure: POINTER): REAL_32 is
			-- Query for minimum field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_get_minimum"
		}"
		end

	gparamspecfloat_struct_get_maximum (a_structure: POINTER): REAL_32 is
			-- Query for maximum field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_get_maximum"
		}"
		end

	gparamspecfloat_struct_get_default_value (a_structure: POINTER): REAL_32 is
			-- Query for default_value field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_get_default_value"
		}"
		end

	gparamspecfloat_struct_get_epsilon (a_structure: POINTER): REAL_32 is
			-- Query for epsilon field of GPARAMSPECFLOAT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecfloat_struct_get_epsilon"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecFloat"
		}"
		end

end -- class GPARAMSPECFLOAT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

