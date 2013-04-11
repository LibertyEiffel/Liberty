-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECFLAGS_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecflags_struct_set_flags_class (a_structure: POINTER; a_value: POINTER) is
			-- Setter for flags_class field of GPARAMSPECFLAGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecflags_struct_set_flags_class"
		}"
		end

	gparamspecflags_struct_set_default_value (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for default_value field of GPARAMSPECFLAGS_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecflags_struct_set_default_value"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecflags_struct_get_flags_class (a_structure: POINTER): POINTER is
			-- Query for flags_class field of GPARAMSPECFLAGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecflags_struct_get_flags_class"
		}"
		end

	gparamspecflags_struct_get_default_value (a_structure: POINTER): NATURAL_32 is
			-- Query for default_value field of GPARAMSPECFLAGS_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecflags_struct_get_default_value"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecFlags"
		}"
		end

end -- class GPARAMSPECFLAGS_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

