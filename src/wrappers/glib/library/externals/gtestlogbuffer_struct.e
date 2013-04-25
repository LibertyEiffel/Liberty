-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTESTLOGBUFFER_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gtestlogbuffer_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GTESTLOGBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogbuffer_struct_set_data"
		}"
		end

	gtestlogbuffer_struct_set_msgs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for msgs field of GTESTLOGBUFFER_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogbuffer_struct_set_msgs"
		}"
		end

feature {} -- Low-level queries

	gtestlogbuffer_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GTESTLOGBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogbuffer_struct_get_data"
		}"
		end

	gtestlogbuffer_struct_get_msgs (a_structure: POINTER): POINTER is
			-- Query for msgs field of GTESTLOGBUFFER_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogbuffer_struct_get_msgs"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_GTestLogBuffer"
		}"
		end

end -- class GTESTLOGBUFFER_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

