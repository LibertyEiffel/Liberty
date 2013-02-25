-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ASSISTANT_PAGE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = content_low_level)  or else
				(a_value = intro_low_level)  or else
				(a_value = confirm_low_level)  or else
				(a_value = summary_low_level)  or else
				(a_value = progress_low_level) )
		end

feature -- Setters
	default_create,
	set_content is
		do
			value := content_low_level
		end

	set_intro is
		do
			value := intro_low_level
		end

	set_confirm is
		do
			value := confirm_low_level
		end

	set_summary is
		do
			value := summary_low_level
		end

	set_progress is
		do
			value := progress_low_level
		end

feature -- Queries
	content: BOOLEAN is
		do
			Result := (value=content_low_level)
		end

	intro: BOOLEAN is
		do
			Result := (value=intro_low_level)
		end

	confirm: BOOLEAN is
		do
			Result := (value=confirm_low_level)
		end

	summary: BOOLEAN is
		do
			Result := (value=summary_low_level)
		end

	progress: BOOLEAN is
		do
			Result := (value=progress_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_CONTENT"
 			}"
 		end

	intro_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_INTRO"
 			}"
 		end

	confirm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_CONFIRM"
 			}"
 		end

	summary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_SUMMARY"
 			}"
 		end

	progress_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_PROGRESS"
 			}"
 		end


end -- class GTK_ASSISTANT_PAGE_TYPE_ENUM
