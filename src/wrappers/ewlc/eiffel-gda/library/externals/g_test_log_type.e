-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TEST_LOG_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_none
		do
			value := g_test_log_none
		end

	set_error
		do
			value := g_test_log_error
		end

	set_start_binary
		do
			value := g_test_log_start_binary
		end

	set_list_case
		do
			value := g_test_log_list_case
		end

	set_skip_case
		do
			value := g_test_log_skip_case
		end

	set_start_case
		do
			value := g_test_log_start_case
		end

	set_stop_case
		do
			value := g_test_log_stop_case
		end

	set_min_result
		do
			value := g_test_log_min_result
		end

	set_max_result
		do
			value := g_test_log_max_result
		end

	set_message
		do
			value := g_test_log_message
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=g_test_log_none)
		end

	is_error: BOOLEAN
		do
			Result := (value=g_test_log_error)
		end

	is_start_binary: BOOLEAN
		do
			Result := (value=g_test_log_start_binary)
		end

	is_list_case: BOOLEAN
		do
			Result := (value=g_test_log_list_case)
		end

	is_skip_case: BOOLEAN
		do
			Result := (value=g_test_log_skip_case)
		end

	is_start_case: BOOLEAN
		do
			Result := (value=g_test_log_start_case)
		end

	is_stop_case: BOOLEAN
		do
			Result := (value=g_test_log_stop_case)
		end

	is_min_result: BOOLEAN
		do
			Result := (value=g_test_log_min_result)
		end

	is_max_result: BOOLEAN
		do
			Result := (value=g_test_log_max_result)
		end

	is_message: BOOLEAN
		do
			Result := (value=g_test_log_message)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_test_log_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_NONE"
		end

	g_test_log_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_ERROR"
		end

	g_test_log_start_binary: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_START_BINARY"
		end

	g_test_log_list_case: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_LIST_CASE"
		end

	g_test_log_skip_case: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_SKIP_CASE"
		end

	g_test_log_start_case: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_START_CASE"
		end

	g_test_log_stop_case: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_STOP_CASE"
		end

	g_test_log_min_result: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_MIN_RESULT"
		end

	g_test_log_max_result: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_MAX_RESULT"
		end

	g_test_log_message: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TEST_LOG_MESSAGE"
		end


end

