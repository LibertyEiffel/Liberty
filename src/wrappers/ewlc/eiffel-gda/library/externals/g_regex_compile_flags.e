-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_REGEX_COMPILE_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_caseless
		do
			value := g_regex_caseless
		end

	set_multiline
		do
			value := g_regex_multiline
		end

	set_dotall
		do
			value := g_regex_dotall
		end

	set_extended
		do
			value := g_regex_extended
		end

	set_anchored
		do
			value := g_regex_anchored
		end

	set_dollar_endonly
		do
			value := g_regex_dollar_endonly
		end

	set_ungreedy
		do
			value := g_regex_ungreedy
		end

	set_raw
		do
			value := g_regex_raw
		end

	set_no_auto_capture
		do
			value := g_regex_no_auto_capture
		end

	set_optimize
		do
			value := g_regex_optimize
		end

	set_dupnames
		do
			value := g_regex_dupnames
		end

	set_newline_cr
		do
			value := g_regex_newline_cr
		end

	set_newline_lf
		do
			value := g_regex_newline_lf
		end

	set_newline_crlf
		do
			value := g_regex_newline_crlf
		end


feature {ANY} -- Queries
	is_caseless: BOOLEAN
		do
			Result := (value=g_regex_caseless)
		end

	is_multiline: BOOLEAN
		do
			Result := (value=g_regex_multiline)
		end

	is_dotall: BOOLEAN
		do
			Result := (value=g_regex_dotall)
		end

	is_extended: BOOLEAN
		do
			Result := (value=g_regex_extended)
		end

	is_anchored: BOOLEAN
		do
			Result := (value=g_regex_anchored)
		end

	is_dollar_endonly: BOOLEAN
		do
			Result := (value=g_regex_dollar_endonly)
		end

	is_ungreedy: BOOLEAN
		do
			Result := (value=g_regex_ungreedy)
		end

	is_raw: BOOLEAN
		do
			Result := (value=g_regex_raw)
		end

	is_no_auto_capture: BOOLEAN
		do
			Result := (value=g_regex_no_auto_capture)
		end

	is_optimize: BOOLEAN
		do
			Result := (value=g_regex_optimize)
		end

	is_dupnames: BOOLEAN
		do
			Result := (value=g_regex_dupnames)
		end

	is_newline_cr: BOOLEAN
		do
			Result := (value=g_regex_newline_cr)
		end

	is_newline_lf: BOOLEAN
		do
			Result := (value=g_regex_newline_lf)
		end

	is_newline_crlf: BOOLEAN
		do
			Result := (value=g_regex_newline_crlf)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_caseless: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_CASELESS"
		end

	g_regex_multiline: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MULTILINE"
		end

	g_regex_dotall: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_DOTALL"
		end

	g_regex_extended: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_EXTENDED"
		end

	g_regex_anchored: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_ANCHORED"
		end

	g_regex_dollar_endonly: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_DOLLAR_ENDONLY"
		end

	g_regex_ungreedy: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_UNGREEDY"
		end

	g_regex_raw: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_RAW"
		end

	g_regex_no_auto_capture: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NO_AUTO_CAPTURE"
		end

	g_regex_optimize: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_OPTIMIZE"
		end

	g_regex_dupnames: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_DUPNAMES"
		end

	g_regex_newline_cr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NEWLINE_CR"
		end

	g_regex_newline_lf: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NEWLINE_LF"
		end

	g_regex_newline_crlf: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_NEWLINE_CRLF"
		end


end

