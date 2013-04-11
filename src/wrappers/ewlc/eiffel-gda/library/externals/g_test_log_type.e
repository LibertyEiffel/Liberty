-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TEST_LOG_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_test_log_none) or else 
				(a_value = g_test_log_error) or else 
				(a_value = g_test_log_start_binary) or else 
				(a_value = g_test_log_list_case) or else 
				(a_value = g_test_log_skip_case) or else 
				(a_value = g_test_log_start_case) or else 
				(a_value = g_test_log_stop_case) or else 
				(a_value = g_test_log_min_result) or else 
				(a_value = g_test_log_max_result) or else 
				(a_value = g_test_log_message))
		end


feature {ANY} -- Setters
	default_create, set_none is
		do
			value := g_test_log_none
		end

	set_error is
		do
			value := g_test_log_error
		end

	set_start_binary is
		do
			value := g_test_log_start_binary
		end

	set_list_case is
		do
			value := g_test_log_list_case
		end

	set_skip_case is
		do
			value := g_test_log_skip_case
		end

	set_start_case is
		do
			value := g_test_log_start_case
		end

	set_stop_case is
		do
			value := g_test_log_stop_case
		end

	set_min_result is
		do
			value := g_test_log_min_result
		end

	set_max_result is
		do
			value := g_test_log_max_result
		end

	set_message is
		do
			value := g_test_log_message
		end


feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=g_test_log_none)
		end

	is_error: BOOLEAN is
		do
			Result := (value=g_test_log_error)
		end

	is_start_binary: BOOLEAN is
		do
			Result := (value=g_test_log_start_binary)
		end

	is_list_case: BOOLEAN is
		do
			Result := (value=g_test_log_list_case)
		end

	is_skip_case: BOOLEAN is
		do
			Result := (value=g_test_log_skip_case)
		end

	is_start_case: BOOLEAN is
		do
			Result := (value=g_test_log_start_case)
		end

	is_stop_case: BOOLEAN is
		do
			Result := (value=g_test_log_stop_case)
		end

	is_min_result: BOOLEAN is
		do
			Result := (value=g_test_log_min_result)
		end

	is_max_result: BOOLEAN is
		do
			Result := (value=g_test_log_max_result)
		end

	is_message: BOOLEAN is
		do
			Result := (value=g_test_log_message)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_test_log_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_NONE"
		end

	g_test_log_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_ERROR"
		end

	g_test_log_start_binary: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_START_BINARY"
		end

	g_test_log_list_case: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_LIST_CASE"
		end

	g_test_log_skip_case: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_SKIP_CASE"
		end

	g_test_log_start_case: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_START_CASE"
		end

	g_test_log_stop_case: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_STOP_CASE"
		end

	g_test_log_min_result: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_MIN_RESULT"
		end

	g_test_log_max_result: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_MAX_RESULT"
		end

	g_test_log_message: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_MESSAGE"
		end


end

