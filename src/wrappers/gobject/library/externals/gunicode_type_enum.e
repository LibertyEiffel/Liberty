-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_unicode_close_punctuation_low_level)  or else
				(a_value = g_unicode_connect_punctuation_low_level)  or else
				(a_value = g_unicode_control_low_level)  or else
				(a_value = g_unicode_currency_symbol_low_level)  or else
				(a_value = g_unicode_dash_punctuation_low_level)  or else
				(a_value = g_unicode_decimal_number_low_level)  or else
				(a_value = g_unicode_enclosing_mark_low_level)  or else
				(a_value = g_unicode_final_punctuation_low_level)  or else
				(a_value = g_unicode_format_low_level)  or else
				(a_value = g_unicode_initial_punctuation_low_level)  or else
				(a_value = g_unicode_letter_number_low_level)  or else
				(a_value = g_unicode_line_separator_low_level)  or else
				(a_value = g_unicode_lowercase_letter_low_level)  or else
				(a_value = g_unicode_math_symbol_low_level)  or else
				(a_value = g_unicode_modifier_letter_low_level)  or else
				(a_value = g_unicode_modifier_symbol_low_level)  or else
				(a_value = g_unicode_non_spacing_mark_low_level)  or else
				(a_value = g_unicode_open_punctuation_low_level)  or else
				(a_value = g_unicode_other_letter_low_level)  or else
				(a_value = g_unicode_other_number_low_level)  or else
				(a_value = g_unicode_other_punctuation_low_level)  or else
				(a_value = g_unicode_other_symbol_low_level)  or else
				(a_value = g_unicode_paragraph_separator_low_level)  or else
				(a_value = g_unicode_private_use_low_level)  or else
				(a_value = g_unicode_space_separator_low_level)  or else
				(a_value = g_unicode_spacing_mark_low_level)  or else
				(a_value = g_unicode_surrogate_low_level)  or else
				(a_value = g_unicode_titlecase_letter_low_level)  or else
				(a_value = g_unicode_unassigned_low_level)  or else
				(a_value = g_unicode_uppercase_letter_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_unicode_close_punctuation
		do
			value := g_unicode_close_punctuation_low_level
		end

	set_g_unicode_connect_punctuation
		do
			value := g_unicode_connect_punctuation_low_level
		end

	set_g_unicode_control
		do
			value := g_unicode_control_low_level
		end

	set_g_unicode_currency_symbol
		do
			value := g_unicode_currency_symbol_low_level
		end

	set_g_unicode_dash_punctuation
		do
			value := g_unicode_dash_punctuation_low_level
		end

	set_g_unicode_decimal_number
		do
			value := g_unicode_decimal_number_low_level
		end

	set_g_unicode_enclosing_mark
		do
			value := g_unicode_enclosing_mark_low_level
		end

	set_g_unicode_final_punctuation
		do
			value := g_unicode_final_punctuation_low_level
		end

	set_g_unicode_format
		do
			value := g_unicode_format_low_level
		end

	set_g_unicode_initial_punctuation
		do
			value := g_unicode_initial_punctuation_low_level
		end

	set_g_unicode_letter_number
		do
			value := g_unicode_letter_number_low_level
		end

	set_g_unicode_line_separator
		do
			value := g_unicode_line_separator_low_level
		end

	set_g_unicode_lowercase_letter
		do
			value := g_unicode_lowercase_letter_low_level
		end

	set_g_unicode_math_symbol
		do
			value := g_unicode_math_symbol_low_level
		end

	set_g_unicode_modifier_letter
		do
			value := g_unicode_modifier_letter_low_level
		end

	set_g_unicode_modifier_symbol
		do
			value := g_unicode_modifier_symbol_low_level
		end

	set_g_unicode_non_spacing_mark
		do
			value := g_unicode_non_spacing_mark_low_level
		end

	set_g_unicode_open_punctuation
		do
			value := g_unicode_open_punctuation_low_level
		end

	set_g_unicode_other_letter
		do
			value := g_unicode_other_letter_low_level
		end

	set_g_unicode_other_number
		do
			value := g_unicode_other_number_low_level
		end

	set_g_unicode_other_punctuation
		do
			value := g_unicode_other_punctuation_low_level
		end

	set_g_unicode_other_symbol
		do
			value := g_unicode_other_symbol_low_level
		end

	set_g_unicode_paragraph_separator
		do
			value := g_unicode_paragraph_separator_low_level
		end

	set_g_unicode_private_use
		do
			value := g_unicode_private_use_low_level
		end

	set_g_unicode_space_separator
		do
			value := g_unicode_space_separator_low_level
		end

	set_g_unicode_spacing_mark
		do
			value := g_unicode_spacing_mark_low_level
		end

	set_g_unicode_surrogate
		do
			value := g_unicode_surrogate_low_level
		end

	set_g_unicode_titlecase_letter
		do
			value := g_unicode_titlecase_letter_low_level
		end

	set_g_unicode_unassigned
		do
			value := g_unicode_unassigned_low_level
		end

	set_g_unicode_uppercase_letter
		do
			value := g_unicode_uppercase_letter_low_level
		end

feature {ANY} -- Queries
	is_g_unicode_close_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_close_punctuation_low_level)
		end

	is_g_unicode_connect_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_connect_punctuation_low_level)
		end

	is_g_unicode_control: BOOLEAN
		do
			Result := (value=g_unicode_control_low_level)
		end

	is_g_unicode_currency_symbol: BOOLEAN
		do
			Result := (value=g_unicode_currency_symbol_low_level)
		end

	is_g_unicode_dash_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_dash_punctuation_low_level)
		end

	is_g_unicode_decimal_number: BOOLEAN
		do
			Result := (value=g_unicode_decimal_number_low_level)
		end

	is_g_unicode_enclosing_mark: BOOLEAN
		do
			Result := (value=g_unicode_enclosing_mark_low_level)
		end

	is_g_unicode_final_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_final_punctuation_low_level)
		end

	is_g_unicode_format: BOOLEAN
		do
			Result := (value=g_unicode_format_low_level)
		end

	is_g_unicode_initial_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_initial_punctuation_low_level)
		end

	is_g_unicode_letter_number: BOOLEAN
		do
			Result := (value=g_unicode_letter_number_low_level)
		end

	is_g_unicode_line_separator: BOOLEAN
		do
			Result := (value=g_unicode_line_separator_low_level)
		end

	is_g_unicode_lowercase_letter: BOOLEAN
		do
			Result := (value=g_unicode_lowercase_letter_low_level)
		end

	is_g_unicode_math_symbol: BOOLEAN
		do
			Result := (value=g_unicode_math_symbol_low_level)
		end

	is_g_unicode_modifier_letter: BOOLEAN
		do
			Result := (value=g_unicode_modifier_letter_low_level)
		end

	is_g_unicode_modifier_symbol: BOOLEAN
		do
			Result := (value=g_unicode_modifier_symbol_low_level)
		end

	is_g_unicode_non_spacing_mark: BOOLEAN
		do
			Result := (value=g_unicode_non_spacing_mark_low_level)
		end

	is_g_unicode_open_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_open_punctuation_low_level)
		end

	is_g_unicode_other_letter: BOOLEAN
		do
			Result := (value=g_unicode_other_letter_low_level)
		end

	is_g_unicode_other_number: BOOLEAN
		do
			Result := (value=g_unicode_other_number_low_level)
		end

	is_g_unicode_other_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_other_punctuation_low_level)
		end

	is_g_unicode_other_symbol: BOOLEAN
		do
			Result := (value=g_unicode_other_symbol_low_level)
		end

	is_g_unicode_paragraph_separator: BOOLEAN
		do
			Result := (value=g_unicode_paragraph_separator_low_level)
		end

	is_g_unicode_private_use: BOOLEAN
		do
			Result := (value=g_unicode_private_use_low_level)
		end

	is_g_unicode_space_separator: BOOLEAN
		do
			Result := (value=g_unicode_space_separator_low_level)
		end

	is_g_unicode_spacing_mark: BOOLEAN
		do
			Result := (value=g_unicode_spacing_mark_low_level)
		end

	is_g_unicode_surrogate: BOOLEAN
		do
			Result := (value=g_unicode_surrogate_low_level)
		end

	is_g_unicode_titlecase_letter: BOOLEAN
		do
			Result := (value=g_unicode_titlecase_letter_low_level)
		end

	is_g_unicode_unassigned: BOOLEAN
		do
			Result := (value=g_unicode_unassigned_low_level)
		end

	is_g_unicode_uppercase_letter: BOOLEAN
		do
			Result := (value=g_unicode_uppercase_letter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_close_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CLOSE_PUNCTUATION"
 			}"
 		end

	g_unicode_connect_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONNECT_PUNCTUATION"
 			}"
 		end

	g_unicode_control_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONTROL"
 			}"
 		end

	g_unicode_currency_symbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CURRENCY_SYMBOL"
 			}"
 		end

	g_unicode_dash_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DASH_PUNCTUATION"
 			}"
 		end

	g_unicode_decimal_number_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DECIMAL_NUMBER"
 			}"
 		end

	g_unicode_enclosing_mark_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_ENCLOSING_MARK"
 			}"
 		end

	g_unicode_final_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FINAL_PUNCTUATION"
 			}"
 		end

	g_unicode_format_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FORMAT"
 			}"
 		end

	g_unicode_initial_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_INITIAL_PUNCTUATION"
 			}"
 		end

	g_unicode_letter_number_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LETTER_NUMBER"
 			}"
 		end

	g_unicode_line_separator_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LINE_SEPARATOR"
 			}"
 		end

	g_unicode_lowercase_letter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LOWERCASE_LETTER"
 			}"
 		end

	g_unicode_math_symbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MATH_SYMBOL"
 			}"
 		end

	g_unicode_modifier_letter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_LETTER"
 			}"
 		end

	g_unicode_modifier_symbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_SYMBOL"
 			}"
 		end

	g_unicode_non_spacing_mark_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_NON_SPACING_MARK"
 			}"
 		end

	g_unicode_open_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OPEN_PUNCTUATION"
 			}"
 		end

	g_unicode_other_letter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_LETTER"
 			}"
 		end

	g_unicode_other_number_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_NUMBER"
 			}"
 		end

	g_unicode_other_punctuation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_PUNCTUATION"
 			}"
 		end

	g_unicode_other_symbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_SYMBOL"
 			}"
 		end

	g_unicode_paragraph_separator_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PARAGRAPH_SEPARATOR"
 			}"
 		end

	g_unicode_private_use_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PRIVATE_USE"
 			}"
 		end

	g_unicode_space_separator_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SPACE_SEPARATOR"
 			}"
 		end

	g_unicode_spacing_mark_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SPACING_MARK"
 			}"
 		end

	g_unicode_surrogate_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SURROGATE"
 			}"
 		end

	g_unicode_titlecase_letter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_TITLECASE_LETTER"
 			}"
 		end

	g_unicode_unassigned_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UNASSIGNED"
 			}"
 		end

	g_unicode_uppercase_letter_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UPPERCASE_LETTER"
 			}"
 		end


end -- class GUNICODE_TYPE_ENUM
