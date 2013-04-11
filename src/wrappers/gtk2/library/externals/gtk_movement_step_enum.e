-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_MOVEMENT_STEP_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = logical_positions_low_level)  or else
				(a_value = visual_positions_low_level)  or else
				(a_value = words_low_level)  or else
				(a_value = display_lines_low_level)  or else
				(a_value = display_line_ends_low_level)  or else
				(a_value = paragraphs_low_level)  or else
				(a_value = paragraph_ends_low_level)  or else
				(a_value = pages_low_level)  or else
				(a_value = buffer_ends_low_level)  or else
				(a_value = horizontal_pages_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_logical_positions is
		do
			value := logical_positions_low_level
		end

	set_visual_positions is
		do
			value := visual_positions_low_level
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

	set_paragraphs is
		do
			value := paragraphs_low_level
		end

	set_paragraph_ends is
		do
			value := paragraph_ends_low_level
		end

	set_pages is
		do
			value := pages_low_level
		end

	set_buffer_ends is
		do
			value := buffer_ends_low_level
		end

	set_horizontal_pages is
		do
			value := horizontal_pages_low_level
		end

feature {ANY} -- Queries
	logical_positions: BOOLEAN is
		do
			Result := (value=logical_positions_low_level)
		end

	visual_positions: BOOLEAN is
		do
			Result := (value=visual_positions_low_level)
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

	paragraphs: BOOLEAN is
		do
			Result := (value=paragraphs_low_level)
		end

	paragraph_ends: BOOLEAN is
		do
			Result := (value=paragraph_ends_low_level)
		end

	pages: BOOLEAN is
		do
			Result := (value=pages_low_level)
		end

	buffer_ends: BOOLEAN is
		do
			Result := (value=buffer_ends_low_level)
		end

	horizontal_pages: BOOLEAN is
		do
			Result := (value=horizontal_pages_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	logical_positions_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_LOGICAL_POSITIONS"
 			}"
 		end

	visual_positions_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_VISUAL_POSITIONS"
 			}"
 		end

	words_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_WORDS"
 			}"
 		end

	display_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_DISPLAY_LINES"
 			}"
 		end

	display_line_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_DISPLAY_LINE_ENDS"
 			}"
 		end

	paragraphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_PARAGRAPHS"
 			}"
 		end

	paragraph_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_PARAGRAPH_ENDS"
 			}"
 		end

	pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_PAGES"
 			}"
 		end

	buffer_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_BUFFER_ENDS"
 			}"
 		end

	horizontal_pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_HORIZONTAL_PAGES"
 			}"
 		end


end -- class GTK_MOVEMENT_STEP_ENUM
