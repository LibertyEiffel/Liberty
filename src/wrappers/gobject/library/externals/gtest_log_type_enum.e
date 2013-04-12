-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_LOG_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_test_log_error_low_level)  or else
				(a_value = g_test_log_list_case_low_level)  or else
				(a_value = g_test_log_max_result_low_level)  or else
				(a_value = g_test_log_message_low_level)  or else
				(a_value = g_test_log_min_result_low_level)  or else
				(a_value = g_test_log_none_low_level)  or else
				(a_value = g_test_log_skip_case_low_level)  or else
				(a_value = g_test_log_start_binary_low_level)  or else
				(a_value = g_test_log_start_case_low_level)  or else
				(a_value = g_test_log_stop_case_low_level) )
		end

feature -- Setters
	default_create,
	set_g_test_log_error is
		do
			value := g_test_log_error_low_level
		end

	set_g_test_log_list_case is
		do
			value := g_test_log_list_case_low_level
		end

	set_g_test_log_max_result is
		do
			value := g_test_log_max_result_low_level
		end

	set_g_test_log_message is
		do
			value := g_test_log_message_low_level
		end

	set_g_test_log_min_result is
		do
			value := g_test_log_min_result_low_level
		end

	set_g_test_log_none is
		do
			value := g_test_log_none_low_level
		end

	set_g_test_log_skip_case is
		do
			value := g_test_log_skip_case_low_level
		end

	set_g_test_log_start_binary is
		do
			value := g_test_log_start_binary_low_level
		end

	set_g_test_log_start_case is
		do
			value := g_test_log_start_case_low_level
		end

	set_g_test_log_stop_case is
		do
			value := g_test_log_stop_case_low_level
		end

feature -- Queries
	is_g_test_log_error: BOOLEAN is
		do
			Result := (value=g_test_log_error_low_level)
		end

	is_g_test_log_list_case: BOOLEAN is
		do
			Result := (value=g_test_log_list_case_low_level)
		end

	is_g_test_log_max_result: BOOLEAN is
		do
			Result := (value=g_test_log_max_result_low_level)
		end

	is_g_test_log_message: BOOLEAN is
		do
			Result := (value=g_test_log_message_low_level)
		end

	is_g_test_log_min_result: BOOLEAN is
		do
			Result := (value=g_test_log_min_result_low_level)
		end

	is_g_test_log_none: BOOLEAN is
		do
			Result := (value=g_test_log_none_low_level)
		end

	is_g_test_log_skip_case: BOOLEAN is
		do
			Result := (value=g_test_log_skip_case_low_level)
		end

	is_g_test_log_start_binary: BOOLEAN is
		do
			Result := (value=g_test_log_start_binary_low_level)
		end

	is_g_test_log_start_case: BOOLEAN is
		do
			Result := (value=g_test_log_start_case_low_level)
		end

	is_g_test_log_stop_case: BOOLEAN is
		do
			Result := (value=g_test_log_stop_case_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_test_log_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_ERROR"
 			}"
 		end

	g_test_log_list_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_LIST_CASE"
 			}"
 		end

	g_test_log_max_result_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MAX_RESULT"
 			}"
 		end

	g_test_log_message_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MESSAGE"
 			}"
 		end

	g_test_log_min_result_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MIN_RESULT"
 			}"
 		end

	g_test_log_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_NONE"
 			}"
 		end

	g_test_log_skip_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_SKIP_CASE"
 			}"
 		end

	g_test_log_start_binary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_START_BINARY"
 			}"
 		end

	g_test_log_start_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_START_CASE"
 			}"
 		end

	g_test_log_stop_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_STOP_CASE"
 			}"
 		end


end -- class GTEST_LOG_TYPE_ENUM
