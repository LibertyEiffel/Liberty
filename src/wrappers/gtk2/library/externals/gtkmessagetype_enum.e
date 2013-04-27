-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKMESSAGETYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_message_error_low_level)  or else
				(a_value = gtk_message_info_low_level)  or else
				(a_value = gtk_message_other_low_level)  or else
				(a_value = gtk_message_question_low_level)  or else
				(a_value = gtk_message_warning_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_message_error is
		do
			value := gtk_message_error_low_level
		end

	set_gtk_message_info is
		do
			value := gtk_message_info_low_level
		end

	set_gtk_message_other is
		do
			value := gtk_message_other_low_level
		end

	set_gtk_message_question is
		do
			value := gtk_message_question_low_level
		end

	set_gtk_message_warning is
		do
			value := gtk_message_warning_low_level
		end

feature {ANY} -- Queries
	is_gtk_message_error: BOOLEAN is
		do
			Result := (value=gtk_message_error_low_level)
		end

	is_gtk_message_info: BOOLEAN is
		do
			Result := (value=gtk_message_info_low_level)
		end

	is_gtk_message_other: BOOLEAN is
		do
			Result := (value=gtk_message_other_low_level)
		end

	is_gtk_message_question: BOOLEAN is
		do
			Result := (value=gtk_message_question_low_level)
		end

	is_gtk_message_warning: BOOLEAN is
		do
			Result := (value=gtk_message_warning_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_message_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_ERROR"
 			}"
 		end

	gtk_message_info_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_INFO"
 			}"
 		end

	gtk_message_other_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_OTHER"
 			}"
 		end

	gtk_message_question_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_QUESTION"
 			}"
 		end

	gtk_message_warning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_WARNING"
 			}"
 		end


end -- class GTKMESSAGETYPE_ENUM
