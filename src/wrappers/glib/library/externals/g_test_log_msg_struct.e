-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_TEST_LOG_MSG_STRUCT
		--  A private structure

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gtestlogmsg_struct_set_log_type (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for log_type field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_set_log_type"
		}"
		end

	gtestlogmsg_struct_set_n_strings (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_strings field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_set_n_strings"
		}"
		end

	gtestlogmsg_struct_set_strings (a_structure: POINTER; a_value: POINTER) is
			-- Setter for strings field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_set_strings"
		}"
		end

	gtestlogmsg_struct_set_n_nums (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_nums field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_set_n_nums"
		}"
		end

	gtestlogmsg_struct_set_nums (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nums field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_set_nums"
		}"
		end

feature {} -- Low-level queries

	gtestlogmsg_struct_get_log_type (a_structure: POINTER): INTEGER_32 is
			-- Query for log_type field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_get_log_type"
		}"
		end

	gtestlogmsg_struct_get_n_strings (a_structure: POINTER): NATURAL_32 is
			-- Query for n_strings field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_get_n_strings"
		}"
		end

	gtestlogmsg_struct_get_strings (a_structure: POINTER): POINTER is
			-- Query for strings field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_get_strings"
		}"
		end

	gtestlogmsg_struct_get_n_nums (a_structure: POINTER): NATURAL_32 is
			-- Query for n_nums field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_get_n_nums"
		}"
		end

	gtestlogmsg_struct_get_nums (a_structure: POINTER): POINTER is
			-- Query for nums field of GTestLogMsg structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestlogmsg_struct_get_nums"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GTestLogMsg"
		}"
		end

end
