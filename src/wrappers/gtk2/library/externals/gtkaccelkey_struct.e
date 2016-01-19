-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKACCELKEY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GTK_TYPES
feature {} -- Low-level setters

	gtkaccelkey_struct_set_accel_key (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for accel_key field of GTKACCELKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelkey_struct_set_accel_key"
		}"
		end

	gtkaccelkey_struct_set_accel_mods (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for accel_mods field of GTKACCELKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelkey_struct_set_accel_mods"
		}"
		end

	gtkaccelkey_struct_set_accel_flags (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for accel_flags field of GTKACCELKEY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelkey_struct_set_accel_flags"
		}"
		end

feature {} -- Low-level queries

	gtkaccelkey_struct_get_accel_key (a_structure: POINTER): NATURAL_32 is
			-- Query for accel_key field of GTKACCELKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelkey_struct_get_accel_key"
		}"
		end

	gtkaccelkey_struct_get_accel_mods (a_structure: POINTER): INTEGER is
			-- Query for accel_mods field of GTKACCELKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelkey_struct_get_accel_mods"
		}"
		end

	gtkaccelkey_struct_get_accel_flags (a_structure: POINTER): NATURAL_32 is
			-- Query for accel_flags field of GTKACCELKEY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtkaccelkey_struct_get_accel_flags"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GtkAccelKey"
		}"
		end

end -- class GTKACCELKEY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

