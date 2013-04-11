-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TEXT_BUFFER_TARGET_INFO_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = buffer_contents_low_level)  or else
				(a_value = rich_text_low_level)  or else
				(a_value = text_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_buffer_contents is
		do
			value := buffer_contents_low_level
		end

	set_rich_text is
		do
			value := rich_text_low_level
		end

	set_text is
		do
			value := text_low_level
		end

feature {ANY} -- Queries
	buffer_contents: BOOLEAN is
		do
			Result := (value=buffer_contents_low_level)
		end

	rich_text: BOOLEAN is
		do
			Result := (value=rich_text_low_level)
		end

	text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	buffer_contents_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_BUFFER_TARGET_INFO_BUFFER_CONTENTS"
 			}"
 		end

	rich_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_BUFFER_TARGET_INFO_RICH_TEXT"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TEXT_BUFFER_TARGET_INFO_TEXT"
 			}"
 		end


end -- class GTK_TEXT_BUFFER_TARGET_INFO_ENUM
