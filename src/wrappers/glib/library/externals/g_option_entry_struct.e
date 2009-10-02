-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_OPTION_ENTRY_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	goptionentry_struct_set_long_name (a_structure: POINTER; a_value: POINTER) is
			-- Setter for long_name field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_long_name"
		}"
		end

	goptionentry_struct_set_short_name (a_structure: POINTER; a_value: CHARACTER) is
			-- Setter for short_name field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_short_name"
		}"
		end

	goptionentry_struct_set_flags (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for flags field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_flags"
		}"
		end

	goptionentry_struct_set_arg (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for arg field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_arg"
		}"
		end

	goptionentry_struct_set_arg_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for arg_data field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_arg_data"
		}"
		end

	goptionentry_struct_set_description (a_structure: POINTER; a_value: POINTER) is
			-- Setter for description field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_description"
		}"
		end

	goptionentry_struct_set_arg_description (a_structure: POINTER; a_value: POINTER) is
			-- Setter for arg_description field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_set_arg_description"
		}"
		end

feature {} -- Low-level queries

	goptionentry_struct_get_long_name (a_structure: POINTER): POINTER is
			-- Query for long_name field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_long_name"
		}"
		end

	goptionentry_struct_get_short_name (a_structure: POINTER): CHARACTER is
			-- Query for short_name field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_short_name"
		}"
		end

	goptionentry_struct_get_flags (a_structure: POINTER): INTEGER_32 is
			-- Query for flags field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_flags"
		}"
		end

	goptionentry_struct_get_arg (a_structure: POINTER): INTEGER_32 is
			-- Query for arg field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_arg"
		}"
		end

	goptionentry_struct_get_arg_data (a_structure: POINTER): POINTER is
			-- Query for arg_data field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_arg_data"
		}"
		end

	goptionentry_struct_get_description (a_structure: POINTER): POINTER is
			-- Query for description field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_description"
		}"
		end

	goptionentry_struct_get_arg_description (a_structure: POINTER): POINTER is
			-- Query for arg_description field of GOptionEntry structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "goptionentry_struct_get_arg_description"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GOptionEntry"
		}"
		end

end
