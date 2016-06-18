-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_UNICODE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_unicode_control) or else 
				(a_value = g_unicode_format) or else 
				(a_value = g_unicode_unassigned) or else 
				(a_value = g_unicode_private_use) or else 
				(a_value = g_unicode_surrogate) or else 
				(a_value = g_unicode_lowercase_letter) or else 
				(a_value = g_unicode_modifier_letter) or else 
				(a_value = g_unicode_other_letter) or else 
				(a_value = g_unicode_titlecase_letter) or else 
				(a_value = g_unicode_uppercase_letter) or else 
				(a_value = g_unicode_combining_mark) or else 
				(a_value = g_unicode_enclosing_mark) or else 
				(a_value = g_unicode_non_spacing_mark) or else 
				(a_value = g_unicode_decimal_number) or else 
				(a_value = g_unicode_letter_number) or else 
				(a_value = g_unicode_other_number) or else 
				(a_value = g_unicode_connect_punctuation) or else 
				(a_value = g_unicode_dash_punctuation) or else 
				(a_value = g_unicode_close_punctuation) or else 
				(a_value = g_unicode_final_punctuation) or else 
				(a_value = g_unicode_initial_punctuation) or else 
				(a_value = g_unicode_other_punctuation) or else 
				(a_value = g_unicode_open_punctuation) or else 
				(a_value = g_unicode_currency_symbol) or else 
				(a_value = g_unicode_modifier_symbol) or else 
				(a_value = g_unicode_math_symbol) or else 
				(a_value = g_unicode_other_symbol) or else 
				(a_value = g_unicode_line_separator) or else 
				(a_value = g_unicode_paragraph_separator) or else 
				(a_value = g_unicode_space_separator))
		end


feature {ANY} -- Setters
	default_create, set_control
		do
			value := g_unicode_control
		end

	set_format
		do
			value := g_unicode_format
		end

	set_unassigned
		do
			value := g_unicode_unassigned
		end

	set_private_use
		do
			value := g_unicode_private_use
		end

	set_surrogate
		do
			value := g_unicode_surrogate
		end

	set_lowercase_letter
		do
			value := g_unicode_lowercase_letter
		end

	set_modifier_letter
		do
			value := g_unicode_modifier_letter
		end

	set_other_letter
		do
			value := g_unicode_other_letter
		end

	set_titlecase_letter
		do
			value := g_unicode_titlecase_letter
		end

	set_uppercase_letter
		do
			value := g_unicode_uppercase_letter
		end

	set_combining_mark
		do
			value := g_unicode_combining_mark
		end

	set_enclosing_mark
		do
			value := g_unicode_enclosing_mark
		end

	set_non_spacing_mark
		do
			value := g_unicode_non_spacing_mark
		end

	set_decimal_number
		do
			value := g_unicode_decimal_number
		end

	set_letter_number
		do
			value := g_unicode_letter_number
		end

	set_other_number
		do
			value := g_unicode_other_number
		end

	set_connect_punctuation
		do
			value := g_unicode_connect_punctuation
		end

	set_dash_punctuation
		do
			value := g_unicode_dash_punctuation
		end

	set_close_punctuation
		do
			value := g_unicode_close_punctuation
		end

	set_final_punctuation
		do
			value := g_unicode_final_punctuation
		end

	set_initial_punctuation
		do
			value := g_unicode_initial_punctuation
		end

	set_other_punctuation
		do
			value := g_unicode_other_punctuation
		end

	set_open_punctuation
		do
			value := g_unicode_open_punctuation
		end

	set_currency_symbol
		do
			value := g_unicode_currency_symbol
		end

	set_modifier_symbol
		do
			value := g_unicode_modifier_symbol
		end

	set_math_symbol
		do
			value := g_unicode_math_symbol
		end

	set_other_symbol
		do
			value := g_unicode_other_symbol
		end

	set_line_separator
		do
			value := g_unicode_line_separator
		end

	set_paragraph_separator
		do
			value := g_unicode_paragraph_separator
		end

	set_space_separator
		do
			value := g_unicode_space_separator
		end


