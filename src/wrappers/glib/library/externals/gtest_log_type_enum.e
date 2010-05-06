-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTEST_LOG_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = start__binary_low_level)  or else
				(a_value = list__case_low_level)  or else
				(a_value = skip__case_low_level)  or else
				(a_value = start__case_low_level)  or else
				(a_value = stop__case_low_level)  or else
				(a_value = min__result_low_level)  or else
				(a_value = max__result_low_level)  or else
				(a_value = message_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_start__binary is
		do
			value := start__binary_low_level
		end

	set_list__case is
		do
			value := list__case_low_level
		end

	set_skip__case is
		do
			value := skip__case_low_level
		end

	set_start__case is
		do
			value := start__case_low_level
		end

	set_stop__case is
		do
			value := stop__case_low_level
		end

	set_min__result is
		do
			value := min__result_low_level
		end

	set_max__result is
		do
			value := max__result_low_level
		end

	set_message is
		do
			value := message_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_start__binary: BOOLEAN is
		do
			Result := (value=start__binary_low_level)
		end

	is_list__case: BOOLEAN is
		do
			Result := (value=list__case_low_level)
		end

	is_skip__case: BOOLEAN is
		do
			Result := (value=skip__case_low_level)
		end

	is_start__case: BOOLEAN is
		do
			Result := (value=start__case_low_level)
		end

	is_stop__case: BOOLEAN is
		do
			Result := (value=stop__case_low_level)
		end

	is_min__result: BOOLEAN is
		do
			Result := (value=min__result_low_level)
		end

	is_max__result: BOOLEAN is
		do
			Result := (value=max__result_low_level)
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

	start__binary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_START_BINARY"
 			}"
 		end

	list__case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_LIST_CASE"
 			}"
 		end

	skip__case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_SKIP_CASE"
 			}"
 		end

	start__case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_START_CASE"
 			}"
 		end

	stop__case_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_STOP_CASE"
 			}"
 		end

	min__result_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TEST_LOG_MIN_RESULT"
 			}"
 		end

	max__result_low_level: INTEGER is
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
