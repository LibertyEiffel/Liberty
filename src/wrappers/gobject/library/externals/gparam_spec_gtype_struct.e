-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAM_SPEC_GTYPE_STRUCT

inherit ANY undefine is_equal, copy end

insert GOBJECT_TYPES
feature {} -- Low-level setters

	gparam_spec_gtype_struct_set_is_a_type (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for is_a_type field of GPARAM_SPEC_GTYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_gtype_struct_set_is_a_type"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparam_spec_gtype_struct_get_is_a_type (a_structure: POINTER): NATURAL_32 is
			-- Query for is_a_type field of GPARAM_SPEC_GTYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparam_spec_gtype_struct_get_is_a_type"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecGType"
		}"
		end

end -- class GPARAM_SPEC_GTYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

