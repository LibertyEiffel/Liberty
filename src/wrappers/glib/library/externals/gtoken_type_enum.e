-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTOKEN_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = eof_low_level)  or else
				(a_value = right__paren_low_level)  or else
				(a_value = left__curly_low_level)  or else
				(a_value = right__curly_low_level)  or else
				(a_value = left__brace_low_level)  or else
				(a_value = right__brace_low_level)  or else
				(a_value = equal__sign_low_level)  or else
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
				(a_value = identifier__null_low_level)  or else
				(a_value = comment__single_low_level)  or else
				(a_value = comment__multi_low_level)  or else
				(a_value = last_low_level) )
		end

feature -- Setters
	default_create,
	set_eof is
		do
			value := eof_low_level
		end

	set_right__paren is
		do
			value := right__paren_low_level
		end

	set_left__curly is
		do
			value := left__curly_low_level
		end

	set_right__curly is
		do
			value := right__curly_low_level
		end

	set_left__brace is
		do
			value := left__brace_low_level
		end

	set_right__brace is
		do
			value := right__brace_low_level
		end

	set_equal__sign is
		do
			value := equal__sign_low_level
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

	set_identifier__null is
		do
			value := identifier__null_low_level
		end

	set_comment__single is
		do
			value := comment__single_low_level
		end

	set_comment__multi is
		do
			value := comment__multi_low_level
		end

	set_last is
		do
			value := last_low_level
		end

feature -- Queries
	is_eof: BOOLEAN is
		do
			Result := (value=eof_low_level)
		end

	is_right__paren: BOOLEAN is
		do
			Result := (value=right__paren_low_level)
		end

	is_left__curly: BOOLEAN is
		do
			Result := (value=left__curly_low_level)
		end

	is_right__curly: BOOLEAN is
		do
			Result := (value=right__curly_low_level)
		end

	is_left__brace: BOOLEAN is
		do
			Result := (value=left__brace_low_level)
		end

	is_right__brace: BOOLEAN is
		do
			Result := (value=right__brace_low_level)
		end

	is_equal__sign: BOOLEAN is
		do
			Result := (value=equal__sign_low_level)
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

	is_identifier__null: BOOLEAN is
		do
			Result := (value=identifier__null_low_level)
		end

	is_comment__single: BOOLEAN is
		do
			Result := (value=comment__single_low_level)
		end

	is_comment__multi: BOOLEAN is
		do
			Result := (value=comment__multi_low_level)
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

	right__paren_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_PAREN"
 			}"
 		end

	left__curly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_CURLY"
 			}"
 		end

	right__curly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_CURLY"
 			}"
 		end

	left__brace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_LEFT_BRACE"
 			}"
 		end

	right__brace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_RIGHT_BRACE"
 			}"
 		end

	equal__sign_low_level: INTEGER is
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

	identifier__null_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_IDENTIFIER_NULL"
 			}"
 		end

	comment__single_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TOKEN_COMMENT_SINGLE"
 			}"
 		end

	comment__multi_low_level: INTEGER is
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
