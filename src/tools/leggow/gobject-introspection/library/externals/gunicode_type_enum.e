-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GUNICODE_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = close_punctuation_low_level)  or else
				(a_value = connect_punctuation_low_level)  or else
				(a_value = control_low_level)  or else
				(a_value = currency_symbol_low_level)  or else
				(a_value = dash_punctuation_low_level)  or else
				(a_value = decimal_number_low_level)  or else
				(a_value = enclosing_mark_low_level)  or else
				(a_value = final_punctuation_low_level)  or else
				(a_value = format_low_level)  or else
				(a_value = initial_punctuation_low_level)  or else
				(a_value = letter_number_low_level)  or else
				(a_value = line_separator_low_level)  or else
				(a_value = lowercase_letter_low_level)  or else
				(a_value = math_symbol_low_level)  or else
				(a_value = modifier_letter_low_level)  or else
				(a_value = modifier_symbol_low_level)  or else
				(a_value = non_spacing_mark_low_level)  or else
				(a_value = open_punctuation_low_level)  or else
				(a_value = other_letter_low_level)  or else
				(a_value = other_number_low_level)  or else
				(a_value = other_punctuation_low_level)  or else
				(a_value = other_symbol_low_level)  or else
				(a_value = paragraph_separator_low_level)  or else
				(a_value = private_use_low_level)  or else
				(a_value = space_separator_low_level)  or else
				(a_value = spacing_mark_low_level)  or else
				(a_value = surrogate_low_level)  or else
				(a_value = titlecase_letter_low_level)  or else
				(a_value = unassigned_low_level)  or else
				(a_value = uppercase_letter_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_close_punctuation
               do
                       value := close_punctuation_low_level
               end

	set_connect_punctuation
               do
                       value := connect_punctuation_low_level
               end

	set_control
               do
                       value := control_low_level
               end

	set_currency_symbol
               do
                       value := currency_symbol_low_level
               end

	set_dash_punctuation
               do
                       value := dash_punctuation_low_level
               end

	set_decimal_number
               do
                       value := decimal_number_low_level
               end

	set_enclosing_mark
               do
                       value := enclosing_mark_low_level
               end

	set_final_punctuation
               do
                       value := final_punctuation_low_level
               end

	set_format
               do
                       value := format_low_level
               end

	set_initial_punctuation
               do
                       value := initial_punctuation_low_level
               end

	set_letter_number
               do
                       value := letter_number_low_level
               end

	set_line_separator
               do
                       value := line_separator_low_level
               end

	set_lowercase_letter
               do
                       value := lowercase_letter_low_level
               end

	set_math_symbol
               do
                       value := math_symbol_low_level
               end

	set_modifier_letter
               do
                       value := modifier_letter_low_level
               end

	set_modifier_symbol
               do
                       value := modifier_symbol_low_level
               end

	set_non_spacing_mark
               do
                       value := non_spacing_mark_low_level
               end

	set_open_punctuation
               do
                       value := open_punctuation_low_level
               end

	set_other_letter
               do
                       value := other_letter_low_level
               end

	set_other_number
               do
                       value := other_number_low_level
               end

	set_other_punctuation
               do
                       value := other_punctuation_low_level
               end

	set_other_symbol
               do
                       value := other_symbol_low_level
               end

	set_paragraph_separator
               do
                       value := paragraph_separator_low_level
               end

	set_private_use
               do
                       value := private_use_low_level
               end

	set_space_separator
               do
                       value := space_separator_low_level
               end

	set_spacing_mark
               do
                       value := spacing_mark_low_level
               end

	set_surrogate
               do
                       value := surrogate_low_level
               end

	set_titlecase_letter
               do
                       value := titlecase_letter_low_level
               end

	set_unassigned
               do
                       value := unassigned_low_level
               end

	set_uppercase_letter
               do
                       value := uppercase_letter_low_level
               end

feature {ANY} -- Queries
       is_close_punctuation: BOOLEAN
               do
                       Result := (value=close_punctuation_low_level)
               end

       is_connect_punctuation: BOOLEAN
               do
                       Result := (value=connect_punctuation_low_level)
               end

       is_control: BOOLEAN
               do
                       Result := (value=control_low_level)
               end

       is_currency_symbol: BOOLEAN
               do
                       Result := (value=currency_symbol_low_level)
               end

       is_dash_punctuation: BOOLEAN
               do
                       Result := (value=dash_punctuation_low_level)
               end

       is_decimal_number: BOOLEAN
               do
                       Result := (value=decimal_number_low_level)
               end

       is_enclosing_mark: BOOLEAN
               do
                       Result := (value=enclosing_mark_low_level)
               end

       is_final_punctuation: BOOLEAN
               do
                       Result := (value=final_punctuation_low_level)
               end

       is_format: BOOLEAN
               do
                       Result := (value=format_low_level)
               end

       is_initial_punctuation: BOOLEAN
               do
                       Result := (value=initial_punctuation_low_level)
               end

       is_letter_number: BOOLEAN
               do
                       Result := (value=letter_number_low_level)
               end

       is_line_separator: BOOLEAN
               do
                       Result := (value=line_separator_low_level)
               end

       is_lowercase_letter: BOOLEAN
               do
                       Result := (value=lowercase_letter_low_level)
               end

       is_math_symbol: BOOLEAN
               do
                       Result := (value=math_symbol_low_level)
               end

       is_modifier_letter: BOOLEAN
               do
                       Result := (value=modifier_letter_low_level)
               end

       is_modifier_symbol: BOOLEAN
               do
                       Result := (value=modifier_symbol_low_level)
               end

       is_non_spacing_mark: BOOLEAN
               do
                       Result := (value=non_spacing_mark_low_level)
               end

       is_open_punctuation: BOOLEAN
               do
                       Result := (value=open_punctuation_low_level)
               end

       is_other_letter: BOOLEAN
               do
                       Result := (value=other_letter_low_level)
               end

       is_other_number: BOOLEAN
               do
                       Result := (value=other_number_low_level)
               end

       is_other_punctuation: BOOLEAN
               do
                       Result := (value=other_punctuation_low_level)
               end

       is_other_symbol: BOOLEAN
               do
                       Result := (value=other_symbol_low_level)
               end

       is_paragraph_separator: BOOLEAN
               do
                       Result := (value=paragraph_separator_low_level)
               end

       is_private_use: BOOLEAN
               do
                       Result := (value=private_use_low_level)
               end

       is_space_separator: BOOLEAN
               do
                       Result := (value=space_separator_low_level)
               end

       is_spacing_mark: BOOLEAN
               do
                       Result := (value=spacing_mark_low_level)
               end

       is_surrogate: BOOLEAN
               do
                       Result := (value=surrogate_low_level)
               end

       is_titlecase_letter: BOOLEAN
               do
                       Result := (value=titlecase_letter_low_level)
               end

       is_unassigned: BOOLEAN
               do
                       Result := (value=unassigned_low_level)
               end

       is_uppercase_letter: BOOLEAN
               do
                       Result := (value=uppercase_letter_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     close_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_CLOSE_PUNCTUATION"
                       }"
               end

     connect_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_CONNECT_PUNCTUATION"
                       }"
               end

     control_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_CONTROL"
                       }"
               end

     currency_symbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_CURRENCY_SYMBOL"
                       }"
               end

     dash_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_DASH_PUNCTUATION"
                       }"
               end

     decimal_number_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_DECIMAL_NUMBER"
                       }"
               end

     enclosing_mark_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_ENCLOSING_MARK"
                       }"
               end

     final_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_FINAL_PUNCTUATION"
                       }"
               end

     format_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_FORMAT"
                       }"
               end

     initial_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_INITIAL_PUNCTUATION"
                       }"
               end

     letter_number_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_LETTER_NUMBER"
                       }"
               end

     line_separator_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_LINE_SEPARATOR"
                       }"
               end

     lowercase_letter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_LOWERCASE_LETTER"
                       }"
               end

     math_symbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_MATH_SYMBOL"
                       }"
               end

     modifier_letter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_MODIFIER_LETTER"
                       }"
               end

     modifier_symbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_MODIFIER_SYMBOL"
                       }"
               end

     non_spacing_mark_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_NON_SPACING_MARK"
                       }"
               end

     open_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_OPEN_PUNCTUATION"
                       }"
               end

     other_letter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_OTHER_LETTER"
                       }"
               end

     other_number_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_OTHER_NUMBER"
                       }"
               end

     other_punctuation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_OTHER_PUNCTUATION"
                       }"
               end

     other_symbol_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_OTHER_SYMBOL"
                       }"
               end

     paragraph_separator_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_PARAGRAPH_SEPARATOR"
                       }"
               end

     private_use_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_PRIVATE_USE"
                       }"
               end

     space_separator_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SPACE_SEPARATOR"
                       }"
               end

     spacing_mark_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SPACING_MARK"
                       }"
               end

     surrogate_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_SURROGATE"
                       }"
               end

     titlecase_letter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_TITLECASE_LETTER"
                       }"
               end

     unassigned_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_UNASSIGNED"
                       }"
               end

     uppercase_letter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_UNICODE_UPPERCASE_LETTER"
                       }"
               end


end -- class GUNICODE_TYPE_ENUM
