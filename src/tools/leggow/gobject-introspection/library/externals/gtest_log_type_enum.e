-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTEST_LOG_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = error_low_level)  or else
				(a_value = list_case_low_level)  or else
				(a_value = max_result_low_level)  or else
				(a_value = message_low_level)  or else
				(a_value = min_result_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = skip_case_low_level)  or else
				(a_value = start_binary_low_level)  or else
				(a_value = start_case_low_level)  or else
				(a_value = start_suite_low_level)  or else
				(a_value = stop_case_low_level)  or else
				(a_value = stop_suite_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_error
               do
                       value := error_low_level
               end

	set_list_case
               do
                       value := list_case_low_level
               end

	set_max_result
               do
                       value := max_result_low_level
               end

	set_message
               do
                       value := message_low_level
               end

	set_min_result
               do
                       value := min_result_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_skip_case
               do
                       value := skip_case_low_level
               end

	set_start_binary
               do
                       value := start_binary_low_level
               end

	set_start_case
               do
                       value := start_case_low_level
               end

	set_start_suite
               do
                       value := start_suite_low_level
               end

	set_stop_case
               do
                       value := stop_case_low_level
               end

	set_stop_suite
               do
                       value := stop_suite_low_level
               end

feature {ANY} -- Queries
       is_error: BOOLEAN
               do
                       Result := (value=error_low_level)
               end

       is_list_case: BOOLEAN
               do
                       Result := (value=list_case_low_level)
               end

       is_max_result: BOOLEAN
               do
                       Result := (value=max_result_low_level)
               end

       is_message: BOOLEAN
               do
                       Result := (value=message_low_level)
               end

       is_min_result: BOOLEAN
               do
                       Result := (value=min_result_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_skip_case: BOOLEAN
               do
                       Result := (value=skip_case_low_level)
               end

       is_start_binary: BOOLEAN
               do
                       Result := (value=start_binary_low_level)
               end

       is_start_case: BOOLEAN
               do
                       Result := (value=start_case_low_level)
               end

       is_start_suite: BOOLEAN
               do
                       Result := (value=start_suite_low_level)
               end

       is_stop_case: BOOLEAN
               do
                       Result := (value=stop_case_low_level)
               end

       is_stop_suite: BOOLEAN
               do
                       Result := (value=stop_suite_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_ERROR"
                       }"
               end

     list_case_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_LIST_CASE"
                       }"
               end

     max_result_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_MAX_RESULT"
                       }"
               end

     message_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_MESSAGE"
                       }"
               end

     min_result_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_MIN_RESULT"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_NONE"
                       }"
               end

     skip_case_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_SKIP_CASE"
                       }"
               end

     start_binary_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_START_BINARY"
                       }"
               end

     start_case_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_START_CASE"
                       }"
               end

     start_suite_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_START_SUITE"
                       }"
               end

     stop_case_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_STOP_CASE"
                       }"
               end

     stop_suite_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TEST_LOG_STOP_SUITE"
                       }"
               end


end -- class GTEST_LOG_TYPE_ENUM
