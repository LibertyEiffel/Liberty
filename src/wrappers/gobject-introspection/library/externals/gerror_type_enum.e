-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GERROR_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_err_digit_radix_low_level)  or else
				(a_value = g_err_float_malformed_low_level)  or else
				(a_value = g_err_float_radix_low_level)  or else
				(a_value = g_err_non_digit_in_const_low_level)  or else
				(a_value = g_err_unexp_eof_low_level)  or else
				(a_value = g_err_unexp_eof_in_comment_low_level)  or else
				(a_value = g_err_unexp_eof_in_string_low_level)  or else
				(a_value = g_err_unknown_low_level) )
		end

feature -- Setters
	default_create,
	set_g_err_digit_radix is
		do
			value := g_err_digit_radix_low_level
		end

	set_g_err_float_malformed is
		do
			value := g_err_float_malformed_low_level
		end

	set_g_err_float_radix is
		do
			value := g_err_float_radix_low_level
		end

	set_g_err_non_digit_in_const is
		do
			value := g_err_non_digit_in_const_low_level
		end

	set_g_err_unexp_eof is
		do
			value := g_err_unexp_eof_low_level
		end

	set_g_err_unexp_eof_in_comment is
		do
			value := g_err_unexp_eof_in_comment_low_level
		end

	set_g_err_unexp_eof_in_string is
		do
			value := g_err_unexp_eof_in_string_low_level
		end

	set_g_err_unknown is
		do
			value := g_err_unknown_low_level
		end

feature -- Queries
	is_g_err_digit_radix: BOOLEAN is
		do
			Result := (value=g_err_digit_radix_low_level)
		end

	is_g_err_float_malformed: BOOLEAN is
		do
			Result := (value=g_err_float_malformed_low_level)
		end

	is_g_err_float_radix: BOOLEAN is
		do
			Result := (value=g_err_float_radix_low_level)
		end

	is_g_err_non_digit_in_const: BOOLEAN is
		do
			Result := (value=g_err_non_digit_in_const_low_level)
		end

	is_g_err_unexp_eof: BOOLEAN is
		do
			Result := (value=g_err_unexp_eof_low_level)
		end

	is_g_err_unexp_eof_in_comment: BOOLEAN is
		do
			Result := (value=g_err_unexp_eof_in_comment_low_level)
		end

	is_g_err_unexp_eof_in_string: BOOLEAN is
		do
			Result := (value=g_err_unexp_eof_in_string_low_level)
		end

	is_g_err_unknown: BOOLEAN is
		do
			Result := (value=g_err_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_err_digit_radix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_DIGIT_RADIX"
 			}"
 		end

	g_err_float_malformed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_MALFORMED"
 			}"
 		end

	g_err_float_radix_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_RADIX"
 			}"
 		end

	g_err_non_digit_in_const_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_NON_DIGIT_IN_CONST"
 			}"
 		end

	g_err_unexp_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF"
 			}"
 		end

	g_err_unexp_eof_in_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_COMMENT"
 			}"
 		end

	g_err_unexp_eof_in_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_STRING"
 			}"
 		end

	g_err_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNKNOWN"
 			}"
 		end


end -- class GERROR_TYPE_ENUM
