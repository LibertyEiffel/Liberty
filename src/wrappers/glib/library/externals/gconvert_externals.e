-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
deferred class GCONVERT_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	g_convert (a_str: POINTER; a_len: like long; a_to_codeset: POINTER; a_from_codeset: POINTER; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_convert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_convert"
               }"
               end

	g_convert_error_quark: NATURAL 
               -- g_convert_error_quark
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_convert_error_quark"
               }"
               end

	g_convert_with_fallback (a_str: POINTER; a_len: like long; a_to_codeset: POINTER; a_from_codeset: POINTER; a_fallback: POINTER; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_convert_with_fallback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_convert_with_fallback"
               }"
               end

	g_convert_with_iconv (a_str: POINTER; a_len: like long; a_converter: POINTER; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_convert_with_iconv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_convert_with_iconv"
               }"
               end

	g_filename_display_basename (a_filename: POINTER): POINTER 
               -- g_filename_display_basename
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_filename_display_basename"
               }"
               end

	g_filename_display_name (a_filename: POINTER): POINTER 
               -- g_filename_display_name
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_filename_display_name"
               }"
               end

	g_filename_from_uri (an_uri: POINTER; a_hostname: POINTER; an_error: POINTER): POINTER 
               -- g_filename_from_uri
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_filename_from_uri"
               }"
               end

	g_filename_from_utf8 (an_utf8string: POINTER; a_len: like long; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_filename_from_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_filename_from_utf8"
               }"
               end

	g_filename_to_uri (a_filename: POINTER; a_hostname: POINTER; an_error: POINTER): POINTER 
               -- g_filename_to_uri
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_filename_to_uri"
               }"
               end

	g_filename_to_utf8 (an_opsysstring: POINTER; a_len: like long; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_filename_to_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_filename_to_utf8"
               }"
               end

	g_get_filename_charsets (a_charsets: POINTER): INTEGER 
               -- g_get_filename_charsets
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_get_filename_charsets"
               }"
               end

	g_iconv (a_converter: POINTER; an_inbuf: POINTER; an_inbytes_left: POINTER; an_outbuf: POINTER; an_outbytes_left: POINTER): like long_unsigned 
               -- g_iconv
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_iconv"
               }"
               end

	g_iconv_close (a_converter: POINTER): INTEGER 
               -- g_iconv_close
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_iconv_close"
               }"
               end

	g_iconv_open (a_to_codeset: POINTER; a_from_codeset: POINTER): POINTER 
               -- g_iconv_open
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_iconv_open"
               }"
               end

	g_locale_from_utf8 (an_utf8string: POINTER; a_len: like long; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_locale_from_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_locale_from_utf8"
               }"
               end

	g_locale_to_utf8 (an_opsysstring: POINTER; a_len: like long; a_bytes_read: POINTER; a_bytes_written: POINTER; an_error: POINTER): POINTER 
               -- g_locale_to_utf8
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_locale_to_utf8"
               }"
               end

	g_uri_list_extract_uris (an_uri_list: POINTER): POINTER 
               -- g_uri_list_extract_uris
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "g_uri_list_extract_uris"
               }"
               end


end -- class GCONVERT_EXTERNALS
