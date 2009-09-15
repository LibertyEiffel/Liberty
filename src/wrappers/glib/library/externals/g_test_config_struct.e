-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class G_TEST_CONFIG_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters

	gtestconfig_struct_set_test_initialized (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_initialized field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_set_test_initialized"
		}"
		end

	gtestconfig_struct_set_test_quick (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_quick field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_set_test_quick"
		}"
		end

	gtestconfig_struct_set_test_perf (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_perf field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_set_test_perf"
		}"
		end

	gtestconfig_struct_set_test_verbose (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_verbose field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_set_test_verbose"
		}"
		end

	gtestconfig_struct_set_test_quiet (a_structure: POINTER; a_value: INTEGER_32) is
			-- Setter for test_quiet field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_set_test_quiet"
		}"
		end

feature {} -- Low-level queries

	gtestconfig_struct_get_test_initialized (a_structure: POINTER): INTEGER_32 is
			-- Query for test_initialized field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_get_test_initialized"
		}"
		end

	gtestconfig_struct_get_test_quick (a_structure: POINTER): INTEGER_32 is
			-- Query for test_quick field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_get_test_quick"
		}"
		end

	gtestconfig_struct_get_test_perf (a_structure: POINTER): INTEGER_32 is
			-- Query for test_perf field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_get_test_perf"
		}"
		end

	gtestconfig_struct_get_test_verbose (a_structure: POINTER): INTEGER_32 is
			-- Query for test_verbose field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_get_test_verbose"
		}"
		end

	gtestconfig_struct_get_test_quiet (a_structure: POINTER): INTEGER_32 is
			-- Query for test_quiet field of GTestConfig structure.
			
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "gtestconfig_struct_get_test_quiet"
		}"
		end

feature -- Structure size
	struct_size: INTEGER is
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "sizeof_GTestConfig"
		}"
		end

end
