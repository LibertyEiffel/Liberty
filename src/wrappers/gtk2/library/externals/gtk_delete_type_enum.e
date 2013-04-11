-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DELETE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = chars_low_level)  or else
				(a_value = word_ends_low_level)  or else
				(a_value = words_low_level)  or else
				(a_value = display_lines_low_level)  or else
				(a_value = display_line_ends_low_level)  or else
				(a_value = paragraph_ends_low_level)  or else
				(a_value = paragraphs_low_level)  or else
				(a_value = whitespace_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_chars is
		do
			value := chars_low_level
		end

	set_word_ends is
		do
			value := word_ends_low_level
		end

	set_words is
		do
			value := words_low_level
		end

	set_display_lines is
		do
			value := display_lines_low_level
		end

	set_display_line_ends is
		do
			value := display_line_ends_low_level
		end

	set_paragraph_ends is
		do
			value := paragraph_ends_low_level
		end

	set_paragraphs is
		do
			value := paragraphs_low_level
		end

	set_whitespace is
		do
			value := whitespace_low_level
		end

feature {ANY} -- Queries
	chars: BOOLEAN is
		do
			Result := (value=chars_low_level)
		end

	word_ends: BOOLEAN is
		do
			Result := (value=word_ends_low_level)
		end

	words: BOOLEAN is
		do
			Result := (value=words_low_level)
		end

	display_lines: BOOLEAN is
		do
			Result := (value=display_lines_low_level)
		end

	display_line_ends: BOOLEAN is
		do
			Result := (value=display_line_ends_low_level)
		end

	paragraph_ends: BOOLEAN is
		do
			Result := (value=paragraph_ends_low_level)
		end

	paragraphs: BOOLEAN is
		do
			Result := (value=paragraphs_low_level)
		end

	whitespace: BOOLEAN is
		do
			Result := (value=whitespace_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	chars_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_CHARS"
 			}"
 		end

	word_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_WORD_ENDS"
 			}"
 		end

	words_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_WORDS"
 			}"
 		end

	display_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_DISPLAY_LINES"
 			}"
 		end

	display_line_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_DISPLAY_LINE_ENDS"
 			}"
 		end

	paragraph_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_PARAGRAPH_ENDS"
 			}"
 		end

	paragraphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_PARAGRAPHS"
 			}"
 		end

	whitespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_WHITESPACE"
 			}"
 		end


end -- class GTK_DELETE_TYPE_ENUM
