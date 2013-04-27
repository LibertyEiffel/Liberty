-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TREE_ITER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_tree_iter_struct_set_stamp (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for stamp field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_set_stamp"
		}"
		end

	gtk_tree_iter_struct_set_user_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_set_user_data"
		}"
		end

	gtk_tree_iter_struct_set_user_data2 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data2 field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_set_user_data2"
		}"
		end

	gtk_tree_iter_struct_set_user_data3 (a_structure: POINTER; a_value: POINTER) is
			-- Setter for user_data3 field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_set_user_data3"
		}"
		end

feature {} -- Low-level queries

	gtk_tree_iter_struct_get_stamp (a_structure: POINTER): INTEGER is
			-- Query for stamp field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_get_stamp"
		}"
		end

	gtk_tree_iter_struct_get_user_data (a_structure: POINTER): POINTER is
			-- Query for user_data field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_get_user_data"
		}"
		end

	gtk_tree_iter_struct_get_user_data2 (a_structure: POINTER): POINTER is
			-- Query for user_data2 field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_get_user_data2"
		}"
		end

	gtk_tree_iter_struct_get_user_data3 (a_structure: POINTER): POINTER is
			-- Query for user_data3 field of GTK_TREE_ITER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_tree_iter_struct_get_user_data3"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTreeIter"
		}"
		end

end -- class GTK_TREE_ITER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

