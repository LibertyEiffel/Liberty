-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECENUM_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecenum_struct_set_enum_class (a_structure: POINTER; a_value: POINTER) is
			-- Setter for enum_class field of GPARAMSPECENUM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecenum_struct_set_enum_class"
		}"
		end

	gparamspecenum_struct_set_default_value (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for default_value field of GPARAMSPECENUM_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecenum_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecenum_struct_get_enum_class (a_structure: POINTER): POINTER is
			-- Query for enum_class field of GPARAMSPECENUM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecenum_struct_get_enum_class"
		}"
		end

	gparamspecenum_struct_get_default_value (a_structure: POINTER): INTEGER_32 is
			-- Query for default_value field of GPARAMSPECENUM_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecenum_struct_get_default_value"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecEnum"
		}"
		end

end -- class GPARAMSPECENUM_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

