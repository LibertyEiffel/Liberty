-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GERROR_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = digit_radix_low_level)  or else
				(a_value = float_malformed_low_level)  or else
				(a_value = float_radix_low_level)  or else
				(a_value = non_digit_in_const_low_level)  or else
				(a_value = unexp_eof_low_level)  or else
				(a_value = unexp_eof_in_comment_low_level)  or else
				(a_value = unexp_eof_in_string_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_digit_radix is
		do
			value := digit_radix_low_level
		end

	set_float_malformed is
		do
			value := float_malformed_low_level
		end

	set_float_radix is
		do
			value := float_radix_low_level
		end

	set_non_digit_in_const is
		do
			value := non_digit_in_const_low_level
		end

	set_unexp_eof is
		do
			value := unexp_eof_low_level
		end

	set_unexp_eof_in_comment is
		do
			value := unexp_eof_in_comment_low_level
		end

	set_unexp_eof_in_string is
		do
			value := unexp_eof_in_string_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

feature {ANY} -- Queries
	is_digit_radix: BOOLEAN is
		do
			Result := (value=digit_radix_low_level)
		end

	is_float_malformed: BOOLEAN is
		do
			Result := (value=float_malformed_low_level)
		end

	is_float_radix: BOOLEAN is
		do
			Result := (value=float_radix_low_level)
		end

	is_non_digit_in_const: BOOLEAN is
		do
			Result := (value=non_digit_in_const_low_level)
		end

	is_unexp_eof: BOOLEAN is
		do
			Result := (value=unexp_eof_low_level)
		end

	is_unexp_eof_in_comment: BOOLEAN is
		do
			Result := (value=unexp_eof_in_comment_low_level)
		end

	is_unexp_eof_in_string: BOOLEAN is
		do
			Result := (value=unexp_eof_in_string_low_level)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	digit_radix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_DIGIT_RADIX"
 			}"
 		end

	float_malformed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_MALFORMED"
 			}"
 		end

	float_radix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_RADIX"
 			}"
 		end

	non_digit_in_const_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_NON_DIGIT_IN_CONST"
 			}"
 		end

	unexp_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF"
 			}"
 		end

	unexp_eof_in_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_COMMENT"
 			}"
 		end

	unexp_eof_in_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_STRING"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNKNOWN"
 			}"
 		end


end -- class GERROR_TYPE_ENUM
