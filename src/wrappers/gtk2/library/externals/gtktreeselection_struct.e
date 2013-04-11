-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKTREESELECTION_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtktreeselection_struct_set_tree_view (a_structure: POINTER; a_value: POINTER) is
			-- Setter for tree_view field of GTKTREESELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_set_tree_view"
		}"
		end

	gtktreeselection_struct_set_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for type field of GTKTREESELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_set_type"
		}"
		end

	gtktreeselection_struct_set_user_func (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_func field of GTKTREESELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_set_user_func"
		}"
		end

	gtktreeselection_struct_set_user_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data field of GTKTREESELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_set_user_data"
		}"
		end

	gtktreeselection_struct_set_destroy (a_structure: POINTER; a_value: POINTER) is
			-- Setter for destroy field of GTKTREESELECTION_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_set_destroy"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtktreeselection_struct_get_tree_view (a_structure: POINTER): POINTER is
			-- Query for tree_view field of GTKTREESELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_get_tree_view"
		}"
		end

	gtktreeselection_struct_get_type (a_structure: POINTER): INTEGER is
			-- Query for type field of GTKTREESELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_get_type"
		}"
		end

	gtktreeselection_struct_get_user_func (a_structure: POINTER): POINTER is
			-- Query for user_func field of GTKTREESELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_get_user_func"
		}"
		end

	gtktreeselection_struct_get_user_data (a_structure: POINTER): POINTER is
			-- Query for user_data field of GTKTREESELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_get_user_data"
		}"
		end

	gtktreeselection_struct_get_destroy (a_structure: POINTER): POINTER is
			-- Query for destroy field of GTKTREESELECTION_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtktreeselection_struct_get_destroy"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeSelection"
		}"
		end

end -- class GTKTREESELECTION_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

