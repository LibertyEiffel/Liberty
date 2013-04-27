-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ACCEL_GROUP_ENTRY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_accel_group_entry_struct_set_closure (a_structure: POINTER; a_value: POINTER) is
			-- Setter for closure field of GTK_ACCEL_GROUP_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_entry_struct_set_closure"
		}"
		end

	gtk_accel_group_entry_struct_set_accel_path_quark (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for accel_path_quark field of GTK_ACCEL_GROUP_ENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_entry_struct_set_accel_path_quark"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field key.
	gtk_accel_group_entry_struct_get_closure (a_structure: POINTER): POINTER is
			-- Query for closure field of GTK_ACCEL_GROUP_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_entry_struct_get_closure"
		}"
		end

	gtk_accel_group_entry_struct_get_accel_path_quark (a_structure: POINTER): NATURAL is
			-- Query for accel_path_quark field of GTK_ACCEL_GROUP_ENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_entry_struct_get_accel_path_quark"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccelGroupEntry"
		}"
		end

end -- class GTK_ACCEL_GROUP_ENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

