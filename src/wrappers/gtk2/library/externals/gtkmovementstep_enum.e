-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKMOVEMENTSTEP_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_movement_buffer_ends_low_level)  or else
				(a_value = gtk_movement_display_line_ends_low_level)  or else
				(a_value = gtk_movement_display_lines_low_level)  or else
				(a_value = gtk_movement_horizontal_pages_low_level)  or else
				(a_value = gtk_movement_logical_positions_low_level)  or else
				(a_value = gtk_movement_pages_low_level)  or else
				(a_value = gtk_movement_paragraph_ends_low_level)  or else
				(a_value = gtk_movement_paragraphs_low_level)  or else
				(a_value = gtk_movement_visual_positions_low_level)  or else
				(a_value = gtk_movement_words_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_movement_buffer_ends is
		do
			value := gtk_movement_buffer_ends_low_level
		end

	set_gtk_movement_display_line_ends is
		do
			value := gtk_movement_display_line_ends_low_level
		end

	set_gtk_movement_display_lines is
		do
			value := gtk_movement_display_lines_low_level
		end

	set_gtk_movement_horizontal_pages is
		do
			value := gtk_movement_horizontal_pages_low_level
		end

	set_gtk_movement_logical_positions is
		do
			value := gtk_movement_logical_positions_low_level
		end

	set_gtk_movement_pages is
		do
			value := gtk_movement_pages_low_level
		end

	set_gtk_movement_paragraph_ends is
		do
			value := gtk_movement_paragraph_ends_low_level
		end

	set_gtk_movement_paragraphs is
		do
			value := gtk_movement_paragraphs_low_level
		end

	set_gtk_movement_visual_positions is
		do
			value := gtk_movement_visual_positions_low_level
		end

	set_gtk_movement_words is
		do
			value := gtk_movement_words_low_level
		end

feature {ANY} -- Queries
	is_gtk_movement_buffer_ends: BOOLEAN is
		do
			Result := (value=gtk_movement_buffer_ends_low_level)
		end

	is_gtk_movement_display_line_ends: BOOLEAN is
		do
			Result := (value=gtk_movement_display_line_ends_low_level)
		end

	is_gtk_movement_display_lines: BOOLEAN is
		do
			Result := (value=gtk_movement_display_lines_low_level)
		end

	is_gtk_movement_horizontal_pages: BOOLEAN is
		do
			Result := (value=gtk_movement_horizontal_pages_low_level)
		end

	is_gtk_movement_logical_positions: BOOLEAN is
		do
			Result := (value=gtk_movement_logical_positions_low_level)
		end

	is_gtk_movement_pages: BOOLEAN is
		do
			Result := (value=gtk_movement_pages_low_level)
		end

	is_gtk_movement_paragraph_ends: BOOLEAN is
		do
			Result := (value=gtk_movement_paragraph_ends_low_level)
		end

	is_gtk_movement_paragraphs: BOOLEAN is
		do
			Result := (value=gtk_movement_paragraphs_low_level)
		end

	is_gtk_movement_visual_positions: BOOLEAN is
		do
			Result := (value=gtk_movement_visual_positions_low_level)
		end

	is_gtk_movement_words: BOOLEAN is
		do
			Result := (value=gtk_movement_words_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_movement_buffer_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_BUFFER_ENDS"
 			}"
 		end

	gtk_movement_display_line_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_DISPLAY_LINE_ENDS"
 			}"
 		end

	gtk_movement_display_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_DISPLAY_LINES"
 			}"
 		end

	gtk_movement_horizontal_pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_HORIZONTAL_PAGES"
 			}"
 		end

	gtk_movement_logical_positions_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_LOGICAL_POSITIONS"
 			}"
 		end

	gtk_movement_pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_PAGES"
 			}"
 		end

	gtk_movement_paragraph_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_PARAGRAPH_ENDS"
 			}"
 		end

	gtk_movement_paragraphs_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_PARAGRAPHS"
 			}"
 		end

	gtk_movement_visual_positions_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_VISUAL_POSITIONS"
 			}"
 		end

	gtk_movement_words_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MOVEMENT_WORDS"
 			}"
 		end


end -- class GTKMOVEMENTSTEP_ENUM
