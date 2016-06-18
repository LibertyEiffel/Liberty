-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_REGEX_MATCH_FLAGS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_anchored
		do
			value := g_regex_match_anchored
		end

	set_notbol
		do
			value := g_regex_match_notbol
		end

	set_noteol
		do
			value := g_regex_match_noteol
		end

	set_notempty
		do
			value := g_regex_match_notempty
		end

	set_partial
		do
			value := g_regex_match_partial
		end

	set_newline_cr
		do
			value := g_regex_match_newline_cr
		end

	set_newline_lf
		do
			value := g_regex_match_newline_lf
		end

	set_newline_crlf
		do
			value := g_regex_match_newline_crlf
		end

	set_newline_any
		do
			value := g_regex_match_newline_any
		end


feature {ANY} -- Queries
	is_anchored: BOOLEAN
		do
			Result := (value=g_regex_match_anchored)
		end

	is_notbol: BOOLEAN
		do
			Result := (value=g_regex_match_notbol)
		end

	is_noteol: BOOLEAN
		do
			Result := (value=g_regex_match_noteol)
		end

	is_notempty: BOOLEAN
		do
			Result := (value=g_regex_match_notempty)
		end

	is_partial: BOOLEAN
		do
			Result := (value=g_regex_match_partial)
		end

	is_newline_cr: BOOLEAN
		do
			Result := (value=g_regex_match_newline_cr)
		end

	is_newline_lf: BOOLEAN
		do
			Result := (value=g_regex_match_newline_lf)
		end

	is_newline_crlf: BOOLEAN
		do
			Result := (value=g_regex_match_newline_crlf)
		end

	is_newline_any: BOOLEAN
		do
			Result := (value=g_regex_match_newline_any)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_regex_match_anchored: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_ANCHORED"
		end

	g_regex_match_notbol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NOTBOL"
		end

	g_regex_match_noteol: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NOTEOL"
		end

	g_regex_match_notempty: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NOTEMPTY"
		end

	g_regex_match_partial: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_PARTIAL"
		end

	g_regex_match_newline_cr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_CR"
		end

	g_regex_match_newline_lf: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_LF"
		end

	g_regex_match_newline_crlf: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_CRLF"
		end

	g_regex_match_newline_any: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_REGEX_MATCH_NEWLINE_ANY"
		end


end

