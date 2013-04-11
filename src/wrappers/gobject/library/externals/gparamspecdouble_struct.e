-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECDOUBLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecdouble_struct_set_minimum (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for minimum field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_set_minimum"
		}"
		end

	gparamspecdouble_struct_set_maximum (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for maximum field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_set_maximum"
		}"
		end

	gparamspecdouble_struct_set_default_value (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for default_value field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_set_default_value"
		}"
		end

	gparamspecdouble_struct_set_epsilon (a_structure: POINTER; a_value: REAL_64) is
			-- Setter for epsilon field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_set_epsilon"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecdouble_struct_get_minimum (a_structure: POINTER): REAL_64 is
			-- Query for minimum field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_get_minimum"
		}"
		end

	gparamspecdouble_struct_get_maximum (a_structure: POINTER): REAL_64 is
			-- Query for maximum field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_get_maximum"
		}"
		end

	gparamspecdouble_struct_get_default_value (a_structure: POINTER): REAL_64 is
			-- Query for default_value field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_get_default_value"
		}"
		end

	gparamspecdouble_struct_get_epsilon (a_structure: POINTER): REAL_64 is
			-- Query for epsilon field of GPARAMSPECDOUBLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecdouble_struct_get_epsilon"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecDouble"
		}"
		end

end -- class GPARAMSPECDOUBLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

