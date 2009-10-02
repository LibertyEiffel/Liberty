-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_TIME_VAL_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gtimeval_struct_set_tv_sec (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for tv_sec field of GTimeVal structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtimeval_struct_set_tv_sec"
		}"
		end

	gtimeval_struct_set_tv_usec (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for tv_usec field of GTimeVal structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtimeval_struct_set_tv_usec"
		}"
		end

feature {} -- Low-level queries

	gtimeval_struct_get_tv_sec (a_structure: POINTER): INTEGER_32 is
			-- Query for tv_sec field of GTimeVal structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtimeval_struct_get_tv_sec"
		}"
		end

	gtimeval_struct_get_tv_usec (a_structure: POINTER): INTEGER_32 is
			-- Query for tv_usec field of GTimeVal structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtimeval_struct_get_tv_usec"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GTimeVal"
		}"
		end

end
