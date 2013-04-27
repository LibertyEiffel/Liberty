-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTK_ACCEL_KEY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtk_accel_key_struct_set_accel_key (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for accel_key field of GTK_ACCEL_KEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_key_struct_set_accel_key"
		}"
		end

	gtk_accel_key_struct_set_accel_mods (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for accel_mods field of GTK_ACCEL_KEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_key_struct_set_accel_mods"
		}"
		end

	gtk_accel_key_struct_set_accel_flags (a_structure: POINTER; a_value: NATURAL) is
			-- Setter for accel_flags field of GTK_ACCEL_KEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_key_struct_set_accel_flags"
		}"
		end

feature {} -- Low-level queries

	gtk_accel_key_struct_get_accel_key (a_structure: POINTER): NATURAL is
			-- Query for accel_key field of GTK_ACCEL_KEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_key_struct_get_accel_key"
		}"
		end

	gtk_accel_key_struct_get_accel_mods (a_structure: POINTER): INTEGER is
			-- Query for accel_mods field of GTK_ACCEL_KEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_key_struct_get_accel_mods"
		}"
		end

	gtk_accel_key_struct_get_accel_flags (a_structure: POINTER): NATURAL is
			-- Query for accel_flags field of GTK_ACCEL_KEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_accel_key_struct_get_accel_flags"
		}"
		end

feature -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccelKey"
		}"
		end

end -- class GTK_ACCEL_KEY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

