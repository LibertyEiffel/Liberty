-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTOKEN_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = binary_low_level)  or else
				(a_value = char_low_level)  or else
				(a_value = comma_low_level)  or else
				(a_value = comment_multi_low_level)  or else
				(a_value = comment_single_low_level)  or else
				(a_value = eof_low_level)  or else
				(a_value = equal_sign_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = float_low_level)  or else
				(a_value = hex_low_level)  or else
				(a_value = identifier_low_level)  or else
				(a_value = identifier_null_low_level)  or else
				(a_value = int_low_level)  or else
				(a_value = last_low_level)  or else
				(a_value = left_brace_low_level)  or else
				(a_value = left_curly_low_level)  or else
				(a_value = left_paren_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = octal_low_level)  or else
				(a_value = right_brace_low_level)  or else
				(a_value = right_curly_low_level)  or else
				(a_value = right_paren_low_level)  or else
				(a_value = string_low_level)  or else
				(a_value = symbol_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_binary
               do
                       value := binary_low_level
               end

	set_char
               do
                       value := char_low_level
               end

	set_comma
               do
                       value := comma_low_level
               end

	set_comment_multi
               do
                       value := comment_multi_low_level
               end

	set_comment_single
               do
                       value := comment_single_low_level
               end

	set_eof
               do
                       value := eof_low_level
               end

	set_equal_sign
               do
                       value := equal_sign_low_level
               end

	set_error
               do
                       value := error_low_level
               end

	set_float
               do
                       value := float_low_level
               end

	set_hex
               do
                       value := hex_low_level
               end

	set_identifier
               do
                       value := identifier_low_level
               end

	set_identifier_null
               do
                       value := identifier_null_low_level
               end

	set_int
               do
                       value := int_low_level
               end

	set_last
               do
                       value := last_low_level
               end

	set_left_brace
               do
                       value := left_brace_low_level
               end

	set_left_curly
               do
                       value := left_curly_low_level
               end

	set_left_paren
               do
                       value := left_paren_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_octal
               do
                       value := octal_low_level
               end

	set_right_brace
               do
                       value := right_brace_low_level
               end

	set_right_curly
               do
                       value := right_curly_low_level
               end

	set_right_paren
               do
                       value := right_paren_low_level
               end

	set_string
               do
                       value := string_low_level
               end

	set_symbol
               do
                       value := symbol_low_level
               end

feature {ANY} -- Queries
       is_binary: BOOLEAN
               do
                       Result := (value=binary_low_level)
               end

       is_char: BOOLEAN
               do
                       Result := (value=char_low_level)
               end

       is_comma: BOOLEAN
               do
                       Result := (value=comma_low_level)
               end

       is_comment_multi: BOOLEAN
               do
                       Result := (value=comment_multi_low_level)
               end

       is_comment_single: BOOLEAN
               do
                       Result := (value=comment_single_low_level)
               end

       is_eof: BOOLEAN
               do
                       Result := (value=eof_low_level)
               end

       is_equal_sign: BOOLEAN
               do
                       Result := (value=equal_sign_low_level)
               end

       is_error: BOOLEAN
               do
                       Result := (value=error_low_level)
               end

       is_float: BOOLEAN
               do
                       Result := (value=float_low_level)
               end

       is_hex: BOOLEAN
               do
                       Result := (value=hex_low_level)
               end

       is_identifier: BOOLEAN
               do
                       Result := (value=identifier_low_level)
               end

       is_identifier_null: BOOLEAN
               do
                       Result := (value=identifier_null_low_level)
               end

       is_int: BOOLEAN
               do
                       Result := (value=int_low_level)
               end

       is_last: BOOLEAN
               do
                       Result := (value=last_low_level)
               end

       is_left_brace: BOOLEAN
               do
                       Result := (value=left_brace_low_level)
               end

       is_left_curly: BOOLEAN
               do
                       Result := (value=left_curly_low_level)
               end

       is_left_paren: BOOLEAN
               do
                       Result := (value=left_paren_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_octal: BOOLEAN
               do
                       Result := (value=octal_low_level)
               end

       is_right_brace: BOOLEAN
               do
                       Result := (value=right_brace_low_level)
               end

       is_right_curly: BOOLEAN
               do
                       Result := (value=right_curly_low_level)
               end

       is_right_paren: BOOLEAN
               do
                       Result := (value=right_paren_low_level)
               end

       is_string: BOOLEAN
               do
                       Result := (value=string_low_level)
               end

       is_symbol: BOOLEAN
               do
                       Result := (value=symbol_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     binary_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_BINARY"
                       }"
               end

     char_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_CHAR"
                       }"
               end

     comma_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_COMMA"
                       }"
               end

     comment_multi_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_COMMENT_MULTI"
                       }"
               end

     comment_single_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_COMMENT_SINGLE"
                       }"
               end

     eof_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_EOF"
                       }"
               end

     equal_sign_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_EQUAL_SIGN"
                       }"
               end

     error_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_ERROR"
                       }"
               end

     float_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_FLOAT"
                       }"
               end

     hex_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_HEX"
                       }"
               end

     identifier_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_IDENTIFIER"
                       }"
               end

     identifier_null_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_IDENTIFIER_NULL"
                       }"
               end

     int_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_INT"
                       }"
               end

     last_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_LAST"
                       }"
               end

     left_brace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_LEFT_BRACE"
                       }"
               end

     left_curly_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_LEFT_CURLY"
                       }"
               end

     left_paren_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_LEFT_PAREN"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_NONE"
                       }"
               end

     octal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_OCTAL"
                       }"
               end

     right_brace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_RIGHT_BRACE"
                       }"
               end

     right_curly_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_RIGHT_CURLY"
                       }"
               end

     right_paren_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_RIGHT_PAREN"
                       }"
               end

     string_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_STRING"
                       }"
               end

     symbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_TOKEN_SYMBOL"
                       }"
               end


end -- class GTOKEN_TYPE_ENUM
