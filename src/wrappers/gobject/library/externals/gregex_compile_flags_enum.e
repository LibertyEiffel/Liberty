-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GREGEX_COMPILE_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_regex_anchored_low_level)  or else
				(a_value = g_regex_bsr_anycrlf_low_level)  or else
				(a_value = g_regex_caseless_low_level)  or else
				(a_value = g_regex_dollar_endonly_low_level)  or else
				(a_value = g_regex_dotall_low_level)  or else
				(a_value = g_regex_dupnames_low_level)  or else
				(a_value = g_regex_extended_low_level)  or else
				(a_value = g_regex_firstline_low_level)  or else
				(a_value = g_regex_javascript_compat_low_level)  or else
				(a_value = g_regex_multiline_low_level)  or else
				(a_value = g_regex_newline_anycrlf_low_level)  or else
				(a_value = g_regex_newline_cr_low_level)  or else
				(a_value = g_regex_newline_crlf_low_level)  or else
				(a_value = g_regex_newline_lf_low_level)  or else
				(a_value = g_regex_no_auto_capture_low_level)  or else
				(a_value = g_regex_optimize_low_level)  or else
				(a_value = g_regex_raw_low_level)  or else
				(a_value = g_regex_ungreedy_low_level) )
		end

feature -- Setters
	default_create,
	set_g_regex_anchored is
		do
			value := g_regex_anchored_low_level
		end

	set_g_regex_bsr_anycrlf is
		do
			value := g_regex_bsr_anycrlf_low_level
		end

	set_g_regex_caseless is
		do
			value := g_regex_caseless_low_level
		end

	set_g_regex_dollar_endonly is
		do
			value := g_regex_dollar_endonly_low_level
		end

	set_g_regex_dotall is
		do
			value := g_regex_dotall_low_level
		end

	set_g_regex_dupnames is
		do
			value := g_regex_dupnames_low_level
		end

	set_g_regex_extended is
		do
			value := g_regex_extended_low_level
		end

	set_g_regex_firstline is
		do
			value := g_regex_firstline_low_level
		end

	set_g_regex_javascript_compat is
		do
			value := g_regex_javascript_compat_low_level
		end

	set_g_regex_multiline is
		do
			value := g_regex_multiline_low_level
		end

	set_g_regex_newline_anycrlf is
		do
			value := g_regex_newline_anycrlf_low_level
		end

	set_g_regex_newline_cr is
		do
			value := g_regex_newline_cr_low_level
		end

	set_g_regex_newline_crlf is
		do
			value := g_regex_newline_crlf_low_level
		end

	set_g_regex_newline_lf is
		do
			value := g_regex_newline_lf_low_level
		end

	set_g_regex_no_auto_capture is
		do
			value := g_regex_no_auto_capture_low_level
		end

	set_g_regex_optimize is
		do
			value := g_regex_optimize_low_level
		end

	set_g_regex_raw is
		do
			value := g_regex_raw_low_level
		end

	set_g_regex_ungreedy is
		do
			value := g_regex_ungreedy_low_level
		end

feature -- Queries
	is_g_regex_anchored: BOOLEAN is
		do
			Result := (value=g_regex_anchored_low_level)
		end

	is_g_regex_bsr_anycrlf: BOOLEAN is
		do
			Result := (value=g_regex_bsr_anycrlf_low_level)
		end

	is_g_regex_caseless: BOOLEAN is
		do
			Result := (value=g_regex_caseless_low_level)
		end

	is_g_regex_dollar_endonly: BOOLEAN is
		do
			Result := (value=g_regex_dollar_endonly_low_level)
		end

	is_g_regex_dotall: BOOLEAN is
		do
			Result := (value=g_regex_dotall_low_level)
		end

	is_g_regex_dupnames: BOOLEAN is
		do
			Result := (value=g_regex_dupnames_low_level)
		end

	is_g_regex_extended: BOOLEAN is
		do
			Result := (value=g_regex_extended_low_level)
		end

	is_g_regex_firstline: BOOLEAN is
		do
			Result := (value=g_regex_firstline_low_level)
		end

	is_g_regex_javascript_compat: BOOLEAN is
		do
			Result := (value=g_regex_javascript_compat_low_level)
		end

	is_g_regex_multiline: BOOLEAN is
		do
			Result := (value=g_regex_multiline_low_level)
		end

	is_g_regex_newline_anycrlf: BOOLEAN is
		do
			Result := (value=g_regex_newline_anycrlf_low_level)
		end

	is_g_regex_newline_cr: BOOLEAN is
		do
			Result := (value=g_regex_newline_cr_low_level)
		end

	is_g_regex_newline_crlf: BOOLEAN is
		do
			Result := (value=g_regex_newline_crlf_low_level)
		end

	is_g_regex_newline_lf: BOOLEAN is
		do
			Result := (value=g_regex_newline_lf_low_level)
		end

	is_g_regex_no_auto_capture: BOOLEAN is
		do
			Result := (value=g_regex_no_auto_capture_low_level)
		end

	is_g_regex_optimize: BOOLEAN is
		do
			Result := (value=g_regex_optimize_low_level)
		end

	is_g_regex_raw: BOOLEAN is
		do
			Result := (value=g_regex_raw_low_level)
		end

	is_g_regex_ungreedy: BOOLEAN is
		do
			Result := (value=g_regex_ungreedy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_anchored_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_ANCHORED"
 			}"
 		end

	g_regex_bsr_anycrlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_BSR_ANYCRLF"
 			}"
 		end

	g_regex_caseless_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_CASELESS"
 			}"
 		end

	g_regex_dollar_endonly_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DOLLAR_ENDONLY"
 			}"
 		end

	g_regex_dotall_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DOTALL"
 			}"
 		end

	g_regex_dupnames_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_DUPNAMES"
 			}"
 		end

	g_regex_extended_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_EXTENDED"
 			}"
 		end

	g_regex_firstline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_FIRSTLINE"
 			}"
 		end

	g_regex_javascript_compat_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_JAVASCRIPT_COMPAT"
 			}"
 		end

	g_regex_multiline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_MULTILINE"
 			}"
 		end

	g_regex_newline_anycrlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_ANYCRLF"
 			}"
 		end

	g_regex_newline_cr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_CR"
 			}"
 		end

	g_regex_newline_crlf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_CRLF"
 			}"
 		end

	g_regex_newline_lf_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NEWLINE_LF"
 			}"
 		end

	g_regex_no_auto_capture_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_NO_AUTO_CAPTURE"
 			}"
 		end

	g_regex_optimize_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_OPTIMIZE"
 			}"
 		end

	g_regex_raw_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_RAW"
 			}"
 		end

	g_regex_ungreedy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_REGEX_UNGREEDY"
 			}"
 		end


end -- class GREGEX_COMPILE_FLAGS_ENUM
