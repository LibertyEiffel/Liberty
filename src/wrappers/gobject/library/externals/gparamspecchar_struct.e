-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECCHAR_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecchar_struct_set_minimum (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for minimum field of GPARAMSPECCHAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecchar_struct_set_minimum"
		}"
		end

	gparamspecchar_struct_set_maximum (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for maximum field of GPARAMSPECCHAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecchar_struct_set_maximum"
		}"
		end

	gparamspecchar_struct_set_default_value (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for default_value field of GPARAMSPECCHAR_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecchar_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecchar_struct_get_minimum (a_structure: POINTER): CHARACTER is
			-- Query for minimum field of GPARAMSPECCHAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecchar_struct_get_minimum"
		}"
		end

	gparamspecchar_struct_get_maximum (a_structure: POINTER): CHARACTER is
			-- Query for maximum field of GPARAMSPECCHAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecchar_struct_get_maximum"
		}"
		end

	gparamspecchar_struct_get_default_value (a_structure: POINTER): CHARACTER is
			-- Query for default_value field of GPARAMSPECCHAR_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecchar_struct_get_default_value"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecChar"
		}"
		end

end -- class GPARAMSPECCHAR_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

