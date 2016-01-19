-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_g_unicode_close_punctuation is
		do
			value := g_unicode_close_punctuation_low_level
		end

	set_g_unicode_connect_punctuation is
		do
			value := g_unicode_connect_punctuation_low_level
		end

	set_g_unicode_control is
		do
			value := g_unicode_control_low_level
		end

	set_g_unicode_currency_symbol is
		do
			value := g_unicode_currency_symbol_low_level
		end

	set_g_unicode_dash_punctuation is
		do
			value := g_unicode_dash_punctuation_low_level
		end

	set_g_unicode_decimal_number is
		do
			value := g_unicode_decimal_number_low_level
		end

	set_g_unicode_enclosing_mark is
		do
			value := g_unicode_enclosing_mark_low_level
		end

	set_g_unicode_final_punctuation is
		do
			value := g_unicode_final_punctuation_low_level
		end

	set_g_unicode_format is
		do
			value := g_unicode_format_low_level
		end

	set_g_unicode_initial_punctuation is
		do
			value := g_unicode_initial_punctuation_low_level
		end

	set_g_unicode_letter_number is
		do
			value := g_unicode_letter_number_low_level
		end

	set_g_unicode_line_separator is
		do
			value := g_unicode_line_separator_low_level
		end

	set_g_unicode_lowercase_letter is
		do
			value := g_unicode_lowercase_letter_low_level
		end

	set_g_unicode_math_symbol is
		do
			value := g_unicode_math_symbol_low_level
		end

	set_g_unicode_modifier_letter is
		do
			value := g_unicode_modifier_letter_low_level
		end

	set_g_unicode_modifier_symbol is
		do
			value := g_unicode_modifier_symbol_low_level
		end

	set_g_unicode_non_spacing_mark is
		do
			value := g_unicode_non_spacing_mark_low_level
		end

	set_g_unicode_open_punctuation is
		do
			value := g_unicode_open_punctuation_low_level
		end

	set_g_unicode_other_letter is
		do
			value := g_unicode_other_letter_low_level
		end

	set_g_unicode_other_number is
		do
			value := g_unicode_other_number_low_level
		end

	set_g_unicode_other_punctuation is
		do
			value := g_unicode_other_punctuation_low_level
		end

	set_g_unicode_other_symbol is
		do
			value := g_unicode_other_symbol_low_level
		end

	set_g_unicode_paragraph_separator is
		do
			value := g_unicode_paragraph_separator_low_level
		end

	set_g_unicode_private_use is
		do
			value := g_unicode_private_use_low_level
		end

	set_g_unicode_space_separator is
		do
			value := g_unicode_space_separator_low_level
		end

	set_g_unicode_spacing_mark is
		do
			value := g_unicode_spacing_mark_low_level
		end

	set_g_unicode_surrogate is
		do
			value := g_unicode_surrogate_low_level
		end

	set_g_unicode_titlecase_letter is
		do
			value := g_unicode_titlecase_letter_low_level
		end

	set_g_unicode_unassigned is
		do
			value := g_unicode_unassigned_low_level
		end

	set_g_unicode_uppercase_letter is
		do
			value := g_unicode_uppercase_letter_low_level
		end

