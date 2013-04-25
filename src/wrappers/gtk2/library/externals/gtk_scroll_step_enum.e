-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SCROLL_STEP_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = steps_low_level)  or else
				(a_value = pages_low_level)  or else
				(a_value = ends_low_level)  or else
				(a_value = horizontal_steps_low_level)  or else
				(a_value = horizontal_pages_low_level)  or else
				(a_value = horizontal_ends_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_steps is
		do
			value := steps_low_level
		end

	set_pages is
		do
			value := pages_low_level
		end

	set_ends is
		do
			value := ends_low_level
		end

	set_horizontal_steps is
		do
			value := horizontal_steps_low_level
		end

	set_horizontal_pages is
		do
			value := horizontal_pages_low_level
		end

	set_horizontal_ends is
		do
			value := horizontal_ends_low_level
		end

feature {ANY} -- Queries
	steps: BOOLEAN is
		do
			Result := (value=steps_low_level)
		end

	pages: BOOLEAN is
		do
			Result := (value=pages_low_level)
		end

	ends: BOOLEAN is
		do
			Result := (value=ends_low_level)
		end

	horizontal_steps: BOOLEAN is
		do
			Result := (value=horizontal_steps_low_level)
		end

	horizontal_pages: BOOLEAN is
		do
			Result := (value=horizontal_pages_low_level)
		end

	horizontal_ends: BOOLEAN is
		do
			Result := (value=horizontal_ends_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	steps_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_STEPS"
 			}"
 		end

	pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_PAGES"
 			}"
 		end

	ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_ENDS"
 			}"
 		end

	horizontal_steps_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_HORIZONTAL_STEPS"
 			}"
 		end

	horizontal_pages_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_HORIZONTAL_PAGES"
 			}"
 		end

	horizontal_ends_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SCROLL_HORIZONTAL_ENDS"
 			}"
 		end


end -- class GTK_SCROLL_STEP_ENUM
