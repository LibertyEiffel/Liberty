-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_REGEX_COMPILE_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_regex_caseless) or else 
				(a_value = g_regex_multiline) or else 
				(a_value = g_regex_dotall) or else 
				(a_value = g_regex_extended) or else 
				(a_value = g_regex_anchored) or else 
				(a_value = g_regex_dollar_endonly) or else 
				(a_value = g_regex_ungreedy) or else 
				(a_value = g_regex_raw) or else 
				(a_value = g_regex_no_auto_capture) or else 
				(a_value = g_regex_optimize) or else 
				(a_value = g_regex_dupnames) or else 
				(a_value = g_regex_newline_cr) or else 
				(a_value = g_regex_newline_lf) or else 
				(a_value = g_regex_newline_crlf))
		end


feature {ANY} -- Setters
	default_create, set_caseless is
		do
			value := g_regex_caseless
		end

	set_multiline is
		do
			value := g_regex_multiline
		end

	set_dotall is
		do
			value := g_regex_dotall
		end

	set_extended is
		do
			value := g_regex_extended
		end

	set_anchored is
		do
			value := g_regex_anchored
		end

	set_dollar_endonly is
		do
			value := g_regex_dollar_endonly
		end

	set_ungreedy is
		do
			value := g_regex_ungreedy
		end

	set_raw is
		do
			value := g_regex_raw
		end

	set_no_auto_capture is
		do
			value := g_regex_no_auto_capture
		end

	set_optimize is
		do
			value := g_regex_optimize
		end

	set_dupnames is
		do
			value := g_regex_dupnames
		end

	set_newline_cr is
		do
			value := g_regex_newline_cr
		end

	set_newline_lf is
		do
			value := g_regex_newline_lf
		end

	set_newline_crlf is
		do
			value := g_regex_newline_crlf
		end


feature {ANY} -- Queries
	is_caseless: BOOLEAN is
		do
			Result := (value=g_regex_caseless)
		end

	is_multiline: BOOLEAN is
		do
			Result := (value=g_regex_multiline)
		end

	is_dotall: BOOLEAN is
		do
			Result := (value=g_regex_dotall)
		end

	is_extended: BOOLEAN is
		do
			Result := (value=g_regex_extended)
		end

	is_anchored: BOOLEAN is
		do
			Result := (value=g_regex_anchored)
		end

	is_dollar_endonly: BOOLEAN is
		do
			Result := (value=g_regex_dollar_endonly)
		end

	is_ungreedy: BOOLEAN is
		do
			Result := (value=g_regex_ungreedy)
		end

	is_raw: BOOLEAN is
		do
			Result := (value=g_regex_raw)
		end

	is_no_auto_capture: BOOLEAN is
		do
			Result := (value=g_regex_no_auto_capture)
		end

	is_optimize: BOOLEAN is
		do
			Result := (value=g_regex_optimize)
		end

	is_dupnames: BOOLEAN is
		do
			Result := (value=g_regex_dupnames)
		end

	is_newline_cr: BOOLEAN is
		do
			Result := (value=g_regex_newline_cr)
		end

	is_newline_lf: BOOLEAN is
		do
			Result := (value=g_regex_newline_lf)
		end

	is_newline_crlf: BOOLEAN is
		do
			Result := (value=g_regex_newline_crlf)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_caseless: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_CASELESS"
		end

	g_regex_multiline: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MULTILINE"
		end

	g_regex_dotall: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_DOTALL"
		end

	g_regex_extended: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_EXTENDED"
		end

	g_regex_anchored: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ANCHORED"
		end

	g_regex_dollar_endonly: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_DOLLAR_ENDONLY"
		end

	g_regex_ungreedy: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_UNGREEDY"
		end

	g_regex_raw: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_RAW"
		end

	g_regex_no_auto_capture: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NO_AUTO_CAPTURE"
		end

	g_regex_optimize: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_OPTIMIZE"
		end

	g_regex_dupnames: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_DUPNAMES"
		end

	g_regex_newline_cr: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NEWLINE_CR"
		end

	g_regex_newline_lf: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NEWLINE_LF"
		end

	g_regex_newline_crlf: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NEWLINE_CRLF"
		end


end

