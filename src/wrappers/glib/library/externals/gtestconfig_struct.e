-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTESTCONFIG_STRUCT

insert STANDARD_C_LIBRARY_TYPES

	GLIB_TYPES
feature {} -- Low-level setters

	gtestconfig_struct_set_test_initialized (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_initialized field of GTESTCONFIG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_set_test_initialized"
		}"
		end

	gtestconfig_struct_set_test_quick (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_quick field of GTESTCONFIG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_set_test_quick"
		}"
		end

	gtestconfig_struct_set_test_perf (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_perf field of GTESTCONFIG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_set_test_perf"
		}"
		end

	gtestconfig_struct_set_test_verbose (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_verbose field of GTESTCONFIG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_set_test_verbose"
		}"
		end

	gtestconfig_struct_set_test_quiet (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_quiet field of GTESTCONFIG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_set_test_quiet"
		}"
		end

	gtestconfig_struct_set_test_undefined (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_undefined field of GTESTCONFIG_STRUCT structure.
			-- TODO: setter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_set_test_undefined"
		}"
		end

feature {} -- Low-level queries

	gtestconfig_struct_get_test_initialized (a_structure: POINTER): INTEGER_32 is
			-- Query for test_initialized field of GTESTCONFIG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_get_test_initialized"
		}"
		end

	gtestconfig_struct_get_test_quick (a_structure: POINTER): INTEGER_32 is
			-- Query for test_quick field of GTESTCONFIG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_get_test_quick"
		}"
		end

	gtestconfig_struct_get_test_perf (a_structure: POINTER): INTEGER_32 is
			-- Query for test_perf field of GTESTCONFIG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_get_test_perf"
		}"
		end

	gtestconfig_struct_get_test_verbose (a_structure: POINTER): INTEGER_32 is
			-- Query for test_verbose field of GTESTCONFIG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_get_test_verbose"
		}"
		end

	gtestconfig_struct_get_test_quiet (a_structure: POINTER): INTEGER_32 is
			-- Query for test_quiet field of GTESTCONFIG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_get_test_quiet"
		}"
		end

	gtestconfig_struct_get_test_undefined (a_structure: POINTER): INTEGER_32 is
			-- Query for test_undefined field of GTESTCONFIG_STRUCT structure.
			-- TODO: getter description

		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtestconfig_struct_get_test_undefined"
		}"
		end

feature {ANY} -- Structure size
	struct_size: like size_t is
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "sizeof_GTestConfig"
		}"
		end

end -- class GTESTCONFIG_STRUCT
-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

