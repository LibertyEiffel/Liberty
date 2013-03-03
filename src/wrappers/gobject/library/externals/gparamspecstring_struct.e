-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GPARAMSPECSTRING_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GOBJECT_TYPES
feature {} -- Low-level setters

	gparamspecstring_struct_set_default_value (a_structure: POINTER; a_value: POINTER) is
			-- Setter for default_value field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_set_default_value"
		}"
		end

	gparamspecstring_struct_set_cset_first (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cset_first field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_set_cset_first"
		}"
		end

	gparamspecstring_struct_set_cset_nth (a_structure: POINTER; a_value: POINTER) is
			-- Setter for cset_nth field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_set_cset_nth"
		}"
		end

	gparamspecstring_struct_set_substitutor (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for substitutor field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_set_substitutor"
		}"
		end

	gparamspecstring_struct_set_null_fold_if_empty (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for null_fold_if_empty field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_set_null_fold_if_empty"
		}"
		end

	gparamspecstring_struct_set_ensure_non_null (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for ensure_non_null field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_set_ensure_non_null"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent_instance.
	gparamspecstring_struct_get_default_value (a_structure: POINTER): POINTER is
			-- Query for default_value field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_get_default_value"
		}"
		end

	gparamspecstring_struct_get_cset_first (a_structure: POINTER): POINTER is
			-- Query for cset_first field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_get_cset_first"
		}"
		end

	gparamspecstring_struct_get_cset_nth (a_structure: POINTER): POINTER is
			-- Query for cset_nth field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_get_cset_nth"
		}"
		end

	gparamspecstring_struct_get_substitutor (a_structure: POINTER): CHARACTER is
			-- Query for substitutor field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_get_substitutor"
		}"
		end

	gparamspecstring_struct_get_null_fold_if_empty (a_structure: POINTER): NATURAL_32 is
			-- Query for null_fold_if_empty field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_get_null_fold_if_empty"
		}"
		end

	gparamspecstring_struct_get_ensure_non_null (a_structure: POINTER): NATURAL_32 is
			-- Query for ensure_non_null field of GPARAMSPECSTRING_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gparamspecstring_struct_get_ensure_non_null"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GParamSpecString"
		}"
		end

end -- class GPARAMSPECSTRING_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

