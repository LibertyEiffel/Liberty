-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GERROR_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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

feature {ANY} -- Setters
	default_create,
	set_g_err_digit_radix
		do
			value := g_err_digit_radix_low_level
		end

	set_g_err_float_malformed
		do
			value := g_err_float_malformed_low_level
		end

	set_g_err_float_radix
		do
			value := g_err_float_radix_low_level
		end

	set_g_err_non_digit_in_const
		do
			value := g_err_non_digit_in_const_low_level
		end

	set_g_err_unexp_eof
		do
			value := g_err_unexp_eof_low_level
		end

	set_g_err_unexp_eof_in_comment
		do
			value := g_err_unexp_eof_in_comment_low_level
		end

	set_g_err_unexp_eof_in_string
		do
			value := g_err_unexp_eof_in_string_low_level
		end

	set_g_err_unknown
		do
			value := g_err_unknown_low_level
		end

feature {ANY} -- Queries
	is_g_err_digit_radix: BOOLEAN
		do
			Result := (value=g_err_digit_radix_low_level)
		end

	is_g_err_float_malformed: BOOLEAN
		do
			Result := (value=g_err_float_malformed_low_level)
		end

	is_g_err_float_radix: BOOLEAN
		do
			Result := (value=g_err_float_radix_low_level)
		end

	is_g_err_non_digit_in_const: BOOLEAN
		do
			Result := (value=g_err_non_digit_in_const_low_level)
		end

	is_g_err_unexp_eof: BOOLEAN
		do
			Result := (value=g_err_unexp_eof_low_level)
		end

	is_g_err_unexp_eof_in_comment: BOOLEAN
		do
			Result := (value=g_err_unexp_eof_in_comment_low_level)
		end

	is_g_err_unexp_eof_in_string: BOOLEAN
		do
			Result := (value=g_err_unexp_eof_in_string_low_level)
		end

	is_g_err_unknown: BOOLEAN
		do
			Result := (value=g_err_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_err_digit_radix_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_DIGIT_RADIX"
 			}"
 		end

	g_err_float_malformed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_MALFORMED"
 			}"
 		end

	g_err_float_radix_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_FLOAT_RADIX"
 			}"
 		end

	g_err_non_digit_in_const_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_NON_DIGIT_IN_CONST"
 			}"
 		end

	g_err_unexp_eof_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF"
 			}"
 		end

	g_err_unexp_eof_in_comment_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_COMMENT"
 			}"
 		end

	g_err_unexp_eof_in_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNEXP_EOF_IN_STRING"
 			}"
 		end

	g_err_unknown_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ERR_UNKNOWN"
 			}"
 		end


end -- class GERROR_TYPE_ENUM
