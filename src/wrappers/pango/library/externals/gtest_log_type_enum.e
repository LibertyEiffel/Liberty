-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_LOG_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = start_binary_low_level)  or else
				(a_value = list_case_low_level)  or else
				(a_value = skip_case_low_level)  or else
				(a_value = start_case_low_level)  or else
				(a_value = stop_case_low_level)  or else
				(a_value = min_result_low_level)  or else
				(a_value = max_result_low_level)  or else
				(a_value = message_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_error is
		do
			value := error_low_level
		end

	set_start_binary is
		do
			value := start_binary_low_level
		end

	set_list_case is
		do
			value := list_case_low_level
		end

	set_skip_case is
		do
			value := skip_case_low_level
		end

	set_start_case is
		do
			value := start_case_low_level
		end

	set_stop_case is
		do
			value := stop_case_low_level
		end

	set_min_result is
		do
			value := min_result_low_level
		end

	set_max_result is
		do
			value := max_result_low_level
		end

	set_message is
		do
			value := message_low_level
		end

feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	is_start_binary: BOOLEAN is
		do
			Result := (value=start_binary_low_level)
		end

	is_list_case: BOOLEAN is
		do
			Result := (value=list_case_low_level)
		end

	is_skip_case: BOOLEAN is
		do
			Result := (value=skip_case_low_level)
		end

	is_start_case: BOOLEAN is
		do
			Result := (value=start_case_low_level)
		end

	is_stop_case: BOOLEAN is
		do
			Result := (value=stop_case_low_level)
		end

	is_min_result: BOOLEAN is
		do
			Result := (value=min_result_low_level)
		end

	is_max_result: BOOLEAN is
		do
			Result := (value=max_result_low_level)
		end

	is_message: BOOLEAN is
		do
			Result := (value=message_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_NONE"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_ERROR"
 			}"
 		end

	start_binary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_START_BINARY"
 			}"
 		end

	list_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_LIST_CASE"
 			}"
 		end

	skip_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_SKIP_CASE"
 			}"
 		end

	start_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_START_CASE"
 			}"
 		end

	stop_case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_STOP_CASE"
 			}"
 		end

	min_result_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MIN_RESULT"
 			}"
 		end

	max_result_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MAX_RESULT"
 			}"
 		end

	message_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MESSAGE"
 			}"
 		end


end -- class GTEST_LOG_TYPE_ENUM