feature {ANY} -- Queries
	is_g_unicode_close_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_close_punctuation_low_level)
		end

	is_g_unicode_connect_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_connect_punctuation_low_level)
		end

	is_g_unicode_control: BOOLEAN is
		do
			Result := (value=g_unicode_control_low_level)
		end

	is_g_unicode_currency_symbol: BOOLEAN is
		do
			Result := (value=g_unicode_currency_symbol_low_level)
		end

	is_g_unicode_dash_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_dash_punctuation_low_level)
		end

	is_g_unicode_decimal_number: BOOLEAN is
		do
			Result := (value=g_unicode_decimal_number_low_level)
		end

	is_g_unicode_enclosing_mark: BOOLEAN is
		do
			Result := (value=g_unicode_enclosing_mark_low_level)
		end

	is_g_unicode_final_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_final_punctuation_low_level)
		end

	is_g_unicode_format: BOOLEAN is
		do
			Result := (value=g_unicode_format_low_level)
		end

	is_g_unicode_initial_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_initial_punctuation_low_level)
		end

	is_g_unicode_letter_number: BOOLEAN is
		do
			Result := (value=g_unicode_letter_number_low_level)
		end

	is_g_unicode_line_separator: BOOLEAN is
		do
			Result := (value=g_unicode_line_separator_low_level)
		end

	is_g_unicode_lowercase_letter: BOOLEAN is
		do
			Result := (value=g_unicode_lowercase_letter_low_level)
		end

	is_g_unicode_math_symbol: BOOLEAN is
		do
			Result := (value=g_unicode_math_symbol_low_level)
		end

	is_g_unicode_modifier_letter: BOOLEAN is
		do
			Result := (value=g_unicode_modifier_letter_low_level)
		end

	is_g_unicode_modifier_symbol: BOOLEAN is
		do
			Result := (value=g_unicode_modifier_symbol_low_level)
		end

	is_g_unicode_non_spacing_mark: BOOLEAN is
		do
			Result := (value=g_unicode_non_spacing_mark_low_level)
		end

	is_g_unicode_open_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_open_punctuation_low_level)
		end

	is_g_unicode_other_letter: BOOLEAN is
		do
			Result := (value=g_unicode_other_letter_low_level)
		end

	is_g_unicode_other_number: BOOLEAN is
		do
			Result := (value=g_unicode_other_number_low_level)
		end

	is_g_unicode_other_punctuation: BOOLEAN is
		do
			Result := (value=g_unicode_other_punctuation_low_level)
		end

	is_g_unicode_other_symbol: BOOLEAN is
		do
			Result := (value=g_unicode_other_symbol_low_level)
		end

	is_g_unicode_paragraph_separator: BOOLEAN is
		do
			Result := (value=g_unicode_paragraph_separator_low_level)
		end

	is_g_unicode_private_use: BOOLEAN is
		do
			Result := (value=g_unicode_private_use_low_level)
		end

	is_g_unicode_space_separator: BOOLEAN is
		do
			Result := (value=g_unicode_space_separator_low_level)
		end

	is_g_unicode_spacing_mark: BOOLEAN is
		do
			Result := (value=g_unicode_spacing_mark_low_level)
		end

	is_g_unicode_surrogate: BOOLEAN is
		do
			Result := (value=g_unicode_surrogate_low_level)
		end

	is_g_unicode_titlecase_letter: BOOLEAN is
		do
			Result := (value=g_unicode_titlecase_letter_low_level)
		end

	is_g_unicode_unassigned: BOOLEAN is
		do
			Result := (value=g_unicode_unassigned_low_level)
		end

	is_g_unicode_uppercase_letter: BOOLEAN is
		do
			Result := (value=g_unicode_uppercase_letter_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_close_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CLOSE_PUNCTUATION"
 			}"
 		end

	g_unicode_connect_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONNECT_PUNCTUATION"
 			}"
 		end

	g_unicode_control_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONTROL"
 			}"
 		end

	g_unicode_currency_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CURRENCY_SYMBOL"
 			}"
 		end

	g_unicode_dash_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DASH_PUNCTUATION"
 			}"
 		end

	g_unicode_decimal_number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DECIMAL_NUMBER"
 			}"
 		end

	g_unicode_enclosing_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_ENCLOSING_MARK"
 			}"
 		end

	g_unicode_final_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FINAL_PUNCTUATION"
 			}"
 		end

	g_unicode_format_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FORMAT"
 			}"
 		end

	g_unicode_initial_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_INITIAL_PUNCTUATION"
 			}"
 		end

	g_unicode_letter_number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LETTER_NUMBER"
 			}"
 		end

	g_unicode_line_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LINE_SEPARATOR"
 			}"
 		end

	g_unicode_lowercase_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LOWERCASE_LETTER"
 			}"
 		end

	g_unicode_math_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MATH_SYMBOL"
 			}"
 		end

	g_unicode_modifier_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_LETTER"
 			}"
 		end

	g_unicode_modifier_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_SYMBOL"
 			}"
 		end

	g_unicode_non_spacing_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_NON_SPACING_MARK"
 			}"
 		end

	g_unicode_open_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OPEN_PUNCTUATION"
 			}"
 		end

	g_unicode_other_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_LETTER"
 			}"
 		end

	g_unicode_other_number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_NUMBER"
 			}"
 		end

	g_unicode_other_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_PUNCTUATION"
 			}"
 		end

	g_unicode_other_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_SYMBOL"
 			}"
 		end

	g_unicode_paragraph_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PARAGRAPH_SEPARATOR"
 			}"
 		end

	g_unicode_private_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PRIVATE_USE"
 			}"
 		end

	g_unicode_space_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SPACE_SEPARATOR"
 			}"
 		end

	g_unicode_spacing_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SPACING_MARK"
 			}"
 		end

	g_unicode_surrogate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SURROGATE"
 			}"
 		end

	g_unicode_titlecase_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_TITLECASE_LETTER"
 			}"
 		end

	g_unicode_unassigned_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UNASSIGNED"
 			}"
 		end

	g_unicode_uppercase_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UPPERCASE_LETTER"
 			}"
 		end


end -- class GUNICODETYPE_ENUM
