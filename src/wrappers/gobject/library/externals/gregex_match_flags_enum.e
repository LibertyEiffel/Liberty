-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_MATCH_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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

feature -- Setters
	default_create,
	set_g_regex_match_anchored is
		do
			value := g_regex_match_anchored_low_level
		end

	set_g_regex_match_bsr_any is
		do
			value := g_regex_match_bsr_any_low_level
		end

	set_g_regex_match_bsr_anycrlf is
		do
			value := g_regex_match_bsr_anycrlf_low_level
		end

	set_g_regex_match_newline_any is
		do
			value := g_regex_match_newline_any_low_level
		end

	set_g_regex_match_newline_anycrlf is
		do
			value := g_regex_match_newline_anycrlf_low_level
		end

	set_g_regex_match_newline_cr is
		do
			value := g_regex_match_newline_cr_low_level
		end

	set_g_regex_match_newline_crlf is
		do
			value := g_regex_match_newline_crlf_low_level
		end

	set_g_regex_match_newline_lf is
		do
			value := g_regex_match_newline_lf_low_level
		end

	set_g_regex_match_notbol is
		do
			value := g_regex_match_notbol_low_level
		end

	set_g_regex_match_notempty is
		do
			value := g_regex_match_notempty_low_level
		end

	set_g_regex_match_notempty_atstart is
		do
			value := g_regex_match_notempty_atstart_low_level
		end

	set_g_regex_match_noteol is
		do
			value := g_regex_match_noteol_low_level
		end

	set_g_regex_match_partial is
		do
			value := g_regex_match_partial_low_level
		end

	set_g_regex_match_partial_hard is
		do
			value := g_regex_match_partial_hard_low_level
		end

	set_g_regex_match_partial_soft is
		do
			value := g_regex_match_partial_soft_low_level
		end

feature -- Queries
	is_g_regex_match_anchored: BOOLEAN is
		do
			Result := (value=g_regex_match_anchored_low_level)
		end

	is_g_regex_match_bsr_any: BOOLEAN is
		do
			Result := (value=g_regex_match_bsr_any_low_level)
		end

	is_g_regex_match_bsr_anycrlf: BOOLEAN is
		do
			Result := (value=g_regex_match_bsr_anycrlf_low_level)
		end

	is_g_regex_match_newline_any: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_any_low_level)
		end

	is_g_regex_match_newline_anycrlf: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_anycrlf_low_level)
		end

	is_g_regex_match_newline_cr: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_cr_low_level)
		end

	is_g_regex_match_newline_crlf: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_crlf_low_level)
		end

	is_g_regex_match_newline_lf: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_lf_low_level)
		end

	is_g_regex_match_notbol: BOOLEAN is
		do
			Result := (value=g_regex_match_notbol_low_level)
		end

	is_g_regex_match_notempty: BOOLEAN is
		do
			Result := (value=g_regex_match_notempty_low_level)
		end

	is_g_regex_match_notempty_atstart: BOOLEAN is
		do
			Result := (value=g_regex_match_notempty_atstart_low_level)
		end

	is_g_regex_match_noteol: BOOLEAN is
		do
			Result := (value=g_regex_match_noteol_low_level)
		end

	is_g_regex_match_partial: BOOLEAN is
		do
			Result := (value=g_regex_match_partial_low_level)
		end

	is_g_regex_match_partial_hard: BOOLEAN is
		do
			Result := (value=g_regex_match_partial_hard_low_level)
		end

	is_g_regex_match_partial_soft: BOOLEAN is
		do
			Result := (value=g_regex_match_partial_soft_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_match_anchored_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_ANCHORED"
 			}"
 		end

	g_regex_match_bsr_any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_BSR_ANY"
 			}"
 		end

	g_regex_match_bsr_anycrlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_BSR_ANYCRLF"
 			}"
 		end

	g_regex_match_newline_any_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANY"
 			}"
 		end

	g_regex_match_newline_anycrlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_ANYCRLF"
 			}"
 		end

	g_regex_match_newline_cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CR"
 			}"
 		end

	g_regex_match_newline_crlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_CRLF"
 			}"
 		end

	g_regex_match_newline_lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NEWLINE_LF"
 			}"
 		end

	g_regex_match_notbol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTBOL"
 			}"
 		end

	g_regex_match_notempty_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY"
 			}"
 		end

	g_regex_match_notempty_atstart_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEMPTY_ATSTART"
 			}"
 		end

	g_regex_match_noteol_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_NOTEOL"
 			}"
 		end

	g_regex_match_partial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL"
 			}"
 		end

	g_regex_match_partial_hard_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL_HARD"
 			}"
 		end

	g_regex_match_partial_soft_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MATCH_PARTIAL_SOFT"
 			}"
 		end


end -- class GREGEX_MATCH_FLAGS_ENUM
