-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECLONG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspeclong_struct_set_minimum (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for minimum field of GPARAMSPECLONG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspeclong_struct_set_minimum"
		}"
		end

	gparamspeclong_struct_set_maximum (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for maximum field of GPARAMSPECLONG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspeclong_struct_set_maximum"
		}"
		end

	gparamspeclong_struct_set_default_value (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for default_value field of GPARAMSPECLONG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspeclong_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspeclong_struct_get_minimum (a_structure: POINTER): INTEGER_64 is
			-- Query for minimum field of GPARAMSPECLONG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspeclong_struct_get_minimum"
		}"
		end

	gparamspeclong_struct_get_maximum (a_structure: POINTER): INTEGER_64 is
			-- Query for maximum field of GPARAMSPECLONG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspeclong_struct_get_maximum"
		}"
		end

	gparamspeclong_struct_get_default_value (a_structure: POINTER): INTEGER_64 is
			-- Query for default_value field of GPARAMSPECLONG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspeclong_struct_get_default_value"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecLong"
		}"
		end

end -- class GPARAMSPECLONG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

