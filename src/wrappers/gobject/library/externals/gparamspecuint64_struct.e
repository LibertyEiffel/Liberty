-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECUINT64_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecuint64_struct_set_minimum (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for minimum field of GPARAMSPECUINT64_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuint64_struct_set_minimum"
		}"
		end

	gparamspecuint64_struct_set_maximum (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for maximum field of GPARAMSPECUINT64_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuint64_struct_set_maximum"
		}"
		end

	gparamspecuint64_struct_set_default_value (a_structure: POINTER; a_value: NATURAL_64) is
			-- Setter for default_value field of GPARAMSPECUINT64_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuint64_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecuint64_struct_get_minimum (a_structure: POINTER): NATURAL_64 is
			-- Query for minimum field of GPARAMSPECUINT64_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuint64_struct_get_minimum"
		}"
		end

	gparamspecuint64_struct_get_maximum (a_structure: POINTER): NATURAL_64 is
			-- Query for maximum field of GPARAMSPECUINT64_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuint64_struct_get_maximum"
		}"
		end

	gparamspecuint64_struct_get_default_value (a_structure: POINTER): NATURAL_64 is
			-- Query for default_value field of GPARAMSPECUINT64_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuint64_struct_get_default_value"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecUInt64"
		}"
		end

end -- class GPARAMSPECUINT64_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

