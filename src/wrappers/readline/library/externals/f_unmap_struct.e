-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class F_UNMAP_STRUCT

inherit ANY undefine is_equal, copy end

insert READLINE_TYPES
feature {} -- Low-level setters

	f_unmap_struct_set_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for name field of F_UNMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "f_unmap_struct_set_name"
		}"
		end

	f_unmap_struct_set_function (a_structure: POINTER; a_value: POINTER) is
			-- Setter for function field of F_UNMAP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "f_unmap_struct_set_function"
		}"
		end

feature {} -- Low-level queries

	f_unmap_struct_get_name (a_structure: POINTER): POINTER is
			-- Query for name field of F_UNMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "f_unmap_struct_get_name"
		}"
		end

	f_unmap_struct_get_function (a_structure: POINTER): POINTER is
			-- Query for function field of F_UNMAP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "f_unmap_struct_get_function"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__funmap"
		}"
		end

end -- class F_UNMAP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

