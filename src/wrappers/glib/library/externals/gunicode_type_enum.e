-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GUNICODE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = control_low_level)  or else
				(a_value = unassigned_low_level)  or else
				(a_value = private__use_low_level)  or else
				(a_value = surrogate_low_level)  or else
				(a_value = lowercase__letter_low_level)  or else
				(a_value = modifier__letter_low_level)  or else
				(a_value = other__letter_low_level)  or else
				(a_value = titlecase__letter_low_level)  or else
				(a_value = uppercase__letter_low_level)  or else
				(a_value = combining__mark_low_level)  or else
				(a_value = enclosing__mark_low_level)  or else
				(a_value = non__spacing__mark_low_level)  or else
				(a_value = decimal__number_low_level)  or else
				(a_value = letter__number_low_level)  or else
				(a_value = other__number_low_level)  or else
				(a_value = connect__punctuation_low_level)  or else
				(a_value = dash__punctuation_low_level)  or else
				(a_value = close__punctuation_low_level)  or else
				(a_value = final__punctuation_low_level)  or else
				(a_value = initial__punctuation_low_level)  or else
				(a_value = other__punctuation_low_level)  or else
				(a_value = open__punctuation_low_level)  or else
				(a_value = currency__symbol_low_level)  or else
				(a_value = modifier__symbol_low_level)  or else
				(a_value = math__symbol_low_level)  or else
				(a_value = other__symbol_low_level)  or else
				(a_value = line__separator_low_level)  or else
				(a_value = paragraph__separator_low_level)  or else
				(a_value = space__separator_low_level) )
		end

feature -- Setters
	default_create,
	set_control is
		do
			value := control_low_level
		end

	set_unassigned is
		do
			value := unassigned_low_level
		end

	set_private__use is
		do
			value := private__use_low_level
		end

	set_surrogate is
		do
			value := surrogate_low_level
		end

	set_lowercase__letter is
		do
			value := lowercase__letter_low_level
		end

	set_modifier__letter is
		do
			value := modifier__letter_low_level
		end

	set_other__letter is
		do
			value := other__letter_low_level
		end

	set_titlecase__letter is
		do
			value := titlecase__letter_low_level
		end

	set_uppercase__letter is
		do
			value := uppercase__letter_low_level
		end

	set_combining__mark is
		do
			value := combining__mark_low_level
		end

	set_enclosing__mark is
		do
			value := enclosing__mark_low_level
		end

	set_non__spacing__mark is
		do
			value := non__spacing__mark_low_level
		end

	set_decimal__number is
		do
			value := decimal__number_low_level
		end

	set_letter__number is
		do
			value := letter__number_low_level
		end

	set_other__number is
		do
			value := other__number_low_level
		end

	set_connect__punctuation is
		do
			value := connect__punctuation_low_level
		end

	set_dash__punctuation is
		do
			value := dash__punctuation_low_level
		end

	set_close__punctuation is
		do
			value := close__punctuation_low_level
		end

	set_final__punctuation is
		do
			value := final__punctuation_low_level
		end

	set_initial__punctuation is
		do
			value := initial__punctuation_low_level
		end

	set_other__punctuation is
		do
			value := other__punctuation_low_level
		end

	set_open__punctuation is
		do
			value := open__punctuation_low_level
		end

	set_currency__symbol is
		do
			value := currency__symbol_low_level
		end

	set_modifier__symbol is
		do
			value := modifier__symbol_low_level
		end

	set_math__symbol is
		do
			value := math__symbol_low_level
		end

	set_other__symbol is
		do
			value := other__symbol_low_level
		end

	set_line__separator is
		do
			value := line__separator_low_level
		end

	set_paragraph__separator is
		do
			value := paragraph__separator_low_level
		end

	set_space__separator is
		do
			value := space__separator_low_level
		end

