-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class FD_SET_STRUCT

inherit ANY undefine is_equal, copy end

insert STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

	fd_set_struct_set_fds_bits (a_structure: POINTER; a_value: POINTER) is
			-- Setter for fds_bits field of FD_SET_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fd_set_struct_set_fds_bits"
		}"
		end

feature {} -- Low-level queries

	fd_set_struct_get_fds_bits (a_structure: POINTER): POINTER is
			-- Query for fds_bits field of FD_SET_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "fd_set_struct_get_fds_bits"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_fd_set"
		}"
		end

end -- class FD_SET_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

