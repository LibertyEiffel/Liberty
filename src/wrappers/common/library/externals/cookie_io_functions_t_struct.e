-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class COOKIE_IO_FUNCTIONS_T_STRUCT

inherit ANY undefine is_equal, copy end

insert STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

	cookie_io_functions_t_struct_set_read (a_structure: POINTER; a_value: POINTER) is
			-- Setter for read field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_set_read"
		}"
		end

	cookie_io_functions_t_struct_set_write (a_structure: POINTER; a_value: POINTER) is
			-- Setter for write field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_set_write"
		}"
		end

	cookie_io_functions_t_struct_set_seek (a_structure: POINTER; a_value: POINTER) is
			-- Setter for seek field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_set_seek"
		}"
		end

	cookie_io_functions_t_struct_set_close (a_structure: POINTER; a_value: POINTER) is
			-- Setter for close field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_set_close"
		}"
		end

feature {} -- Low-level queries

	cookie_io_functions_t_struct_get_read (a_structure: POINTER): POINTER is
			-- Query for read field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_get_read"
		}"
		end

	cookie_io_functions_t_struct_get_write (a_structure: POINTER): POINTER is
			-- Query for write field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_get_write"
		}"
		end

	cookie_io_functions_t_struct_get_seek (a_structure: POINTER): POINTER is
			-- Query for seek field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_get_seek"
		}"
		end

	cookie_io_functions_t_struct_get_close (a_structure: POINTER): POINTER is
			-- Query for close field of COOKIE_IO_FUNCTIONS_T_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cookie_io_functions_t_struct_get_close"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__IO_cookie_io_functions_t"
		}"
		end

end -- class COOKIE_IO_FUNCTIONS_T_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

