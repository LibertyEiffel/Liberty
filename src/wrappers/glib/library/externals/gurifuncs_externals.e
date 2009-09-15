-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

deferred class GURIFUNCS_EXTERNALS


inherit ANY undefine is_equal, copy end

feature {} -- External calls

	g_uri_parse_scheme (an_uri: POINTER): POINTER is
 		-- g_uri_parse_scheme
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_uri_parse_scheme"
		}"
		end

	g_uri_unescape_string (an_escaped_string: POINTER; an_illegal_characters: POINTER): POINTER is
 		-- g_uri_unescape_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_uri_unescape_string"
		}"
		end

	g_uri_escape_string (an_unescaped: POINTER; a_reserved_chars_allowed: POINTER; an_allow_utf8: INTEGER_32): POINTER is
 		-- g_uri_escape_string
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_uri_escape_string"
		}"
		end

	g_uri_unescape_segment (an_escaped_string: POINTER; an_escaped_string_end: POINTER; an_illegal_characters: POINTER): POINTER is
 		-- g_uri_unescape_segment
		external "plug_in"
		alias "{
			location: "../../../plugins"
			module_name: "glib"
			feature_name: "g_uri_unescape_segment"
		}"
		end

end
