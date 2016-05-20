-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_TOKEN_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_token_eof) or else 
				(a_value = g_token_left_paren) or else 
				(a_value = g_token_right_paren) or else 
				(a_value = g_token_left_curly) or else 
				(a_value = g_token_right_curly) or else 
				(a_value = g_token_left_brace) or else 
				(a_value = g_token_right_brace) or else 
				(a_value = g_token_equal_sign) or else 
				(a_value = g_token_comma) or else 
				(a_value = g_token_none) or else 
				(a_value = g_token_error) or else 
				(a_value = g_token_char) or else 
				(a_value = g_token_binary) or else 
				(a_value = g_token_octal) or else 
				(a_value = g_token_int) or else 
				(a_value = g_token_hex) or else 
				(a_value = g_token_float) or else 
				(a_value = g_token_string) or else 
				(a_value = g_token_symbol) or else 
				(a_value = g_token_identifier) or else 
				(a_value = g_token_identifier_null) or else 
				(a_value = g_token_comment_single) or else 
				(a_value = g_token_comment_multi) or else 
				(a_value = g_token_last))
		end


feature {ANY} -- Setters
	default_create, set_eof is
		do
			value := g_token_eof
		end

	set_left_paren is
		do
			value := g_token_left_paren
		end

	set_right_paren is
		do
			value := g_token_right_paren
		end

	set_left_curly is
		do
			value := g_token_left_curly
		end

	set_right_curly is
		do
			value := g_token_right_curly
		end

	set_left_brace is
		do
			value := g_token_left_brace
		end

	set_right_brace is
		do
			value := g_token_right_brace
		end

	set_equal_sign is
		do
			value := g_token_equal_sign
		end

	set_comma is
		do
			value := g_token_comma
		end

	set_none is
		do
			value := g_token_none
		end

	set_error is
		do
			value := g_token_error
		end

	set_char is
		do
			value := g_token_char
		end

	set_binary is
		do
			value := g_token_binary
		end

	set_octal is
		do
			value := g_token_octal
		end

	set_int is
		do
			value := g_token_int
		end

	set_hex is
		do
			value := g_token_hex
		end

	set_float is
		do
			value := g_token_float
		end

	set_string is
		do
			value := g_token_string
		end

	set_symbol is
		do
			value := g_token_symbol
		end

	set_identifier is
		do
			value := g_token_identifier
		end

	set_identifier_null is
		do
			value := g_token_identifier_null
		end

	set_comment_single is
		do
			value := g_token_comment_single
		end

	set_comment_multi is
		do
			value := g_token_comment_multi
		end

	set_last is
		do
			value := g_token_last
		end


feature {ANY} -- Queries
	is_eof: BOOLEAN is
		do
			Result := (value=g_token_eof)
		end

	is_left_paren: BOOLEAN is
		do
			Result := (value=g_token_left_paren)
		end

	is_right_paren: BOOLEAN is
		do
			Result := (value=g_token_right_paren)
		end

	is_left_curly: BOOLEAN is
		do
			Result := (value=g_token_left_curly)
		end

	is_right_curly: BOOLEAN is
		do
			Result := (value=g_token_right_curly)
		end

	is_left_brace: BOOLEAN is
		do
			Result := (value=g_token_left_brace)
		end

	is_right_brace: BOOLEAN is
		do
			Result := (value=g_token_right_brace)
		end

	is_equal_sign: BOOLEAN is
		do
			Result := (value=g_token_equal_sign)
		end

	is_comma: BOOLEAN is
		do
			Result := (value=g_token_comma)
		end

	is_none: BOOLEAN is
		do
			Result := (value=g_token_none)
		end

	is_error: BOOLEAN is
		do
			Result := (value=g_token_error)
		end

	is_char: BOOLEAN is
		do
			Result := (value=g_token_char)
		end

	is_binary: BOOLEAN is
		do
			Result := (value=g_token_binary)
		end

	is_octal: BOOLEAN is
		do
			Result := (value=g_token_octal)
		end

	is_int: BOOLEAN is
		do
			Result := (value=g_token_int)
		end

	is_hex: BOOLEAN is
		do
			Result := (value=g_token_hex)
		end

	is_float: BOOLEAN is
		do
			Result := (value=g_token_float)
		end

	is_string: BOOLEAN is
		do
			Result := (value=g_token_string)
		end

	is_symbol: BOOLEAN is
		do
			Result := (value=g_token_symbol)
		end

	is_identifier: BOOLEAN is
		do
			Result := (value=g_token_identifier)
		end

	is_identifier_null: BOOLEAN is
		do
			Result := (value=g_token_identifier_null)
		end

	is_comment_single: BOOLEAN is
		do
			Result := (value=g_token_comment_single)
		end

	is_comment_multi: BOOLEAN is
		do
			Result := (value=g_token_comment_multi)
		end

	is_last: BOOLEAN is
		do
			Result := (value=g_token_last)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_token_eof: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_EOF"
		end

	g_token_left_paren: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_LEFT_PAREN"
		end

	g_token_right_paren: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_RIGHT_PAREN"
		end

	g_token_left_curly: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_LEFT_CURLY"
		end

	g_token_right_curly: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_RIGHT_CURLY"
		end

	g_token_left_brace: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_LEFT_BRACE"
		end

	g_token_right_brace: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_RIGHT_BRACE"
		end

	g_token_equal_sign: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_EQUAL_SIGN"
		end

	g_token_comma: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_COMMA"
		end

	g_token_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_NONE"
		end

	g_token_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_ERROR"
		end

	g_token_char: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_CHAR"
		end

	g_token_binary: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_BINARY"
		end

	g_token_octal: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_OCTAL"
		end

	g_token_int: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_INT"
		end

	g_token_hex: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_HEX"
		end

	g_token_float: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_FLOAT"
		end

	g_token_string: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_STRING"
		end

	g_token_symbol: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_SYMBOL"
		end

	g_token_identifier: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_IDENTIFIER"
		end

	g_token_identifier_null: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_IDENTIFIER_NULL"
		end

	g_token_comment_single: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_COMMENT_SINGLE"
		end

	g_token_comment_multi: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_COMMENT_MULTI"
		end

	g_token_last: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_TOKEN_LAST"
		end


end

