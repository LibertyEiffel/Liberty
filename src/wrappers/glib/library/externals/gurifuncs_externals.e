-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GURIFUNCS_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_uri_parse_scheme (an_uri: POINTER): POINTER is
 		-- g_uri_parse_scheme (node at line 1544)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_uri_parse_scheme"
		}"
		end

	g_uri_unescape_string (an_escaped_string: POINTER; an_illegal_characters: POINTER): POINTER is
 		-- g_uri_unescape_string (node at line 3053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_uri_unescape_string"
		}"
		end

	g_uri_escape_string (an_unescaped: POINTER; a_reserved_chars_allowed: POINTER; an_allow_utf8: INTEGER_32): POINTER is
 		-- g_uri_escape_string (node at line 3610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_uri_escape_string"
		}"
		end

	g_uri_unescape_segment (an_escaped_string: POINTER; an_escaped_string_end: POINTER; an_illegal_characters: POINTER): POINTER is
 		-- g_uri_unescape_segment (node at line 5153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_uri_unescape_segment"
		}"
		end


end -- class GURIFUNCS_EXTERNALS
