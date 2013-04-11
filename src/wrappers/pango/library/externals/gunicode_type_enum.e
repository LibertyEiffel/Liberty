-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = control_low_level)  or else
				(a_value = format_low_level)  or else
				(a_value = unassigned_low_level)  or else
				(a_value = private_use_low_level)  or else
				(a_value = surrogate_low_level)  or else
				(a_value = lowercase_letter_low_level)  or else
				(a_value = modifier_letter_low_level)  or else
				(a_value = other_letter_low_level)  or else
				(a_value = titlecase_letter_low_level)  or else
				(a_value = uppercase_letter_low_level)  or else
				(a_value = combining_mark_low_level)  or else
				(a_value = enclosing_mark_low_level)  or else
				(a_value = non_spacing_mark_low_level)  or else
				(a_value = decimal_number_low_level)  or else
				(a_value = letter_number_low_level)  or else
				(a_value = other_number_low_level)  or else
				(a_value = connect_punctuation_low_level)  or else
				(a_value = dash_punctuation_low_level)  or else
				(a_value = close_punctuation_low_level)  or else
				(a_value = final_punctuation_low_level)  or else
				(a_value = initial_punctuation_low_level)  or else
				(a_value = other_punctuation_low_level)  or else
				(a_value = open_punctuation_low_level)  or else
				(a_value = currency_symbol_low_level)  or else
				(a_value = modifier_symbol_low_level)  or else
				(a_value = math_symbol_low_level)  or else
				(a_value = other_symbol_low_level)  or else
				(a_value = line_separator_low_level)  or else
				(a_value = paragraph_separator_low_level)  or else
				(a_value = space_separator_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_control is
		do
			value := control_low_level
		end

	set_format is
		do
			value := format_low_level
		end

	set_unassigned is
		do
			value := unassigned_low_level
		end

	set_private_use is
		do
			value := private_use_low_level
		end

	set_surrogate is
		do
			value := surrogate_low_level
		end

	set_lowercase_letter is
		do
			value := lowercase_letter_low_level
		end

	set_modifier_letter is
		do
			value := modifier_letter_low_level
		end

	set_other_letter is
		do
			value := other_letter_low_level
		end

	set_titlecase_letter is
		do
			value := titlecase_letter_low_level
		end

	set_uppercase_letter is
		do
			value := uppercase_letter_low_level
		end

	set_combining_mark is
		do
			value := combining_mark_low_level
		end

	set_enclosing_mark is
		do
			value := enclosing_mark_low_level
		end

	set_non_spacing_mark is
		do
			value := non_spacing_mark_low_level
		end

	set_decimal_number is
		do
			value := decimal_number_low_level
		end

	set_letter_number is
		do
			value := letter_number_low_level
		end

	set_other_number is
		do
			value := other_number_low_level
		end

	set_connect_punctuation is
		do
			value := connect_punctuation_low_level
		end

	set_dash_punctuation is
		do
			value := dash_punctuation_low_level
		end

	set_close_punctuation is
		do
			value := close_punctuation_low_level
		end

	set_final_punctuation is
		do
			value := final_punctuation_low_level
		end

	set_initial_punctuation is
		do
			value := initial_punctuation_low_level
		end

	set_other_punctuation is
		do
			value := other_punctuation_low_level
		end

	set_open_punctuation is
		do
			value := open_punctuation_low_level
		end

	set_currency_symbol is
		do
			value := currency_symbol_low_level
		end

	set_modifier_symbol is
		do
			value := modifier_symbol_low_level
		end

	set_math_symbol is
		do
			value := math_symbol_low_level
		end

	set_other_symbol is
		do
			value := other_symbol_low_level
		end

	set_line_separator is
		do
			value := line_separator_low_level
		end

	set_paragraph_separator is
		do
			value := paragraph_separator_low_level
		end

	set_space_separator is
		do
			value := space_separator_low_level
		end

feature {ANY} -- Queries
	is_control: BOOLEAN is
		do
			Result := (value=control_low_level)
		end

	is_format: BOOLEAN is
		do
			Result := (value=format_low_level)
		end

	is_unassigned: BOOLEAN is
		do
			Result := (value=unassigned_low_level)
		end

	is_private_use: BOOLEAN is
		do
			Result := (value=private_use_low_level)
		end

	is_surrogate: BOOLEAN is
		do
			Result := (value=surrogate_low_level)
		end

	is_lowercase_letter: BOOLEAN is
		do
			Result := (value=lowercase_letter_low_level)
		end

	is_modifier_letter: BOOLEAN is
		do
			Result := (value=modifier_letter_low_level)
		end

	is_other_letter: BOOLEAN is
		do
			Result := (value=other_letter_low_level)
		end

	is_titlecase_letter: BOOLEAN is
		do
			Result := (value=titlecase_letter_low_level)
		end

	is_uppercase_letter: BOOLEAN is
		do
			Result := (value=uppercase_letter_low_level)
		end

	is_combining_mark: BOOLEAN is
		do
			Result := (value=combining_mark_low_level)
		end

	is_enclosing_mark: BOOLEAN is
		do
			Result := (value=enclosing_mark_low_level)
		end

	is_non_spacing_mark: BOOLEAN is
		do
			Result := (value=non_spacing_mark_low_level)
		end

	is_decimal_number: BOOLEAN is
		do
			Result := (value=decimal_number_low_level)
		end

	is_letter_number: BOOLEAN is
		do
			Result := (value=letter_number_low_level)
		end

	is_other_number: BOOLEAN is
		do
			Result := (value=other_number_low_level)
		end

	is_connect_punctuation: BOOLEAN is
		do
			Result := (value=connect_punctuation_low_level)
		end

	is_dash_punctuation: BOOLEAN is
		do
			Result := (value=dash_punctuation_low_level)
		end

	is_close_punctuation: BOOLEAN is
		do
			Result := (value=close_punctuation_low_level)
		end

	is_final_punctuation: BOOLEAN is
		do
			Result := (value=final_punctuation_low_level)
		end

	is_initial_punctuation: BOOLEAN is
		do
			Result := (value=initial_punctuation_low_level)
		end

	is_other_punctuation: BOOLEAN is
		do
			Result := (value=other_punctuation_low_level)
		end

	is_open_punctuation: BOOLEAN is
		do
			Result := (value=open_punctuation_low_level)
		end

	is_currency_symbol: BOOLEAN is
		do
			Result := (value=currency_symbol_low_level)
		end

	is_modifier_symbol: BOOLEAN is
		do
			Result := (value=modifier_symbol_low_level)
		end

	is_math_symbol: BOOLEAN is
		do
			Result := (value=math_symbol_low_level)
		end

	is_other_symbol: BOOLEAN is
		do
			Result := (value=other_symbol_low_level)
		end

	is_line_separator: BOOLEAN is
		do
			Result := (value=line_separator_low_level)
		end

	is_paragraph_separator: BOOLEAN is
		do
			Result := (value=paragraph_separator_low_level)
		end

	is_space_separator: BOOLEAN is
		do
			Result := (value=space_separator_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	control_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONTROL"
 			}"
 		end

	format_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FORMAT"
 			}"
 		end

	unassigned_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UNASSIGNED"
 			}"
 		end

	private_use_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PRIVATE_USE"
 			}"
 		end

	surrogate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SURROGATE"
 			}"
 		end

	lowercase_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LOWERCASE_LETTER"
 			}"
 		end

	modifier_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_LETTER"
 			}"
 		end

	other_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_LETTER"
 			}"
 		end

	titlecase_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_TITLECASE_LETTER"
 			}"
 		end

	uppercase_letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UPPERCASE_LETTER"
 			}"
 		end

	combining_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_COMBINING_MARK"
 			}"
 		end

	enclosing_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_ENCLOSING_MARK"
 			}"
 		end

	non_spacing_mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_NON_SPACING_MARK"
 			}"
 		end

	decimal_number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DECIMAL_NUMBER"
 			}"
 		end

	letter_number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LETTER_NUMBER"
 			}"
 		end

	other_number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_NUMBER"
 			}"
 		end

	connect_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONNECT_PUNCTUATION"
 			}"
 		end

	dash_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DASH_PUNCTUATION"
 			}"
 		end

	close_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CLOSE_PUNCTUATION"
 			}"
 		end

	final_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FINAL_PUNCTUATION"
 			}"
 		end

	initial_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_INITIAL_PUNCTUATION"
 			}"
 		end

	other_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_PUNCTUATION"
 			}"
 		end

	open_punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OPEN_PUNCTUATION"
 			}"
 		end

	currency_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CURRENCY_SYMBOL"
 			}"
 		end

	modifier_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_SYMBOL"
 			}"
 		end

	math_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MATH_SYMBOL"
 			}"
 		end

	other_symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_SYMBOL"
 			}"
 		end

	line_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LINE_SEPARATOR"
 			}"
 		end

	paragraph_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PARAGRAPH_SEPARATOR"
 			}"
 		end

	space_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SPACE_SEPARATOR"
 			}"
 		end


end -- class GUNICODE_TYPE_ENUM
