-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_MATCH_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = anchored_low_level)  or else
				(a_value = notbol_low_level)  or else
				(a_value = noteol_low_level)  or else
				(a_value = notempty_low_level)  or else
				(a_value = partial_low_level)  or else
				(a_value = newline_cr_low_level)  or else
				(a_value = newline_lf_low_level)  or else
				(a_value = newline_crlf_low_level)  or else
				(a_value = newline_any_low_level)  or else
				(a_value = newline_anycrlf_low_level)  or else
				(a_value = bsr_anycrlf_low_level)  or else
				(a_value = bsr_any_low_level)  or else
				(a_value = partial_soft_low_level)  or else
				(a_value = partial_hard_low_level)  or else
				(a_value = notempty_atstart_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_anchored is
		do
			value := anchored_low_level
		end

	set_notbol is
		do
			value := notbol_low_level
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

	set_newline_cr is
		do
			value := newline_cr_low_level
		end

	set_newline_lf is
		do
			value := newline_lf_low_level
		end

	set_newline_crlf is
		do
			value := newline_crlf_low_level
		end

	set_newline_any is
		do
			value := newline_any_low_level
		end

	set_newline_anycrlf is
		do
			value := newline_anycrlf_low_level
		end

	set_bsr_anycrlf is
		do
			value := bsr_anycrlf_low_level
		end

	set_bsr_any is
		do
			value := bsr_any_low_level
		end

	set_partial_soft is
		do
			value := partial_soft_low_level
		end

	set_partial_hard is
		do
			value := partial_hard_low_level
		end

	set_notempty_atstart is
		do
			value := notempty_atstart_low_level
		end

feature {ANY} -- Queries
	anchored: BOOLEAN is
		do
			Result := (value=anchored_low_level)
		end

	notbol: BOOLEAN is
		do
			Result := (value=notbol_low_level)
		end

	noteol: BOOLEAN is
		do
			Result := (value=noteol_low_level)
		end

	notempty: BOOLEAN is
		do
			Result := (value=notempty_low_level)
		end

	partial: BOOLEAN is
		do
			Result := (value=partial_low_level)
		end

	newline_cr: BOOLEAN is
		do
			Result := (value=newline_cr_low_level)
		end

	newline_lf: BOOLEAN is
		do
			Result := (value=newline_lf_low_level)
		end

	newline_crlf: BOOLEAN is
		do
			Result := (value=newline_crlf_low_level)
		end

	newline_any: BOOLEAN is
		do
			Result := (value=newline_any_low_level)
		end

	newline_anycrlf: BOOLEAN is
		do
			Result := (value=newline_anycrlf_low_level)
		end

	bsr_anycrlf: BOOLEAN is
		do
			Result := (value=bsr_anycrlf_low_level)
		end

	bsr_any: BOOLEAN is
		do
			Result := (value=bsr_any_low_level)
		end

	partial_soft: BOOLEAN is
		do
			Result := (value=partial_soft_low_level)
		end

	partial_hard: BOOLEAN is
		do
			Result := (value=partial_hard_low_level)
		end

	notempty_atstart: BOOLEAN is
		do
			Result := (value=notempty_atstart_low_level)
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

	notbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTBOL"
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

	newline_cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CR"
 			}"
 		end

	newline_lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_LF"
 			}"
 		end

	newline_crlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CRLF"
 			}"
 		end

	newline_any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANY"
 			}"
 		end

	newline_anycrlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANYCRLF"
 			}"
 		end

	bsr_anycrlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_BSR_ANYCRLF"
 			}"
 		end

	bsr_any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_BSR_ANY"
 			}"
 		end

	partial_soft_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL_SOFT"
 			}"
 		end

	partial_hard_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL_HARD"
 			}"
 		end

	notempty_atstart_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY_ATSTART"
 			}"
 		end


end -- class GREGEX_MATCH_FLAGS_ENUM
