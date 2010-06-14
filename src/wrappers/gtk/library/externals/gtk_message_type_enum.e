-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_MESSAGE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = info_low_level)  or else
				(a_value = warning_low_level)  or else
				(a_value = question_low_level)  or else
				(a_value = error_low_level)  or else
				(a_value = other_low_level) )
		end

feature -- Setters
	default_create,
	set_info is
		do
			value := info_low_level
		end

	set_warning is
		do
			value := warning_low_level
		end

	set_question is
		do
			value := question_low_level
		end

	set_error is
		do
			value := error_low_level
		end

	set_other is
		do
			value := other_low_level
		end

feature -- Queries
	is_info: BOOLEAN is
		do
			Result := (value=info_low_level)
		end

	is_warning: BOOLEAN is
		do
			Result := (value=warning_low_level)
		end

	is_question: BOOLEAN is
		do
			Result := (value=question_low_level)
		end

	is_error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	is_other: BOOLEAN is
		do
			Result := (value=other_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	info_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_INFO"
 			}"
 		end

	warning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_WARNING"
 			}"
 		end

	question_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_QUESTION"
 			}"
 		end

	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_ERROR"
 			}"
 		end

	other_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MESSAGE_OTHER"
 			}"
 		end


end -- class GTK_MESSAGE_TYPE_ENUM
