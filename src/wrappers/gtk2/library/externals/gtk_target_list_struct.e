-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_TARGET_LIST_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_target_list_struct_set_list (a_structure: POINTER; a_value: POINTER) is
			-- Setter for list field of GTK_TARGET_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_struct_set_list"
		}"
		end

	gtk_target_list_struct_set_ref_count (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for ref_count field of GTK_TARGET_LIST_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_struct_set_ref_count"
		}"
		end

feature {} -- Low-level queries

	gtk_target_list_struct_get_list (a_structure: POINTER): POINTER is
			-- Query for list field of GTK_TARGET_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_struct_get_list"
		}"
		end

	gtk_target_list_struct_get_ref_count (a_structure: POINTER): NATURAL is
			-- Query for ref_count field of GTK_TARGET_LIST_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_target_list_struct_get_ref_count"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkTargetList"
		}"
		end

end -- class GTK_TARGET_LIST_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

