-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class TIMEVAL_STRUCT

inherit ANY undefine is_equal, copy end

insert STANDARD_C_LIBRARY_TYPES
feature {} -- Low-level setters

	timeval_struct_set_tv_sec (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for tv_sec field of TIMEVAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timeval_struct_set_tv_sec"
		}"
		end

	timeval_struct_set_tv_usec (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for tv_usec field of TIMEVAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timeval_struct_set_tv_usec"
		}"
		end

feature {} -- Low-level queries

	timeval_struct_get_tv_sec (a_structure: POINTER): INTEGER_64 is
			-- Query for tv_sec field of TIMEVAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timeval_struct_get_tv_sec"
		}"
		end

	timeval_struct_get_tv_usec (a_structure: POINTER): INTEGER_64 is
			-- Query for tv_usec field of TIMEVAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "timeval_struct_get_tv_usec"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_timeval"
		}"
		end

end -- class TIMEVAL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

