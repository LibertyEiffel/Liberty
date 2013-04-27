-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GOPTIONENTRY_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	goptionentry_struct_set_long_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for long_name field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_long_name"
		}"
		end

	goptionentry_struct_set_short_name (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for short_name field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_short_name"
		}"
		end

	goptionentry_struct_set_flags (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for flags field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_flags"
		}"
		end

	goptionentry_struct_set_arg (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for arg field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_arg"
		}"
		end

	goptionentry_struct_set_arg_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for arg_data field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_arg_data"
		}"
		end

	goptionentry_struct_set_description (a_structure: POINTER; a_value: POINTER) is
			-- Setter for description field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_description"
		}"
		end

	goptionentry_struct_set_arg_description (a_structure: POINTER; a_value: POINTER) is
			-- Setter for arg_description field of GOPTIONENTRY_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_set_arg_description"
		}"
		end

feature {} -- Low-level queries

	goptionentry_struct_get_long_name (a_structure: POINTER): POINTER is
			-- Query for long_name field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_long_name"
		}"
		end

	goptionentry_struct_get_short_name (a_structure: POINTER): CHARACTER is
			-- Query for short_name field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_short_name"
		}"
		end

	goptionentry_struct_get_flags (a_structure: POINTER): INTEGER_32 is
			-- Query for flags field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_flags"
		}"
		end

	goptionentry_struct_get_arg (a_structure: POINTER): INTEGER is
			-- Query for arg field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_arg"
		}"
		end

	goptionentry_struct_get_arg_data (a_structure: POINTER): POINTER is
			-- Query for arg_data field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_arg_data"
		}"
		end

	goptionentry_struct_get_description (a_structure: POINTER): POINTER is
			-- Query for description field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_description"
		}"
		end

	goptionentry_struct_get_arg_description (a_structure: POINTER): POINTER is
			-- Query for arg_description field of GOPTIONENTRY_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "goptionentry_struct_get_arg_description"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GOptionEntry"
		}"
		end

end -- class GOPTIONENTRY_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