feature -- Queries
	is_control: BOOLEAN is
		do
			Result := (value=control_low_level)
		end

	is_unassigned: BOOLEAN is
		do
			Result := (value=unassigned_low_level)
		end

	is_private__use: BOOLEAN is
		do
			Result := (value=private__use_low_level)
		end

	is_surrogate: BOOLEAN is
		do
			Result := (value=surrogate_low_level)
		end

	is_lowercase__letter: BOOLEAN is
		do
			Result := (value=lowercase__letter_low_level)
		end

	is_modifier__letter: BOOLEAN is
		do
			Result := (value=modifier__letter_low_level)
		end

	is_other__letter: BOOLEAN is
		do
			Result := (value=other__letter_low_level)
		end

	is_titlecase__letter: BOOLEAN is
		do
			Result := (value=titlecase__letter_low_level)
		end

	is_uppercase__letter: BOOLEAN is
		do
			Result := (value=uppercase__letter_low_level)
		end

	is_combining__mark: BOOLEAN is
		do
			Result := (value=combining__mark_low_level)
		end

	is_enclosing__mark: BOOLEAN is
		do
			Result := (value=enclosing__mark_low_level)
		end

	is_non__spacing__mark: BOOLEAN is
		do
			Result := (value=non__spacing__mark_low_level)
		end

	is_decimal__number: BOOLEAN is
		do
			Result := (value=decimal__number_low_level)
		end

	is_letter__number: BOOLEAN is
		do
			Result := (value=letter__number_low_level)
		end

	is_other__number: BOOLEAN is
		do
			Result := (value=other__number_low_level)
		end

	is_connect__punctuation: BOOLEAN is
		do
			Result := (value=connect__punctuation_low_level)
		end

	is_dash__punctuation: BOOLEAN is
		do
			Result := (value=dash__punctuation_low_level)
		end

	is_close__punctuation: BOOLEAN is
		do
			Result := (value=close__punctuation_low_level)
		end

	is_final__punctuation: BOOLEAN is
		do
			Result := (value=final__punctuation_low_level)
		end

	is_initial__punctuation: BOOLEAN is
		do
			Result := (value=initial__punctuation_low_level)
		end

	is_other__punctuation: BOOLEAN is
		do
			Result := (value=other__punctuation_low_level)
		end

	is_open__punctuation: BOOLEAN is
		do
			Result := (value=open__punctuation_low_level)
		end

	is_currency__symbol: BOOLEAN is
		do
			Result := (value=currency__symbol_low_level)
		end

	is_modifier__symbol: BOOLEAN is
		do
			Result := (value=modifier__symbol_low_level)
		end

	is_math__symbol: BOOLEAN is
		do
			Result := (value=math__symbol_low_level)
		end

	is_other__symbol: BOOLEAN is
		do
			Result := (value=other__symbol_low_level)
		end

	is_line__separator: BOOLEAN is
		do
			Result := (value=line__separator_low_level)
		end

	is_paragraph__separator: BOOLEAN is
		do
			Result := (value=paragraph__separator_low_level)
		end

	is_space__separator: BOOLEAN is
		do
			Result := (value=space__separator_low_level)
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

	unassigned_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UNASSIGNED"
 			}"
 		end

	private__use_low_level: INTEGER is
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

	lowercase__letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LOWERCASE_LETTER"
 			}"
 		end

	modifier__letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_LETTER"
 			}"
 		end

	other__letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_LETTER"
 			}"
 		end

	titlecase__letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_TITLECASE_LETTER"
 			}"
 		end

	uppercase__letter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_UPPERCASE_LETTER"
 			}"
 		end

	combining__mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_COMBINING_MARK"
 			}"
 		end

	enclosing__mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_ENCLOSING_MARK"
 			}"
 		end

	non__spacing__mark_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_NON_SPACING_MARK"
 			}"
 		end

	decimal__number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DECIMAL_NUMBER"
 			}"
 		end

	letter__number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LETTER_NUMBER"
 			}"
 		end

	other__number_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_NUMBER"
 			}"
 		end

	connect__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CONNECT_PUNCTUATION"
 			}"
 		end

	dash__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_DASH_PUNCTUATION"
 			}"
 		end

	close__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CLOSE_PUNCTUATION"
 			}"
 		end

	final__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_FINAL_PUNCTUATION"
 			}"
 		end

	initial__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_INITIAL_PUNCTUATION"
 			}"
 		end

	other__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_PUNCTUATION"
 			}"
 		end

	open__punctuation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OPEN_PUNCTUATION"
 			}"
 		end

	currency__symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_CURRENCY_SYMBOL"
 			}"
 		end

	modifier__symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MODIFIER_SYMBOL"
 			}"
 		end

	math__symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_MATH_SYMBOL"
 			}"
 		end

	other__symbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_OTHER_SYMBOL"
 			}"
 		end

	line__separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_LINE_SEPARATOR"
 			}"
 		end

	paragraph__separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_PARAGRAPH_SEPARATOR"
 			}"
 		end

	space__separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_UNICODE_SPACE_SEPARATOR"
 			}"
 		end


end -- class GUNICODE_TYPE_ENUM
