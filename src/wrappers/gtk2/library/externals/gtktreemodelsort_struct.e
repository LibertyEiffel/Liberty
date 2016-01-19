-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREEMODELSORT_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktreemodelsort_struct_set_root (a_structure: POINTER; a_value: POINTER) is
			-- Setter for root field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_root"
		}"
		end

	gtktreemodelsort_struct_set_stamp (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for stamp field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_stamp"
		}"
		end

	gtktreemodelsort_struct_set_child_flags (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for child_flags field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_child_flags"
		}"
		end

	gtktreemodelsort_struct_set_child_model (a_structure: POINTER; a_value: POINTER) is
			-- Setter for child_model field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_child_model"
		}"
		end

	gtktreemodelsort_struct_set_zero_ref_count (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for zero_ref_count field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_zero_ref_count"
		}"
		end

	gtktreemodelsort_struct_set_sort_list (a_structure: POINTER; a_value: POINTER) is
			-- Setter for sort_list field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_sort_list"
		}"
		end

	gtktreemodelsort_struct_set_sort_column_id (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for sort_column_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_sort_column_id"
		}"
		end

	gtktreemodelsort_struct_set_order (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for order field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_order"
		}"
		end

	gtktreemodelsort_struct_set_default_sort_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for default_sort_func field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_default_sort_func"
		}"
		end

	gtktreemodelsort_struct_set_default_sort_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for default_sort_data field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_default_sort_data"
		}"
		end

	gtktreemodelsort_struct_set_default_sort_destroy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for default_sort_destroy field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_default_sort_destroy"
		}"
		end

	gtktreemodelsort_struct_set_changed_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for changed_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_changed_id"
		}"
		end

	gtktreemodelsort_struct_set_inserted_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for inserted_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_inserted_id"
		}"
		end

	gtktreemodelsort_struct_set_has_child_toggled_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for has_child_toggled_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_has_child_toggled_id"
		}"
		end

	gtktreemodelsort_struct_set_deleted_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for deleted_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_deleted_id"
		}"
		end

	gtktreemodelsort_struct_set_reordered_id (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for reordered_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_set_reordered_id"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtktreemodelsort_struct_get_root (a_structure: POINTER): POINTER is
			-- Query for root field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_root"
		}"
		end

	gtktreemodelsort_struct_get_stamp (a_structure: POINTER): INTEGER_32 is
			-- Query for stamp field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_stamp"
		}"
		end

	gtktreemodelsort_struct_get_child_flags (a_structure: POINTER): NATURAL_32 is
			-- Query for child_flags field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_child_flags"
		}"
		end

	gtktreemodelsort_struct_get_child_model (a_structure: POINTER): POINTER is
			-- Query for child_model field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_child_model"
		}"
		end

	gtktreemodelsort_struct_get_zero_ref_count (a_structure: POINTER): INTEGER_32 is
			-- Query for zero_ref_count field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_zero_ref_count"
		}"
		end

	gtktreemodelsort_struct_get_sort_list (a_structure: POINTER): POINTER is
			-- Query for sort_list field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_sort_list"
		}"
		end

	gtktreemodelsort_struct_get_sort_column_id (a_structure: POINTER): INTEGER_32 is
			-- Query for sort_column_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_sort_column_id"
		}"
		end

	gtktreemodelsort_struct_get_order (a_structure: POINTER): INTEGER is
			-- Query for order field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_order"
		}"
		end

	gtktreemodelsort_struct_get_default_sort_func (a_structure: POINTER): POINTER is
			-- Query for default_sort_func field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_default_sort_func"
		}"
		end

	gtktreemodelsort_struct_get_default_sort_data (a_structure: POINTER): POINTER is
			-- Query for default_sort_data field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_default_sort_data"
		}"
		end

	gtktreemodelsort_struct_get_default_sort_destroy (a_structure: POINTER): POINTER is
			-- Query for default_sort_destroy field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_default_sort_destroy"
		}"
		end

	gtktreemodelsort_struct_get_changed_id (a_structure: POINTER): NATURAL_32 is
			-- Query for changed_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_changed_id"
		}"
		end

	gtktreemodelsort_struct_get_inserted_id (a_structure: POINTER): NATURAL_32 is
			-- Query for inserted_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_inserted_id"
		}"
		end

	gtktreemodelsort_struct_get_has_child_toggled_id (a_structure: POINTER): NATURAL_32 is
			-- Query for has_child_toggled_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_has_child_toggled_id"
		}"
		end

	gtktreemodelsort_struct_get_deleted_id (a_structure: POINTER): NATURAL_32 is
			-- Query for deleted_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_deleted_id"
		}"
		end

	gtktreemodelsort_struct_get_reordered_id (a_structure: POINTER): NATURAL_32 is
			-- Query for reordered_id field of GTKTREEMODELSORT_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreemodelsort_struct_get_reordered_id"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeModelSort"
		}"
		end

end -- class GTKTREEMODELSORT_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

