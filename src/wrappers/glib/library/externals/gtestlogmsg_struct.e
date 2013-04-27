-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTESTLOGMSG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gtestlogmsg_struct_set_log_type (a_structure: POINTER; a_value: INTEGER) is
			-- Setter for log_type field of GTESTLOGMSG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_set_log_type"
		}"
		end

	gtestlogmsg_struct_set_n_strings (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_strings field of GTESTLOGMSG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_set_n_strings"
		}"
		end

	gtestlogmsg_struct_set_strings (a_structure: POINTER; a_value: POINTER) is
			-- Setter for strings field of GTESTLOGMSG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_set_strings"
		}"
		end

	gtestlogmsg_struct_set_n_nums (a_structure: POINTER; a_value: NATURAL_32) is
			-- Setter for n_nums field of GTESTLOGMSG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_set_n_nums"
		}"
		end

	gtestlogmsg_struct_set_nums (a_structure: POINTER; a_value: POINTER) is
			-- Setter for nums field of GTESTLOGMSG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_set_nums"
		}"
		end

feature {} -- Low-level queries

	gtestlogmsg_struct_get_log_type (a_structure: POINTER): INTEGER is
			-- Query for log_type field of GTESTLOGMSG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_get_log_type"
		}"
		end

	gtestlogmsg_struct_get_n_strings (a_structure: POINTER): NATURAL_32 is
			-- Query for n_strings field of GTESTLOGMSG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_get_n_strings"
		}"
		end

	gtestlogmsg_struct_get_strings (a_structure: POINTER): POINTER is
			-- Query for strings field of GTESTLOGMSG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_get_strings"
		}"
		end

	gtestlogmsg_struct_get_n_nums (a_structure: POINTER): NATURAL_32 is
			-- Query for n_nums field of GTESTLOGMSG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_get_n_nums"
		}"
		end

	gtestlogmsg_struct_get_nums (a_structure: POINTER): POINTER is
			-- Query for nums field of GTESTLOGMSG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestlogmsg_struct_get_nums"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_GTestLogMsg"
		}"
		end

end -- class GTESTLOGMSG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

