-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_WRAP_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = word_low_level)  or else
				(a_value = char_low_level)  or else
				(a_value = word_char_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_word is
		do
			value := word_low_level
		end

	set_char is
		do
			value := char_low_level
		end

	set_word_char is
		do
			value := word_char_low_level
		end

feature {ANY} -- Queries
	is_word: BOOLEAN is
		do
			Result := (value=word_low_level)
		end

	is_char: BOOLEAN is
		do
			Result := (value=char_low_level)
		end

	is_word_char: BOOLEAN is
		do
			Result := (value=word_char_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	word_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WRAP_WORD"
 			}"
 		end

	char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WRAP_CHAR"
 			}"
 		end

	word_char_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WRAP_WORD_CHAR"
 			}"
 		end


end -- class PANGO_WRAP_MODE_ENUM
