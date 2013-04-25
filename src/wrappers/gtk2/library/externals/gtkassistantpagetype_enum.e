-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKASSISTANTPAGETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_assistant_page_confirm_low_level)  or else
				(a_value = gtk_assistant_page_content_low_level)  or else
				(a_value = gtk_assistant_page_intro_low_level)  or else
				(a_value = gtk_assistant_page_progress_low_level)  or else
				(a_value = gtk_assistant_page_summary_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_assistant_page_confirm is
		do
			value := gtk_assistant_page_confirm_low_level
		end

	set_gtk_assistant_page_content is
		do
			value := gtk_assistant_page_content_low_level
		end

	set_gtk_assistant_page_intro is
		do
			value := gtk_assistant_page_intro_low_level
		end

	set_gtk_assistant_page_progress is
		do
			value := gtk_assistant_page_progress_low_level
		end

	set_gtk_assistant_page_summary is
		do
			value := gtk_assistant_page_summary_low_level
		end

feature {ANY} -- Queries
	is_gtk_assistant_page_confirm: BOOLEAN is
		do
			Result := (value=gtk_assistant_page_confirm_low_level)
		end

	is_gtk_assistant_page_content: BOOLEAN is
		do
			Result := (value=gtk_assistant_page_content_low_level)
		end

	is_gtk_assistant_page_intro: BOOLEAN is
		do
			Result := (value=gtk_assistant_page_intro_low_level)
		end

	is_gtk_assistant_page_progress: BOOLEAN is
		do
			Result := (value=gtk_assistant_page_progress_low_level)
		end

	is_gtk_assistant_page_summary: BOOLEAN is
		do
			Result := (value=gtk_assistant_page_summary_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_assistant_page_confirm_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_CONFIRM"
 			}"
 		end

	gtk_assistant_page_content_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_CONTENT"
 			}"
 		end

	gtk_assistant_page_intro_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_INTRO"
 			}"
 		end

	gtk_assistant_page_progress_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_PROGRESS"
 			}"
 		end

	gtk_assistant_page_summary_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ASSISTANT_PAGE_SUMMARY"
 			}"
 		end


end -- class GTKASSISTANTPAGETYPE_ENUM
