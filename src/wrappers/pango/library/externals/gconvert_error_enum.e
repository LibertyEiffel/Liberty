-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERT_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = no_conversion_low_level)  or else
				(a_value = illegal_sequence_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = partial_input_low_level)  or else
				(a_value = bad_uri_low_level)  or else
				(a_value = not_absolute_path_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_no_conversion is
		do
			value := no_conversion_low_level
		end

	set_illegal_sequence is
		do
			value := illegal_sequence_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

	set_partial_input is
		do
			value := partial_input_low_level
		end

	set_bad_uri is
		do
			value := bad_uri_low_level
		end

	set_not_absolute_path is
		do
			value := not_absolute_path_low_level
		end

feature {ANY} -- Queries
	is_no_conversion: BOOLEAN is
		do
			Result := (value=no_conversion_low_level)
		end

	is_illegal_sequence: BOOLEAN is
		do
			Result := (value=illegal_sequence_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

	is_partial_input: BOOLEAN is
		do
			Result := (value=partial_input_low_level)
		end

	is_bad_uri: BOOLEAN is
		do
			Result := (value=bad_uri_low_level)
		end

	is_not_absolute_path: BOOLEAN is
		do
			Result := (value=not_absolute_path_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	no_conversion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NO_CONVERSION"
 			}"
 		end

	illegal_sequence_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_ILLEGAL_SEQUENCE"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_FAILED"
 			}"
 		end

	partial_input_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_PARTIAL_INPUT"
 			}"
 		end

	bad_uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_BAD_URI"
 			}"
 		end

	not_absolute_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NOT_ABSOLUTE_PATH"
 			}"
 		end


end -- class GCONVERT_ERROR_ENUM
