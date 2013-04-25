-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKSCROLLSTEP_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_scroll_ends_low_level)  or else
				(a_value = gtk_scroll_horizontal_ends_low_level)  or else
				(a_value = gtk_scroll_horizontal_pages_low_level)  or else
				(a_value = gtk_scroll_horizontal_steps_low_level)  or else
				(a_value = gtk_scroll_pages_low_level)  or else
				(a_value = gtk_scroll_steps_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_scroll_ends is
		do
			value := gtk_scroll_ends_low_level
		end

	set_gtk_scroll_horizontal_ends is
		do
			value := gtk_scroll_horizontal_ends_low_level
		end

	set_gtk_scroll_horizontal_pages is
		do
			value := gtk_scroll_horizontal_pages_low_level
		end

	set_gtk_scroll_horizontal_steps is
		do
			value := gtk_scroll_horizontal_steps_low_level
		end

	set_gtk_scroll_pages is
		do
			value := gtk_scroll_pages_low_level
		end

	set_gtk_scroll_steps is
		do
			value := gtk_scroll_steps_low_level
		end

feature {ANY} -- Queries
	is_gtk_scroll_ends: BOOLEAN is
		do
			Result := (value=gtk_scroll_ends_low_level)
		end

	is_gtk_scroll_horizontal_ends: BOOLEAN is
		do
			Result := (value=gtk_scroll_horizontal_ends_low_level)
		end

	is_gtk_scroll_horizontal_pages: BOOLEAN is
		do
			Result := (value=gtk_scroll_horizontal_pages_low_level)
		end

	is_gtk_scroll_horizontal_steps: BOOLEAN is
		do
			Result := (value=gtk_scroll_horizontal_steps_low_level)
		end

	is_gtk_scroll_pages: BOOLEAN is
		do
			Result := (value=gtk_scroll_pages_low_level)
		end

	is_gtk_scroll_steps: BOOLEAN is
		do
			Result := (value=gtk_scroll_steps_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_scroll_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_ENDS"
 			}"
 		end

	gtk_scroll_horizontal_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_HORIZONTAL_ENDS"
 			}"
 		end

	gtk_scroll_horizontal_pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_HORIZONTAL_PAGES"
 			}"
 		end

	gtk_scroll_horizontal_steps_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_HORIZONTAL_STEPS"
 			}"
 		end

	gtk_scroll_pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGES"
 			}"
 		end

	gtk_scroll_steps_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEPS"
 			}"
 		end


end -- class GTKSCROLLSTEP_ENUM
