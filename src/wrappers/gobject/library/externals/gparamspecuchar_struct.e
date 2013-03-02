-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECUCHAR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecuchar_struct_set_minimum (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for minimum field of GPARAMSPECUCHAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuchar_struct_set_minimum"
		}"
		end

	gparamspecuchar_struct_set_maximum (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for maximum field of GPARAMSPECUCHAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuchar_struct_set_maximum"
		}"
		end

	gparamspecuchar_struct_set_default_value (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for default_value field of GPARAMSPECUCHAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuchar_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecuchar_struct_get_minimum (a_structure: POINTER): CHARACTER is
			-- Query for minimum field of GPARAMSPECUCHAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuchar_struct_get_minimum"
		}"
		end

	gparamspecuchar_struct_get_maximum (a_structure: POINTER): CHARACTER is
			-- Query for maximum field of GPARAMSPECUCHAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuchar_struct_get_maximum"
		}"
		end

	gparamspecuchar_struct_get_default_value (a_structure: POINTER): CHARACTER is
			-- Query for default_value field of GPARAMSPECUCHAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecuchar_struct_get_default_value"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecUChar"
		}"
		end

end -- class GPARAMSPECUCHAR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

