-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_MATCH_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_regex_match_anchored_low_level)  or else
				(a_value = g_regex_match_bsr_any_low_level)  or else
				(a_value = g_regex_match_bsr_anycrlf_low_level)  or else
				(a_value = g_regex_match_newline_any_low_level)  or else
				(a_value = g_regex_match_newline_anycrlf_low_level)  or else
				(a_value = g_regex_match_newline_cr_low_level)  or else
				(a_value = g_regex_match_newline_crlf_low_level)  or else
				(a_value = g_regex_match_newline_lf_low_level)  or else
				(a_value = g_regex_match_notbol_low_level)  or else
				(a_value = g_regex_match_notempty_low_level)  or else
				(a_value = g_regex_match_notempty_atstart_low_level)  or else
				(a_value = g_regex_match_noteol_low_level)  or else
				(a_value = g_regex_match_partial_low_level)  or else
				(a_value = g_regex_match_partial_hard_low_level)  or else
				(a_value = g_regex_match_partial_soft_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_regex_match_anchored
		do
			value := g_regex_match_anchored_low_level
		end

	set_g_regex_match_bsr_any
		do
			value := g_regex_match_bsr_any_low_level
		end

	set_g_regex_match_bsr_anycrlf
		do
			value := g_regex_match_bsr_anycrlf_low_level
		end

	set_g_regex_match_newline_any
		do
			value := g_regex_match_newline_any_low_level
		end

	set_g_regex_match_newline_anycrlf
		do
			value := g_regex_match_newline_anycrlf_low_level
		end

	set_g_regex_match_newline_cr
		do
			value := g_regex_match_newline_cr_low_level
		end

	set_g_regex_match_newline_crlf
		do
			value := g_regex_match_newline_crlf_low_level
		end

	set_g_regex_match_newline_lf
		do
			value := g_regex_match_newline_lf_low_level
		end

	set_g_regex_match_notbol
		do
			value := g_regex_match_notbol_low_level
		end

	set_g_regex_match_notempty
		do
			value := g_regex_match_notempty_low_level
		end

	set_g_regex_match_notempty_atstart
		do
			value := g_regex_match_notempty_atstart_low_level
		end

	set_g_regex_match_noteol
		do
			value := g_regex_match_noteol_low_level
		end

	set_g_regex_match_partial
		do
			value := g_regex_match_partial_low_level
		end

	set_g_regex_match_partial_hard
		do
			value := g_regex_match_partial_hard_low_level
		end

	set_g_regex_match_partial_soft
		do
			value := g_regex_match_partial_soft_low_level
		end

feature {ANY} -- Queries
	is_g_regex_match_anchored: BOOLEAN
		do
			Result := (value=g_regex_match_anchored_low_level)
		end

	is_g_regex_match_bsr_any: BOOLEAN
		do
			Result := (value=g_regex_match_bsr_any_low_level)
		end

	is_g_regex_match_bsr_anycrlf: BOOLEAN
		do
			Result := (value=g_regex_match_bsr_anycrlf_low_level)
		end

	is_g_regex_match_newline_any: BOOLEAN
		do
			Result := (value=g_regex_match_newline_any_low_level)
		end

	is_g_regex_match_newline_anycrlf: BOOLEAN
		do
			Result := (value=g_regex_match_newline_anycrlf_low_level)
		end

	is_g_regex_match_newline_cr: BOOLEAN
		do
			Result := (value=g_regex_match_newline_cr_low_level)
		end

	is_g_regex_match_newline_crlf: BOOLEAN
		do
			Result := (value=g_regex_match_newline_crlf_low_level)
		end

	is_g_regex_match_newline_lf: BOOLEAN
		do
			Result := (value=g_regex_match_newline_lf_low_level)
		end

	is_g_regex_match_notbol: BOOLEAN
		do
			Result := (value=g_regex_match_notbol_low_level)
		end

	is_g_regex_match_notempty: BOOLEAN
		do
			Result := (value=g_regex_match_notempty_low_level)
		end

	is_g_regex_match_notempty_atstart: BOOLEAN
		do
			Result := (value=g_regex_match_notempty_atstart_low_level)
		end

	is_g_regex_match_noteol: BOOLEAN
		do
			Result := (value=g_regex_match_noteol_low_level)
		end

	is_g_regex_match_partial: BOOLEAN
		do
			Result := (value=g_regex_match_partial_low_level)
		end

	is_g_regex_match_partial_hard: BOOLEAN
		do
			Result := (value=g_regex_match_partial_hard_low_level)
		end

	is_g_regex_match_partial_soft: BOOLEAN
		do
			Result := (value=g_regex_match_partial_soft_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_match_anchored_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_ANCHORED"
 			}"
 		end

	g_regex_match_bsr_any_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_BSR_ANY"
 			}"
 		end

	g_regex_match_bsr_anycrlf_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_BSR_ANYCRLF"
 			}"
 		end

	g_regex_match_newline_any_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANY"
 			}"
 		end

	g_regex_match_newline_anycrlf_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANYCRLF"
 			}"
 		end

	g_regex_match_newline_cr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CR"
 			}"
 		end

	g_regex_match_newline_crlf_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CRLF"
 			}"
 		end

	g_regex_match_newline_lf_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_LF"
 			}"
 		end

	g_regex_match_notbol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTBOL"
 			}"
 		end

	g_regex_match_notempty_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY"
 			}"
 		end

	g_regex_match_notempty_atstart_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY_ATSTART"
 			}"
 		end

	g_regex_match_noteol_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEOL"
 			}"
 		end

	g_regex_match_partial_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL"
 			}"
 		end

	g_regex_match_partial_hard_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL_HARD"
 			}"
 		end

	g_regex_match_partial_soft_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL_SOFT"
 			}"
 		end


end -- class GREGEX_MATCH_FLAGS_ENUM
