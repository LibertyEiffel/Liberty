-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_TEST_LOG_BUFFER_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gtestlogbuffer_struct_set_data (a_structure: POINTER; a_value: POINTER) is
			-- Setter for data field of GTestLogBuffer structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogbuffer_struct_set_data"
		}"
		end

	gtestlogbuffer_struct_set_msgs (a_structure: POINTER; a_value: POINTER) is
			-- Setter for msgs field of GTestLogBuffer structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogbuffer_struct_set_msgs"
		}"
		end

feature {} -- Low-level queries

	gtestlogbuffer_struct_get_data (a_structure: POINTER): POINTER is
			-- Query for data field of GTestLogBuffer structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogbuffer_struct_get_data"
		}"
		end

	gtestlogbuffer_struct_get_msgs (a_structure: POINTER): POINTER is
			-- Query for msgs field of GTestLogBuffer structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogbuffer_struct_get_msgs"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GTestLogBuffer"
		}"
		end

end
