-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GMEMVTABLE_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gmemvtable_struct_set_malloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for malloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_set_malloc"
		}"
		end

	gmemvtable_struct_set_realloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for realloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_set_realloc"
		}"
		end

	gmemvtable_struct_set_free (a_structure: POINTER; a_value: POINTER) is
			-- Setter for free field of GMEMVTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_set_free"
		}"
		end

	gmemvtable_struct_set_calloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for calloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_set_calloc"
		}"
		end

	gmemvtable_struct_set_try_malloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for try_malloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_set_try_malloc"
		}"
		end

	gmemvtable_struct_set_try_realloc (a_structure: POINTER; a_value: POINTER) is
			-- Setter for try_realloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_set_try_realloc"
		}"
		end

feature {} -- Low-level queries

	gmemvtable_struct_get_malloc (a_structure: POINTER): POINTER is
			-- Query for malloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_get_malloc"
		}"
		end

	gmemvtable_struct_get_realloc (a_structure: POINTER): POINTER is
			-- Query for realloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_get_realloc"
		}"
		end

	gmemvtable_struct_get_free (a_structure: POINTER): POINTER is
			-- Query for free field of GMEMVTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_get_free"
		}"
		end

	gmemvtable_struct_get_calloc (a_structure: POINTER): POINTER is
			-- Query for calloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_get_calloc"
		}"
		end

	gmemvtable_struct_get_try_malloc (a_structure: POINTER): POINTER is
			-- Query for try_malloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_get_try_malloc"
		}"
		end

	gmemvtable_struct_get_try_realloc (a_structure: POINTER): POINTER is
			-- Query for try_realloc field of GMEMVTABLE_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gmemvtable_struct_get_try_realloc"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GMemVTable"
		}"
		end

end -- class GMEMVTABLE_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

