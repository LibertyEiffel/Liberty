-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ACCEL_GROUP_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_accel_group_struct_set_lock_count (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for lock_count field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_set_lock_count"
		}"
		end

	gtk_accel_group_struct_set_modifier_mask (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for modifier_mask field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_set_modifier_mask"
		}"
		end

	gtk_accel_group_struct_set_acceleratables (a_structure: POINTER; a_value: POINTER) is
			-- Setter for acceleratables field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_set_acceleratables"
		}"
		end

	gtk_accel_group_struct_set_n_accels (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for n_accels field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_set_n_accels"
		}"
		end

	gtk_accel_group_struct_set_priv_accels (a_structure: POINTER; a_value: POINTER) is
			-- Setter for priv_accels field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_set_priv_accels"
		}"
		end

feature {} -- Low-level queries

	-- Unwrappable field parent.
	gtk_accel_group_struct_get_lock_count (a_structure: POINTER): NATURAL is
			-- Query for lock_count field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_get_lock_count"
		}"
		end

	gtk_accel_group_struct_get_modifier_mask (a_structure: POINTER): INTEGER is
			-- Query for modifier_mask field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_get_modifier_mask"
		}"
		end

	gtk_accel_group_struct_get_acceleratables (a_structure: POINTER): POINTER is
			-- Query for acceleratables field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_get_acceleratables"
		}"
		end

	gtk_accel_group_struct_get_n_accels (a_structure: POINTER): NATURAL is
			-- Query for n_accels field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_get_n_accels"
		}"
		end

	gtk_accel_group_struct_get_priv_accels (a_structure: POINTER): POINTER is
			-- Query for priv_accels field of GTK_ACCEL_GROUP_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_group_struct_get_priv_accels"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccelGroup"
		}"
		end

end -- class GTK_ACCEL_GROUP_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

