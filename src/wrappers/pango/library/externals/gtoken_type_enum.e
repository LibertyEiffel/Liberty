-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTOKEN_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = eof_low_level)  or else
				(a_value = left_paren_low_level)  or else
				(a_value = right_paren_low_level)  or else
				(a_value = left_curly_low_level)  or else
				(a_value = right_curly_low_level)  or else
				(a_value = left_brace_low_level)  or else
				(a_value = right_brace_low_level)  or else
				(a_value = equal_sign_low_level)  or else
				(a_value = comma_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = char_low_level)  or else
				(a_value = binary_low_level)  or else
				(a_value = octal_low_level)  or else
				(a_value = int_low_level)  or else
				(a_value = hex_low_level)  or else
				(a_value = float_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = symbol_low_level)  or else
				(a_value = identifier_low_level)  or else
				(a_value = identifier_null_low_level)  or else
				(a_value = comment_single_low_level)  or else
				(a_value = comment_multi_low_level)  or else
				(a_value = last_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_eof is
		do
			value := eof_low_level
		end

	set_left_paren is
		do
			value := left_paren_low_level
		end

	set_right_paren is
		do
			value := right_paren_low_level
		end

	set_left_curly is
		do
			value := left_curly_low_level
		end

	set_right_curly is
		do
			value := right_curly_low_level
		end

	set_left_brace is
		do
			value := left_brace_low_level
		end

	set_right_brace is
		do
			value := right_brace_low_level
		end

	set_equal_sign is
		do
			value := equal_sign_low_level
		end

	set_comma is
		do
			value := comma_low_level
		end

	set_none is
		do
			value := none_low_level
		end

	set_error is
		do
			value := error_low_level
		end

	set_char is
		do
			value := char_low_level
		end

	set_binary is
		do
			value := binary_low_level
		end

	set_octal is
		do
			value := octal_low_level
		end

	set_int is
		do
			value := int_low_level
		end

	set_hex is
		do
			value := hex_low_level
		end

	set_float is
		do
			value := float_low_level
		end

	set_string is
		do
			value := string_low_level
		end

	set_symbol is
		do
			value := symbol_low_level
		end

	set_identifier is
		do
			value := identifier_low_level
		end

	set_identifier_null is
		do
			value := identifier_null_low_level
		end

	set_comment_single is
		do
			value := comment_single_low_level
		end

	set_comment_multi is
		do
			value := comment_multi_low_level
		end

	set_last is
		do
			value := last_low_level
		end

feature {ANY} -- Queries
	is_eof: BOOLEAN is
		do
			Result := (value=eof_low_level)
		end

	is_left_paren: BOOLEAN is
		do
			Result := (value=left_paren_low_level)
		end

	is_right_paren: BOOLEAN is
		do
			Result := (value=right_paren_low_level)
		end

	is_left_curly: BOOLEAN is
		do
			Result := (value=left_curly_low_level)
		end

	is_right_curly: BOOLEAN is
		do
			Result := (value=right_curly_low_level)
		end

	is_left_brace: BOOLEAN is
		do
			Result := (value=left_brace_low_level)
		end

	is_right_brace: BOOLEAN is
		do
			Result := (value=right_brace_low_level)
		end

	is_equal_sign: BOOLEAN is
		do
			Result := (value=equal_sign_low_level)
		end

	is_comma: BOOLEAN is
		do
			Result := (value=comma_low_level)
		end

	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	is_char: BOOLEAN is
		do
			Result := (value=char_low_level)
		end

	is_binary: BOOLEAN is
		do
			Result := (value=binary_low_level)
		end

	is_octal: BOOLEAN is
		do
			Result := (value=octal_low_level)
		end

	is_int: BOOLEAN is
		do
			Result := (value=int_low_level)
		end

	is_hex: BOOLEAN is
		do
			Result := (value=hex_low_level)
		end

	is_float: BOOLEAN is
		do
			Result := (value=float_low_level)
		end

	is_string: BOOLEAN is
		do
			Result := (value=string_low_level)
		end

	is_symbol: BOOLEAN is
		do
			Result := (value=symbol_low_level)
		end

	is_identifier: BOOLEAN is
		do
			Result := (value=identifier_low_level)
		end

	is_identifier_null: BOOLEAN is
		do
			Result := (value=identifier_null_low_level)
		end

	is_comment_single: BOOLEAN is
		do
			Result := (value=comment_single_low_level)
		end

	is_comment_multi: BOOLEAN is
		do
			Result := (value=comment_multi_low_level)
		end

	is_last: BOOLEAN is
		do
			Result := (value=last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_EOF"
 			}"
 		end

	left_paren_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_PAREN"
 			}"
 		end

	right_paren_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_PAREN"
 			}"
 		end

	left_curly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_CURLY"
 			}"
 		end

	right_curly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_CURLY"
 			}"
 		end

	left_brace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_BRACE"
 			}"
 		end

	right_brace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_BRACE"
 			}"
 		end

	equal_sign_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_EQUAL_SIGN"
 			}"
 		end

	comma_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMA"
 			}"
 		end

	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_NONE"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_ERROR"
 			}"
 		end

	char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_CHAR"
 			}"
 		end

	binary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_BINARY"
 			}"
 		end

	octal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_OCTAL"
 			}"
 		end

	int_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_INT"
 			}"
 		end

	hex_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_HEX"
 			}"
 		end

	float_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_FLOAT"
 			}"
 		end

	string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_STRING"
 			}"
 		end

	symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_SYMBOL"
 			}"
 		end

	identifier_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER"
 			}"
 		end

	identifier_null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER_NULL"
 			}"
 		end

	comment_single_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_SINGLE"
 			}"
 		end

	comment_multi_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_MULTI"
 			}"
 		end

	last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LAST"
 			}"
 		end


end -- class GTOKEN_TYPE_ENUM
