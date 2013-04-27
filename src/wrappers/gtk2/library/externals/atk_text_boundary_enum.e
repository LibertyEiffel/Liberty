-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_TEXT_BOUNDARY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_text_boundary_char_low_level)  or else
				(a_value = atk_text_boundary_line_end_low_level)  or else
				(a_value = atk_text_boundary_line_start_low_level)  or else
				(a_value = atk_text_boundary_sentence_end_low_level)  or else
				(a_value = atk_text_boundary_sentence_start_low_level)  or else
				(a_value = atk_text_boundary_word_end_low_level)  or else
				(a_value = atk_text_boundary_word_start_low_level) )
		end

feature -- Setters
	default_create,
	set_atk_text_boundary_char is
		do
			value := atk_text_boundary_char_low_level
		end

	set_atk_text_boundary_line_end is
		do
			value := atk_text_boundary_line_end_low_level
		end

	set_atk_text_boundary_line_start is
		do
			value := atk_text_boundary_line_start_low_level
		end

	set_atk_text_boundary_sentence_end is
		do
			value := atk_text_boundary_sentence_end_low_level
		end

	set_atk_text_boundary_sentence_start is
		do
			value := atk_text_boundary_sentence_start_low_level
		end

	set_atk_text_boundary_word_end is
		do
			value := atk_text_boundary_word_end_low_level
		end

	set_atk_text_boundary_word_start is
		do
			value := atk_text_boundary_word_start_low_level
		end

feature -- Queries
	is_atk_text_boundary_char: BOOLEAN is
		do
			Result := (value=atk_text_boundary_char_low_level)
		end

	is_atk_text_boundary_line_end: BOOLEAN is
		do
			Result := (value=atk_text_boundary_line_end_low_level)
		end

	is_atk_text_boundary_line_start: BOOLEAN is
		do
			Result := (value=atk_text_boundary_line_start_low_level)
		end

	is_atk_text_boundary_sentence_end: BOOLEAN is
		do
			Result := (value=atk_text_boundary_sentence_end_low_level)
		end

	is_atk_text_boundary_sentence_start: BOOLEAN is
		do
			Result := (value=atk_text_boundary_sentence_start_low_level)
		end

	is_atk_text_boundary_word_end: BOOLEAN is
		do
			Result := (value=atk_text_boundary_word_end_low_level)
		end

	is_atk_text_boundary_word_start: BOOLEAN is
		do
			Result := (value=atk_text_boundary_word_start_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_text_boundary_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_CHAR"
 			}"
 		end

	atk_text_boundary_line_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_LINE_END"
 			}"
 		end

	atk_text_boundary_line_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_LINE_START"
 			}"
 		end

	atk_text_boundary_sentence_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_SENTENCE_END"
 			}"
 		end

	atk_text_boundary_sentence_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_SENTENCE_START"
 			}"
 		end

	atk_text_boundary_word_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_WORD_END"
 			}"
 		end

	atk_text_boundary_word_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_BOUNDARY_WORD_START"
 			}"
 		end


end -- class ATK_TEXT_BOUNDARY_ENUM
