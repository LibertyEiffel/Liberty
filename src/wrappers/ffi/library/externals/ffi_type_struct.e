-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FFI_TYPE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	FFI_TYPES
feature {} -- Low-level setters

	ffi_type_struct_set_size (a_structure: POINTER; a_value: like size_t) is
			-- Setter for size field of FFI_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_set_size"
		}"
		end

	ffi_type_struct_set_alignment (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for alignment field of FFI_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_set_alignment"
		}"
		end

	ffi_type_struct_set_type (a_structure: POINTER; a_value: NATURAL_16) is
			-- Setter for type field of FFI_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_set_type"
		}"
		end

	ffi_type_struct_set_elements (a_structure: POINTER; a_value: POINTER) is
			-- Setter for elements field of FFI_TYPE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_set_elements"
		}"
		end

feature {} -- Low-level queries

	ffi_type_struct_get_size (a_structure: POINTER): like size_t is
			-- Query for size field of FFI_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_get_size"
		}"
		end

	ffi_type_struct_get_alignment (a_structure: POINTER): NATURAL_16 is
			-- Query for alignment field of FFI_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_get_alignment"
		}"
		end

	ffi_type_struct_get_type (a_structure: POINTER): NATURAL_16 is
			-- Query for type field of FFI_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_get_type"
		}"
		end

	ffi_type_struct_get_elements (a_structure: POINTER): POINTER is
			-- Query for elements field of FFI_TYPE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "ffi_type_struct_get_elements"
		}"
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__ffi_type"
		}"
		end

end -- class FFI_TYPE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

