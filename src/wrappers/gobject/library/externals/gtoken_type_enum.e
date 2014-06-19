-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTOKEN_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_token_binary_low_level)  or else
				(a_value = g_token_char_low_level)  or else
				(a_value = g_token_comma_low_level)  or else
				(a_value = g_token_comment_multi_low_level)  or else
				(a_value = g_token_comment_single_low_level)  or else
				(a_value = g_token_eof_low_level)  or else
				(a_value = g_token_equal_sign_low_level)  or else
				(a_value = g_token_error_low_level)  or else
				(a_value = g_token_float_low_level)  or else
				(a_value = g_token_hex_low_level)  or else
				(a_value = g_token_identifier_low_level)  or else
				(a_value = g_token_identifier_null_low_level)  or else
				(a_value = g_token_int_low_level)  or else
				(a_value = g_token_last_low_level)  or else
				(a_value = g_token_left_brace_low_level)  or else
				(a_value = g_token_left_curly_low_level)  or else
				(a_value = g_token_left_paren_low_level)  or else
				(a_value = g_token_none_low_level)  or else
				(a_value = g_token_octal_low_level)  or else
				(a_value = g_token_right_brace_low_level)  or else
				(a_value = g_token_right_curly_low_level)  or else
				(a_value = g_token_right_paren_low_level)  or else
				(a_value = g_token_string_low_level)  or else
				(a_value = g_token_symbol_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_token_binary
		do
			value := g_token_binary_low_level
		end

	set_g_token_char
		do
			value := g_token_char_low_level
		end

	set_g_token_comma
		do
			value := g_token_comma_low_level
		end

	set_g_token_comment_multi
		do
			value := g_token_comment_multi_low_level
		end

	set_g_token_comment_single
		do
			value := g_token_comment_single_low_level
		end

	set_g_token_eof
		do
			value := g_token_eof_low_level
		end

	set_g_token_equal_sign
		do
			value := g_token_equal_sign_low_level
		end

	set_g_token_error
		do
			value := g_token_error_low_level
		end

	set_g_token_float
		do
			value := g_token_float_low_level
		end

	set_g_token_hex
		do
			value := g_token_hex_low_level
		end

	set_g_token_identifier
		do
			value := g_token_identifier_low_level
		end

	set_g_token_identifier_null
		do
			value := g_token_identifier_null_low_level
		end

	set_g_token_int
		do
			value := g_token_int_low_level
		end

	set_g_token_last
		do
			value := g_token_last_low_level
		end

	set_g_token_left_brace
		do
			value := g_token_left_brace_low_level
		end

	set_g_token_left_curly
		do
			value := g_token_left_curly_low_level
		end

	set_g_token_left_paren
		do
			value := g_token_left_paren_low_level
		end

	set_g_token_none
		do
			value := g_token_none_low_level
		end

	set_g_token_octal
		do
			value := g_token_octal_low_level
		end

	set_g_token_right_brace
		do
			value := g_token_right_brace_low_level
		end

	set_g_token_right_curly
		do
			value := g_token_right_curly_low_level
		end

	set_g_token_right_paren
		do
			value := g_token_right_paren_low_level
		end

	set_g_token_string
		do
			value := g_token_string_low_level
		end

	set_g_token_symbol
		do
			value := g_token_symbol_low_level
		end

feature {ANY} -- Queries
	is_g_token_binary: BOOLEAN
		do
			Result := (value=g_token_binary_low_level)
		end

	is_g_token_char: BOOLEAN
		do
			Result := (value=g_token_char_low_level)
		end

	is_g_token_comma: BOOLEAN
		do
			Result := (value=g_token_comma_low_level)
		end

	is_g_token_comment_multi: BOOLEAN
		do
			Result := (value=g_token_comment_multi_low_level)
		end

	is_g_token_comment_single: BOOLEAN
		do
			Result := (value=g_token_comment_single_low_level)
		end

	is_g_token_eof: BOOLEAN
		do
			Result := (value=g_token_eof_low_level)
		end

	is_g_token_equal_sign: BOOLEAN
		do
			Result := (value=g_token_equal_sign_low_level)
		end

	is_g_token_error: BOOLEAN
		do
			Result := (value=g_token_error_low_level)
		end

	is_g_token_float: BOOLEAN
		do
			Result := (value=g_token_float_low_level)
		end

	is_g_token_hex: BOOLEAN
		do
			Result := (value=g_token_hex_low_level)
		end

	is_g_token_identifier: BOOLEAN
		do
			Result := (value=g_token_identifier_low_level)
		end

	is_g_token_identifier_null: BOOLEAN
		do
			Result := (value=g_token_identifier_null_low_level)
		end

	is_g_token_int: BOOLEAN
		do
			Result := (value=g_token_int_low_level)
		end

	is_g_token_last: BOOLEAN
		do
			Result := (value=g_token_last_low_level)
		end

	is_g_token_left_brace: BOOLEAN
		do
			Result := (value=g_token_left_brace_low_level)
		end

	is_g_token_left_curly: BOOLEAN
		do
			Result := (value=g_token_left_curly_low_level)
		end

	is_g_token_left_paren: BOOLEAN
		do
			Result := (value=g_token_left_paren_low_level)
		end

	is_g_token_none: BOOLEAN
		do
			Result := (value=g_token_none_low_level)
		end

	is_g_token_octal: BOOLEAN
		do
			Result := (value=g_token_octal_low_level)
		end

	is_g_token_right_brace: BOOLEAN
		do
			Result := (value=g_token_right_brace_low_level)
		end

	is_g_token_right_curly: BOOLEAN
		do
			Result := (value=g_token_right_curly_low_level)
		end

	is_g_token_right_paren: BOOLEAN
		do
			Result := (value=g_token_right_paren_low_level)
		end

	is_g_token_string: BOOLEAN
		do
			Result := (value=g_token_string_low_level)
		end

	is_g_token_symbol: BOOLEAN
		do
			Result := (value=g_token_symbol_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_token_binary_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_BINARY"
 			}"
 		end

	g_token_char_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_CHAR"
 			}"
 		end

	g_token_comma_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMA"
 			}"
 		end

	g_token_comment_multi_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_MULTI"
 			}"
 		end

	g_token_comment_single_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_SINGLE"
 			}"
 		end

	g_token_eof_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_EOF"
 			}"
 		end

	g_token_equal_sign_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_EQUAL_SIGN"
 			}"
 		end

	g_token_error_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_ERROR"
 			}"
 		end

	g_token_float_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_FLOAT"
 			}"
 		end

	g_token_hex_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_HEX"
 			}"
 		end

	g_token_identifier_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER"
 			}"
 		end

	g_token_identifier_null_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER_NULL"
 			}"
 		end

	g_token_int_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_INT"
 			}"
 		end

	g_token_last_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LAST"
 			}"
 		end

	g_token_left_brace_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_BRACE"
 			}"
 		end

	g_token_left_curly_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_CURLY"
 			}"
 		end

	g_token_left_paren_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_PAREN"
 			}"
 		end

	g_token_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_NONE"
 			}"
 		end

	g_token_octal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_OCTAL"
 			}"
 		end

	g_token_right_brace_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_BRACE"
 			}"
 		end

	g_token_right_curly_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_CURLY"
 			}"
 		end

	g_token_right_paren_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_PAREN"
 			}"
 		end

	g_token_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_STRING"
 			}"
 		end

	g_token_symbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_SYMBOL"
 			}"
 		end


end -- class GTOKEN_TYPE_ENUM
