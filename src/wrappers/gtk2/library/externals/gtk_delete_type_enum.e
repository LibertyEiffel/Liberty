-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_DELETE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_delete_chars_low_level)  or else
				(a_value = gtk_delete_display_line_ends_low_level)  or else
				(a_value = gtk_delete_display_lines_low_level)  or else
				(a_value = gtk_delete_paragraph_ends_low_level)  or else
				(a_value = gtk_delete_paragraphs_low_level)  or else
				(a_value = gtk_delete_whitespace_low_level)  or else
				(a_value = gtk_delete_word_ends_low_level)  or else
				(a_value = gtk_delete_words_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_delete_chars is
		do
			value := gtk_delete_chars_low_level
		end

	set_gtk_delete_display_line_ends is
		do
			value := gtk_delete_display_line_ends_low_level
		end

	set_gtk_delete_display_lines is
		do
			value := gtk_delete_display_lines_low_level
		end

	set_gtk_delete_paragraph_ends is
		do
			value := gtk_delete_paragraph_ends_low_level
		end

	set_gtk_delete_paragraphs is
		do
			value := gtk_delete_paragraphs_low_level
		end

	set_gtk_delete_whitespace is
		do
			value := gtk_delete_whitespace_low_level
		end

	set_gtk_delete_word_ends is
		do
			value := gtk_delete_word_ends_low_level
		end

	set_gtk_delete_words is
		do
			value := gtk_delete_words_low_level
		end

feature -- Queries
	is_gtk_delete_chars: BOOLEAN is
		do
			Result := (value=gtk_delete_chars_low_level)
		end

	is_gtk_delete_display_line_ends: BOOLEAN is
		do
			Result := (value=gtk_delete_display_line_ends_low_level)
		end

	is_gtk_delete_display_lines: BOOLEAN is
		do
			Result := (value=gtk_delete_display_lines_low_level)
		end

	is_gtk_delete_paragraph_ends: BOOLEAN is
		do
			Result := (value=gtk_delete_paragraph_ends_low_level)
		end

	is_gtk_delete_paragraphs: BOOLEAN is
		do
			Result := (value=gtk_delete_paragraphs_low_level)
		end

	is_gtk_delete_whitespace: BOOLEAN is
		do
			Result := (value=gtk_delete_whitespace_low_level)
		end

	is_gtk_delete_word_ends: BOOLEAN is
		do
			Result := (value=gtk_delete_word_ends_low_level)
		end

	is_gtk_delete_words: BOOLEAN is
		do
			Result := (value=gtk_delete_words_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_delete_chars_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_CHARS"
 			}"
 		end

	gtk_delete_display_line_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_DISPLAY_LINE_ENDS"
 			}"
 		end

	gtk_delete_display_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_DISPLAY_LINES"
 			}"
 		end

	gtk_delete_paragraph_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_PARAGRAPH_ENDS"
 			}"
 		end

	gtk_delete_paragraphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_PARAGRAPHS"
 			}"
 		end

	gtk_delete_whitespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_WHITESPACE"
 			}"
 		end

	gtk_delete_word_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_WORD_ENDS"
 			}"
 		end

	gtk_delete_words_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DELETE_WORDS"
 			}"
 		end


end -- class GTK_DELETE_TYPE_ENUM
