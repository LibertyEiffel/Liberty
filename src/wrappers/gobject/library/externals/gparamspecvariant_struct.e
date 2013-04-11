-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECVARIANT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecvariant_struct_set_type (a_structure: POINTER; a_value: POINTER) is
			-- Setter for type field of GPARAMSPECVARIANT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecvariant_struct_set_type"
		}"
		end

	gparamspecvariant_struct_set_default_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for default_value field of GPARAMSPECVARIANT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecvariant_struct_set_default_value"
		}"
		end

	gparamspecvariant_struct_set_padding (a_structure: POINTER; a_value: POINTER) is
			-- Setter for padding field of GPARAMSPECVARIANT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecvariant_struct_set_padding"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecvariant_struct_get_type (a_structure: POINTER): POINTER is
			-- Query for type field of GPARAMSPECVARIANT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecvariant_struct_get_type"
		}"
		end

	gparamspecvariant_struct_get_default_value (a_structure: POINTER): POINTER is
			-- Query for default_value field of GPARAMSPECVARIANT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecvariant_struct_get_default_value"
		}"
		end

	gparamspecvariant_struct_get_padding (a_structure: POINTER): POINTER is
			-- Query for padding field of GPARAMSPECVARIANT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecvariant_struct_get_padding"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecVariant"
		}"
		end

end -- class GPARAMSPECVARIANT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

