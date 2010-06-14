-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_TEXT_BOUNDARY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = char_low_level)  or else
				(a_value = word_start_low_level)  or else
				(a_value = word_end_low_level)  or else
				(a_value = sentence_start_low_level)  or else
				(a_value = sentence_end_low_level)  or else
				(a_value = line_start_low_level)  or else
				(a_value = line_end_low_level) )
		end

feature -- Setters
	default_create,
	set_char is
		do
			value := char_low_level
		end

	set_word_start is
		do
			value := word_start_low_level
		end

	set_word_end is
		do
			value := word_end_low_level
		end

	set_sentence_start is
		do
			value := sentence_start_low_level
		end

	set_sentence_end is
		do
			value := sentence_end_low_level
		end

	set_line_start is
		do
			value := line_start_low_level
		end

	set_line_end is
		do
			value := line_end_low_level
		end

feature -- Queries
	is_char: BOOLEAN is
		do
			Result := (value=char_low_level)
		end

	is_word_start: BOOLEAN is
		do
			Result := (value=word_start_low_level)
		end

	is_word_end: BOOLEAN is
		do
			Result := (value=word_end_low_level)
		end

	is_sentence_start: BOOLEAN is
		do
			Result := (value=sentence_start_low_level)
		end

	is_sentence_end: BOOLEAN is
		do
			Result := (value=sentence_end_low_level)
		end

	is_line_start: BOOLEAN is
		do
			Result := (value=line_start_low_level)
		end

	is_line_end: BOOLEAN is
		do
			Result := (value=line_end_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_CHAR"
 			}"
 		end

	word_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_WORD_START"
 			}"
 		end

	word_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_WORD_END"
 			}"
 		end

	sentence_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_SENTENCE_START"
 			}"
 		end

	sentence_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_SENTENCE_END"
 			}"
 		end

	line_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_LINE_START"
 			}"
 		end

	line_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_LINE_END"
 			}"
 		end


end -- class ATK_TEXT_BOUNDARY_ENUM
