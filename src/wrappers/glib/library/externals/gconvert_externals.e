-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GCONVERT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_iconv_open (a_to_codeset: POINTER; a_from_codeset: POINTER): POINTER is
 		-- g_iconv_open (node at line 906)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_iconv_open"
		}"
		end

	g_convert_with_iconv (a_str: POINTER; a_len: INTEGER_32; a_converter: POINTER; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_convert_with_iconv (node at line 938)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_convert_with_iconv"
		}"
		end

	g_convert_with_fallback (a_str: POINTER; a_len: INTEGER_32; a_to_codeset: POINTER; a_from_codeset: POINTER; a_fallback: POINTER; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_convert_with_fallback (node at line 1999)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_convert_with_fallback"
		}"
		end

	g_filename_from_utf8 (an_utf8string: POINTER; a_len: INTEGER_32; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_filename_from_utf8 (node at line 2538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_filename_from_utf8"
		}"
		end

	g_locale_to_utf8 (an_opsysstring: POINTER; a_len: INTEGER_32; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_locale_to_utf8 (node at line 2568)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_locale_to_utf8"
		}"
		end

	g_iconv (a_converter: POINTER; an_inbuf: POINTER; an_inbytes_left: POINTER; an_outbuf: POINTER; an_outbytes_left: POINTER): NATURAL_32 is
 		-- g_iconv (node at line 2610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_iconv"
		}"
		end

	g_filename_from_uri (an_uri: POINTER; a_hostname: POINTER; an_error: POINTER): POINTER is
 		-- g_filename_from_uri (node at line 3346)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_filename_from_uri"
		}"
		end

	g_filename_display_basename (a_filename: POINTER): POINTER is
 		-- g_filename_display_basename (node at line 3632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_filename_display_basename"
		}"
		end

	g_convert (a_str: POINTER; a_len: INTEGER_32; a_to_codeset: POINTER; a_from_codeset: POINTER; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_convert (node at line 3638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_convert"
		}"
		end

	g_uri_list_extract_uris (an_uri_list: POINTER): POINTER is
 		-- g_uri_list_extract_uris (node at line 3661)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_uri_list_extract_uris"
		}"
		end

	g_locale_from_utf8 (an_utf8string: POINTER; a_len: INTEGER_32; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_locale_from_utf8 (node at line 3760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_locale_from_utf8"
		}"
		end

	g_filename_to_uri (a_filename: POINTER; a_hostname: POINTER; an_error: POINTER): POINTER is
 		-- g_filename_to_uri (node at line 3996)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_filename_to_uri"
		}"
		end

	g_get_filename_charsets (a_charsets: POINTER): INTEGER_32 is
 		-- g_get_filename_charsets (node at line 4170)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_get_filename_charsets"
		}"
		end

	g_filename_display_name (a_filename: POINTER): POINTER is
 		-- g_filename_display_name (node at line 4585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_filename_display_name"
		}"
		end

	g_convert_error_quark: NATURAL_32 is
 		-- g_convert_error_quark (node at line 5106)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_convert_error_quark()"
		}"
		end

	g_iconv_close (a_converter: POINTER): INTEGER_32 is
 		-- g_iconv_close (node at line 5344)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_iconv_close"
		}"
		end

	g_filename_to_utf8 (an_opsysstring: POINTER; a_len: INTEGER_32; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER is
 		-- g_filename_to_utf8 (node at line 6270)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_filename_to_utf8"
		}"
		end


end -- class GCONVERT_EXTERNALS
