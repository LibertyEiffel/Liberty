-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTIMEVAL_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gtimeval_struct_set_tv_sec (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for tv_sec field of GTIMEVAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtimeval_struct_set_tv_sec"
		}"
		end

	gtimeval_struct_set_tv_usec (a_structure: POINTER; a_value: INTEGER_64) is
			-- Setter for tv_usec field of GTIMEVAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtimeval_struct_set_tv_usec"
		}"
		end

feature {} -- Low-level queries

	gtimeval_struct_get_tv_sec (a_structure: POINTER): INTEGER_64 is
			-- Query for tv_sec field of GTIMEVAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtimeval_struct_get_tv_sec"
		}"
		end

	gtimeval_struct_get_tv_usec (a_structure: POINTER): INTEGER_64 is
			-- Query for tv_usec field of GTIMEVAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtimeval_struct_get_tv_usec"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTimeVal"
		}"
		end

end -- class GTIMEVAL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

