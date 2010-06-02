-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTIME_VAL_STRUCT

inherit ANY undefine is_equal, copy end

insert GLIB_TYPES
feature {} -- Low-level setters

	gtime_val_struct_set_tv_sec (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for tv_sec field of GTIME_VAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtime_val_struct_set_tv_sec"
		}"
		end

	gtime_val_struct_set_tv_usec (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for tv_usec field of GTIME_VAL_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtime_val_struct_set_tv_usec"
		}"
		end

feature {} -- Low-level queries

	gtime_val_struct_get_tv_sec (a_structure: POINTER): INTEGER_32 is
			-- Query for tv_sec field of GTIME_VAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtime_val_struct_get_tv_sec"
		}"
		end

	gtime_val_struct_get_tv_usec (a_structure: POINTER): INTEGER_32 is
			-- Query for tv_usec field of GTIME_VAL_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtime_val_struct_get_tv_usec"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof__GTimeVal"
		}"
		end

end -- class GTIME_VAL_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

