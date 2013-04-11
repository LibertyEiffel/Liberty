-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_REGEX_MATCH_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_regex_match_anchored) or else 
				(a_value = g_regex_match_notbol) or else 
				(a_value = g_regex_match_noteol) or else 
				(a_value = g_regex_match_notempty) or else 
				(a_value = g_regex_match_partial) or else 
				(a_value = g_regex_match_newline_cr) or else 
				(a_value = g_regex_match_newline_lf) or else 
				(a_value = g_regex_match_newline_crlf) or else 
				(a_value = g_regex_match_newline_any))
		end


feature {ANY} -- Setters
	default_create, set_anchored is
		do
			value := g_regex_match_anchored
		end

	set_notbol is
		do
			value := g_regex_match_notbol
		end

	set_noteol is
		do
			value := g_regex_match_noteol
		end

	set_notempty is
		do
			value := g_regex_match_notempty
		end

	set_partial is
		do
			value := g_regex_match_partial
		end

	set_newline_cr is
		do
			value := g_regex_match_newline_cr
		end

	set_newline_lf is
		do
			value := g_regex_match_newline_lf
		end

	set_newline_crlf is
		do
			value := g_regex_match_newline_crlf
		end

	set_newline_any is
		do
			value := g_regex_match_newline_any
		end


feature {ANY} -- Queries
	is_anchored: BOOLEAN is
		do
			Result := (value=g_regex_match_anchored)
		end

	is_notbol: BOOLEAN is
		do
			Result := (value=g_regex_match_notbol)
		end

	is_noteol: BOOLEAN is
		do
			Result := (value=g_regex_match_noteol)
		end

	is_notempty: BOOLEAN is
		do
			Result := (value=g_regex_match_notempty)
		end

	is_partial: BOOLEAN is
		do
			Result := (value=g_regex_match_partial)
		end

	is_newline_cr: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_cr)
		end

	is_newline_lf: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_lf)
		end

	is_newline_crlf: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_crlf)
		end

	is_newline_any: BOOLEAN is
		do
			Result := (value=g_regex_match_newline_any)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_match_anchored: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_ANCHORED"
		end

	g_regex_match_notbol: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NOTBOL"
		end

	g_regex_match_noteol: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NOTEOL"
		end

	g_regex_match_notempty: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NOTEMPTY"
		end

	g_regex_match_partial: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_PARTIAL"
		end

	g_regex_match_newline_cr: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_CR"
		end

	g_regex_match_newline_lf: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_LF"
		end

	g_regex_match_newline_crlf: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_CRLF"
		end

	g_regex_match_newline_any: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_ANY"
		end


end