feature {ANY} -- Queries
	is_control: BOOLEAN
		do
			Result := (value=g_unicode_control)
		end

	is_format: BOOLEAN
		do
			Result := (value=g_unicode_format)
		end

	is_unassigned: BOOLEAN
		do
			Result := (value=g_unicode_unassigned)
		end

	is_private_use: BOOLEAN
		do
			Result := (value=g_unicode_private_use)
		end

	is_surrogate: BOOLEAN
		do
			Result := (value=g_unicode_surrogate)
		end

	is_lowercase_letter: BOOLEAN
		do
			Result := (value=g_unicode_lowercase_letter)
		end

	is_modifier_letter: BOOLEAN
		do
			Result := (value=g_unicode_modifier_letter)
		end

	is_other_letter: BOOLEAN
		do
			Result := (value=g_unicode_other_letter)
		end

	is_titlecase_letter: BOOLEAN
		do
			Result := (value=g_unicode_titlecase_letter)
		end

	is_uppercase_letter: BOOLEAN
		do
			Result := (value=g_unicode_uppercase_letter)
		end

	is_combining_mark: BOOLEAN
		do
			Result := (value=g_unicode_combining_mark)
		end

	is_enclosing_mark: BOOLEAN
		do
			Result := (value=g_unicode_enclosing_mark)
		end

	is_non_spacing_mark: BOOLEAN
		do
			Result := (value=g_unicode_non_spacing_mark)
		end

	is_decimal_number: BOOLEAN
		do
			Result := (value=g_unicode_decimal_number)
		end

	is_letter_number: BOOLEAN
		do
			Result := (value=g_unicode_letter_number)
		end

	is_other_number: BOOLEAN
		do
			Result := (value=g_unicode_other_number)
		end

	is_connect_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_connect_punctuation)
		end

	is_dash_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_dash_punctuation)
		end

	is_close_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_close_punctuation)
		end

	is_final_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_final_punctuation)
		end

	is_initial_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_initial_punctuation)
		end

	is_other_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_other_punctuation)
		end

	is_open_punctuation: BOOLEAN
		do
			Result := (value=g_unicode_open_punctuation)
		end

	is_currency_symbol: BOOLEAN
		do
			Result := (value=g_unicode_currency_symbol)
		end

	is_modifier_symbol: BOOLEAN
		do
			Result := (value=g_unicode_modifier_symbol)
		end

	is_math_symbol: BOOLEAN
		do
			Result := (value=g_unicode_math_symbol)
		end

	is_other_symbol: BOOLEAN
		do
			Result := (value=g_unicode_other_symbol)
		end

	is_line_separator: BOOLEAN
		do
			Result := (value=g_unicode_line_separator)
		end

	is_paragraph_separator: BOOLEAN
		do
			Result := (value=g_unicode_paragraph_separator)
		end

	is_space_separator: BOOLEAN
		do
			Result := (value=g_unicode_space_separator)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_unicode_control: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_CONTROL"
		end

	g_unicode_format: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_FORMAT"
		end

	g_unicode_unassigned: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_UNASSIGNED"
		end

	g_unicode_private_use: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_PRIVATE_USE"
		end

	g_unicode_surrogate: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SURROGATE"
		end

	g_unicode_lowercase_letter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_LOWERCASE_LETTER"
		end

	g_unicode_modifier_letter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_MODIFIER_LETTER"
		end

	g_unicode_other_letter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_OTHER_LETTER"
		end

	g_unicode_titlecase_letter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_TITLECASE_LETTER"
		end

	g_unicode_uppercase_letter: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_UPPERCASE_LETTER"
		end

	g_unicode_combining_mark: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_COMBINING_MARK"
		end

	g_unicode_enclosing_mark: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_ENCLOSING_MARK"
		end

	g_unicode_non_spacing_mark: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_NON_SPACING_MARK"
		end

	g_unicode_decimal_number: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_DECIMAL_NUMBER"
		end

	g_unicode_letter_number: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_LETTER_NUMBER"
		end

	g_unicode_other_number: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_OTHER_NUMBER"
		end

	g_unicode_connect_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_CONNECT_PUNCTUATION"
		end

	g_unicode_dash_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_DASH_PUNCTUATION"
		end

	g_unicode_close_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_CLOSE_PUNCTUATION"
		end

	g_unicode_final_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_FINAL_PUNCTUATION"
		end

	g_unicode_initial_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_INITIAL_PUNCTUATION"
		end

	g_unicode_other_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_OTHER_PUNCTUATION"
		end

	g_unicode_open_punctuation: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_OPEN_PUNCTUATION"
		end

	g_unicode_currency_symbol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_CURRENCY_SYMBOL"
		end

	g_unicode_modifier_symbol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_MODIFIER_SYMBOL"
		end

	g_unicode_math_symbol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_MATH_SYMBOL"
		end

	g_unicode_other_symbol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_OTHER_SYMBOL"
		end

	g_unicode_line_separator: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_LINE_SEPARATOR"
		end

	g_unicode_paragraph_separator: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_PARAGRAPH_SEPARATOR"
		end

	g_unicode_space_separator: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_UNICODE_SPACE_SEPARATOR"
		end


end

