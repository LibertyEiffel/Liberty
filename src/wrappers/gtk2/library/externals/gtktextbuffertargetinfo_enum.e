-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKTEXTBUFFERTARGETINFO_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_text_buffer_target_info_buffer_contents_low_level)  or else
				(a_value = gtk_text_buffer_target_info_rich_text_low_level)  or else
				(a_value = gtk_text_buffer_target_info_text_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_text_buffer_target_info_buffer_contents is
		do
			value := gtk_text_buffer_target_info_buffer_contents_low_level
		end

	set_gtk_text_buffer_target_info_rich_text is
		do
			value := gtk_text_buffer_target_info_rich_text_low_level
		end

	set_gtk_text_buffer_target_info_text is
		do
			value := gtk_text_buffer_target_info_text_low_level
		end

feature {ANY} -- Queries
	is_gtk_text_buffer_target_info_buffer_contents: BOOLEAN is
		do
			Result := (value=gtk_text_buffer_target_info_buffer_contents_low_level)
		end

	is_gtk_text_buffer_target_info_rich_text: BOOLEAN is
		do
			Result := (value=gtk_text_buffer_target_info_rich_text_low_level)
		end

	is_gtk_text_buffer_target_info_text: BOOLEAN is
		do
			Result := (value=gtk_text_buffer_target_info_text_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_text_buffer_target_info_buffer_contents_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_BUFFER_TARGET_INFO_BUFFER_CONTENTS"
 			}"
 		end

	gtk_text_buffer_target_info_rich_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_BUFFER_TARGET_INFO_RICH_TEXT"
 			}"
 		end

	gtk_text_buffer_target_info_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_BUFFER_TARGET_INFO_TEXT"
 			}"
 		end


end -- class GTKTEXTBUFFERTARGETINFO_ENUM
