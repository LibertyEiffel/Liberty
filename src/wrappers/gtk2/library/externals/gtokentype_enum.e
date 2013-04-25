-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTOKENTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_token_binary is
		do
			value := g_token_binary_low_level
		end

	set_g_token_char is
		do
			value := g_token_char_low_level
		end

	set_g_token_comma is
		do
			value := g_token_comma_low_level
		end

	set_g_token_comment_multi is
		do
			value := g_token_comment_multi_low_level
		end

	set_g_token_comment_single is
		do
			value := g_token_comment_single_low_level
		end

	set_g_token_eof is
		do
			value := g_token_eof_low_level
		end

	set_g_token_equal_sign is
		do
			value := g_token_equal_sign_low_level
		end

	set_g_token_error is
		do
			value := g_token_error_low_level
		end

	set_g_token_float is
		do
			value := g_token_float_low_level
		end

	set_g_token_hex is
		do
			value := g_token_hex_low_level
		end

	set_g_token_identifier is
		do
			value := g_token_identifier_low_level
		end

	set_g_token_identifier_null is
		do
			value := g_token_identifier_null_low_level
		end

	set_g_token_int is
		do
			value := g_token_int_low_level
		end

	set_g_token_last is
		do
			value := g_token_last_low_level
		end

	set_g_token_left_brace is
		do
			value := g_token_left_brace_low_level
		end

	set_g_token_left_curly is
		do
			value := g_token_left_curly_low_level
		end

	set_g_token_left_paren is
		do
			value := g_token_left_paren_low_level
		end

	set_g_token_none is
		do
			value := g_token_none_low_level
		end

	set_g_token_octal is
		do
			value := g_token_octal_low_level
		end

	set_g_token_right_brace is
		do
			value := g_token_right_brace_low_level
		end

	set_g_token_right_curly is
		do
			value := g_token_right_curly_low_level
		end

	set_g_token_right_paren is
		do
			value := g_token_right_paren_low_level
		end

	set_g_token_string is
		do
			value := g_token_string_low_level
		end

	set_g_token_symbol is
		do
			value := g_token_symbol_low_level
		end

feature {ANY} -- Queries
	is_g_token_binary: BOOLEAN is
		do
			Result := (value=g_token_binary_low_level)
		end

	is_g_token_char: BOOLEAN is
		do
			Result := (value=g_token_char_low_level)
		end

	is_g_token_comma: BOOLEAN is
		do
			Result := (value=g_token_comma_low_level)
		end

	is_g_token_comment_multi: BOOLEAN is
		do
			Result := (value=g_token_comment_multi_low_level)
		end

	is_g_token_comment_single: BOOLEAN is
		do
			Result := (value=g_token_comment_single_low_level)
		end

	is_g_token_eof: BOOLEAN is
		do
			Result := (value=g_token_eof_low_level)
		end

	is_g_token_equal_sign: BOOLEAN is
		do
			Result := (value=g_token_equal_sign_low_level)
		end

	is_g_token_error: BOOLEAN is
		do
			Result := (value=g_token_error_low_level)
		end

	is_g_token_float: BOOLEAN is
		do
			Result := (value=g_token_float_low_level)
		end

	is_g_token_hex: BOOLEAN is
		do
			Result := (value=g_token_hex_low_level)
		end

	is_g_token_identifier: BOOLEAN is
		do
			Result := (value=g_token_identifier_low_level)
		end

	is_g_token_identifier_null: BOOLEAN is
		do
			Result := (value=g_token_identifier_null_low_level)
		end

	is_g_token_int: BOOLEAN is
		do
			Result := (value=g_token_int_low_level)
		end

	is_g_token_last: BOOLEAN is
		do
			Result := (value=g_token_last_low_level)
		end

	is_g_token_left_brace: BOOLEAN is
		do
			Result := (value=g_token_left_brace_low_level)
		end

	is_g_token_left_curly: BOOLEAN is
		do
			Result := (value=g_token_left_curly_low_level)
		end

	is_g_token_left_paren: BOOLEAN is
		do
			Result := (value=g_token_left_paren_low_level)
		end

	is_g_token_none: BOOLEAN is
		do
			Result := (value=g_token_none_low_level)
		end

	is_g_token_octal: BOOLEAN is
		do
			Result := (value=g_token_octal_low_level)
		end

	is_g_token_right_brace: BOOLEAN is
		do
			Result := (value=g_token_right_brace_low_level)
		end

	is_g_token_right_curly: BOOLEAN is
		do
			Result := (value=g_token_right_curly_low_level)
		end

	is_g_token_right_paren: BOOLEAN is
		do
			Result := (value=g_token_right_paren_low_level)
		end

	is_g_token_string: BOOLEAN is
		do
			Result := (value=g_token_string_low_level)
		end

	is_g_token_symbol: BOOLEAN is
		do
			Result := (value=g_token_symbol_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_token_binary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_BINARY"
 			}"
 		end

	g_token_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_CHAR"
 			}"
 		end

	g_token_comma_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMA"
 			}"
 		end

	g_token_comment_multi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_MULTI"
 			}"
 		end

	g_token_comment_single_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_SINGLE"
 			}"
 		end

	g_token_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_EOF"
 			}"
 		end

	g_token_equal_sign_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_EQUAL_SIGN"
 			}"
 		end

	g_token_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_ERROR"
 			}"
 		end

	g_token_float_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_FLOAT"
 			}"
 		end

	g_token_hex_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_HEX"
 			}"
 		end

	g_token_identifier_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER"
 			}"
 		end

	g_token_identifier_null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER_NULL"
 			}"
 		end

	g_token_int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_INT"
 			}"
 		end

	g_token_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LAST"
 			}"
 		end

	g_token_left_brace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_BRACE"
 			}"
 		end

	g_token_left_curly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_CURLY"
 			}"
 		end

	g_token_left_paren_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_PAREN"
 			}"
 		end

	g_token_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_NONE"
 			}"
 		end

	g_token_octal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_OCTAL"
 			}"
 		end

	g_token_right_brace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_BRACE"
 			}"
 		end

	g_token_right_curly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_CURLY"
 			}"
 		end

	g_token_right_paren_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_PAREN"
 			}"
 		end

	g_token_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_STRING"
 			}"
 		end

	g_token_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_SYMBOL"
 			}"
 		end


end -- class GTOKENTYPE_ENUM
