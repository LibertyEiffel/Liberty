-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_ERROR_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_err_unknown) or else 
				(a_value = g_err_unexp_eof) or else 
				(a_value = g_err_unexp_eof_in_string) or else 
				(a_value = g_err_unexp_eof_in_comment) or else 
				(a_value = g_err_non_digit_in_const) or else 
				(a_value = g_err_digit_radix) or else 
				(a_value = g_err_float_radix) or else 
				(a_value = g_err_float_malformed))
		end


feature {ANY} -- Setters
	default_create, set_unknown
		do
			value := g_err_unknown
		end

	set_unexp_eof
		do
			value := g_err_unexp_eof
		end

	set_unexp_eof_in_string
		do
			value := g_err_unexp_eof_in_string
		end

	set_unexp_eof_in_comment
		do
			value := g_err_unexp_eof_in_comment
		end

	set_non_digit_in_const
		do
			value := g_err_non_digit_in_const
		end

	set_digit_radix
		do
			value := g_err_digit_radix
		end

	set_float_radix
		do
			value := g_err_float_radix
		end

	set_float_malformed
		do
			value := g_err_float_malformed
		end


feature {ANY} -- Queries
	is_unknown: BOOLEAN
		do
			Result := (value=g_err_unknown)
		end

	is_unexp_eof: BOOLEAN
		do
			Result := (value=g_err_unexp_eof)
		end

	is_unexp_eof_in_string: BOOLEAN
		do
			Result := (value=g_err_unexp_eof_in_string)
		end

	is_unexp_eof_in_comment: BOOLEAN
		do
			Result := (value=g_err_unexp_eof_in_comment)
		end

	is_non_digit_in_const: BOOLEAN
		do
			Result := (value=g_err_non_digit_in_const)
		end

	is_digit_radix: BOOLEAN
		do
			Result := (value=g_err_digit_radix)
		end

	is_float_radix: BOOLEAN
		do
			Result := (value=g_err_float_radix)
		end

	is_float_malformed: BOOLEAN
		do
			Result := (value=g_err_float_malformed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_err_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_UNKNOWN"
		end

	g_err_unexp_eof: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_UNEXP_EOF"
		end

	g_err_unexp_eof_in_string: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_UNEXP_EOF_IN_STRING"
		end

	g_err_unexp_eof_in_comment: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_UNEXP_EOF_IN_COMMENT"
		end

	g_err_non_digit_in_const: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_NON_DIGIT_IN_CONST"
		end

	g_err_digit_radix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_DIGIT_RADIX"
		end

	g_err_float_radix: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_FLOAT_RADIX"
		end

	g_err_float_malformed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_ERR_FLOAT_MALFORMED"
		end


end

