-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAM_SPEC_VALUE_ARRAY_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gparam_spec_value_array_struct_set_element_spec (a_structure: POINTER; a_value: POINTER) is
			-- Setter for element_spec field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_value_array_struct_set_element_spec"
		}"
		end

	gparam_spec_value_array_struct_set_fixed_n_elements (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for fixed_n_elements field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_value_array_struct_set_fixed_n_elements"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparam_spec_value_array_struct_get_element_spec (a_structure: POINTER): POINTER is
			-- Query for element_spec field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_value_array_struct_get_element_spec"
		}"
		end

	gparam_spec_value_array_struct_get_fixed_n_elements (a_structure: POINTER): NATURAL_32 is
			-- Query for fixed_n_elements field of GPARAM_SPEC_VALUE_ARRAY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_value_array_struct_get_fixed_n_elements"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecValueArray"
		}"
		end

end -- class GPARAM_SPEC_VALUE_ARRAY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

