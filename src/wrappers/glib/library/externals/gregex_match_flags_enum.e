-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_MATCH_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = anchored_low_level)  or else
				(a_value = noteol_low_level)  or else
				(a_value = notempty_low_level)  or else
				(a_value = partial_low_level)  or else
				(a_value = newline__cr_low_level)  or else
				(a_value = newline__lf_low_level)  or else
				(a_value = newline__crlf_low_level)  or else
				(a_value = newline__any_low_level) )
		end

feature -- Setters
	default_create,
	set_anchored is
		do
			value := anchored_low_level
		end

	set_noteol is
		do
			value := noteol_low_level
		end

	set_notempty is
		do
			value := notempty_low_level
		end

	set_partial is
		do
			value := partial_low_level
		end

	set_newline__cr is
		do
			value := newline__cr_low_level
		end

	set_newline__lf is
		do
			value := newline__lf_low_level
		end

	set_newline__crlf is
		do
			value := newline__crlf_low_level
		end

	set_newline__any is
		do
			value := newline__any_low_level
		end

feature -- Queries
	is_anchored: BOOLEAN is
		do
			Result := (value=anchored_low_level)
		end

	is_noteol: BOOLEAN is
		do
			Result := (value=noteol_low_level)
		end

	is_notempty: BOOLEAN is
		do
			Result := (value=notempty_low_level)
		end

	is_partial: BOOLEAN is
		do
			Result := (value=partial_low_level)
		end

	is_newline__cr: BOOLEAN is
		do
			Result := (value=newline__cr_low_level)
		end

	is_newline__lf: BOOLEAN is
		do
			Result := (value=newline__lf_low_level)
		end

	is_newline__crlf: BOOLEAN is
		do
			Result := (value=newline__crlf_low_level)
		end

	is_newline__any: BOOLEAN is
		do
			Result := (value=newline__any_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	anchored_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_ANCHORED"
 			}"
 		end

	noteol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEOL"
 			}"
 		end

	notempty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY"
 			}"
 		end

	partial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL"
 			}"
 		end

	newline__cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CR"
 			}"
 		end

	newline__lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_LF"
 			}"
 		end

	newline__crlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CRLF"
 			}"
 		end

	newline__any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANY"
 			}"
 		end


end -- class GREGEX_MATCH_FLAGS_ENUM
