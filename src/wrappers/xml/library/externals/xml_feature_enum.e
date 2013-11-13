-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_FEATURE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = xml_with_automata_low_level)  or else
				(a_value = xml_with_c14n_low_level)  or else
				(a_value = xml_with_catalog_low_level)  or else
				(a_value = xml_with_debug_low_level)  or else
				(a_value = xml_with_debug_mem_low_level)  or else
				(a_value = xml_with_debug_run_low_level)  or else
				(a_value = xml_with_expr_low_level)  or else
				(a_value = xml_with_ftp_low_level)  or else
				(a_value = xml_with_html_low_level)  or else
				(a_value = xml_with_http_low_level)  or else
				(a_value = xml_with_iconv_low_level)  or else
				(a_value = xml_with_icu_low_level)  or else
				(a_value = xml_with_iso8859x_low_level)  or else
				(a_value = xml_with_legacy_low_level)  or else
				(a_value = xml_with_modules_low_level)  or else
				(a_value = xml_with_none_low_level)  or else
				(a_value = xml_with_output_low_level)  or else
				(a_value = xml_with_pattern_low_level)  or else
				(a_value = xml_with_push_low_level)  or else
				(a_value = xml_with_reader_low_level)  or else
				(a_value = xml_with_regexp_low_level)  or else
				(a_value = xml_with_sax1_low_level)  or else
				(a_value = xml_with_schemas_low_level)  or else
				(a_value = xml_with_schematron_low_level)  or else
				(a_value = xml_with_thread_low_level)  or else
				(a_value = xml_with_tree_low_level)  or else
				(a_value = xml_with_unicode_low_level)  or else
				(a_value = xml_with_valid_low_level)  or else
				(a_value = xml_with_writer_low_level)  or else
				(a_value = xml_with_xinclude_low_level)  or else
				(a_value = xml_with_xpath_low_level)  or else
				(a_value = xml_with_xptr_low_level)  or else
				(a_value = xml_with_zlib_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_with_automata is
		do
			value := xml_with_automata_low_level
		end

	set_xml_with_c14n is
		do
			value := xml_with_c14n_low_level
		end

	set_xml_with_catalog is
		do
			value := xml_with_catalog_low_level
		end

	set_xml_with_debug is
		do
			value := xml_with_debug_low_level
		end

	set_xml_with_debug_mem is
		do
			value := xml_with_debug_mem_low_level
		end

	set_xml_with_debug_run is
		do
			value := xml_with_debug_run_low_level
		end

	set_xml_with_expr is
		do
			value := xml_with_expr_low_level
		end

	set_xml_with_ftp is
		do
			value := xml_with_ftp_low_level
		end

	set_xml_with_html is
		do
			value := xml_with_html_low_level
		end

	set_xml_with_http is
		do
			value := xml_with_http_low_level
		end

	set_xml_with_iconv is
		do
			value := xml_with_iconv_low_level
		end

	set_xml_with_icu is
		do
			value := xml_with_icu_low_level
		end

	set_xml_with_iso8859x is
		do
			value := xml_with_iso8859x_low_level
		end

	set_xml_with_legacy is
		do
			value := xml_with_legacy_low_level
		end

	set_xml_with_modules is
		do
			value := xml_with_modules_low_level
		end

	set_xml_with_none is
		do
			value := xml_with_none_low_level
		end

	set_xml_with_output is
		do
			value := xml_with_output_low_level
		end

	set_xml_with_pattern is
		do
			value := xml_with_pattern_low_level
		end

	set_xml_with_push is
		do
			value := xml_with_push_low_level
		end

	set_xml_with_reader is
		do
			value := xml_with_reader_low_level
		end

	set_xml_with_regexp is
		do
			value := xml_with_regexp_low_level
		end

	set_xml_with_sax1 is
		do
			value := xml_with_sax1_low_level
		end

	set_xml_with_schemas is
		do
			value := xml_with_schemas_low_level
		end

	set_xml_with_schematron is
		do
			value := xml_with_schematron_low_level
		end

	set_xml_with_thread is
		do
			value := xml_with_thread_low_level
		end

	set_xml_with_tree is
		do
			value := xml_with_tree_low_level
		end

	set_xml_with_unicode is
		do
			value := xml_with_unicode_low_level
		end

	set_xml_with_valid is
		do
			value := xml_with_valid_low_level
		end

	set_xml_with_writer is
		do
			value := xml_with_writer_low_level
		end

	set_xml_with_xinclude is
		do
			value := xml_with_xinclude_low_level
		end

	set_xml_with_xpath is
		do
			value := xml_with_xpath_low_level
		end

	set_xml_with_xptr is
		do
			value := xml_with_xptr_low_level
		end

	set_xml_with_zlib is
		do
			value := xml_with_zlib_low_level
		end

feature -- Queries
	is_xml_with_automata: BOOLEAN is
		do
			Result := (value=xml_with_automata_low_level)
		end

	is_xml_with_c14n: BOOLEAN is
		do
			Result := (value=xml_with_c14n_low_level)
		end

	is_xml_with_catalog: BOOLEAN is
		do
			Result := (value=xml_with_catalog_low_level)
		end

	is_xml_with_debug: BOOLEAN is
		do
			Result := (value=xml_with_debug_low_level)
		end

	is_xml_with_debug_mem: BOOLEAN is
		do
			Result := (value=xml_with_debug_mem_low_level)
		end

	is_xml_with_debug_run: BOOLEAN is
		do
			Result := (value=xml_with_debug_run_low_level)
		end

	is_xml_with_expr: BOOLEAN is
		do
			Result := (value=xml_with_expr_low_level)
		end

	is_xml_with_ftp: BOOLEAN is
		do
			Result := (value=xml_with_ftp_low_level)
		end

	is_xml_with_html: BOOLEAN is
		do
			Result := (value=xml_with_html_low_level)
		end

	is_xml_with_http: BOOLEAN is
		do
			Result := (value=xml_with_http_low_level)
		end

	is_xml_with_iconv: BOOLEAN is
		do
			Result := (value=xml_with_iconv_low_level)
		end

	is_xml_with_icu: BOOLEAN is
		do
			Result := (value=xml_with_icu_low_level)
		end

	is_xml_with_iso8859x: BOOLEAN is
		do
			Result := (value=xml_with_iso8859x_low_level)
		end

	is_xml_with_legacy: BOOLEAN is
		do
			Result := (value=xml_with_legacy_low_level)
		end

	is_xml_with_modules: BOOLEAN is
		do
			Result := (value=xml_with_modules_low_level)
		end

	is_xml_with_none: BOOLEAN is
		do
			Result := (value=xml_with_none_low_level)
		end

	is_xml_with_output: BOOLEAN is
		do
			Result := (value=xml_with_output_low_level)
		end

	is_xml_with_pattern: BOOLEAN is
		do
			Result := (value=xml_with_pattern_low_level)
		end

	is_xml_with_push: BOOLEAN is
		do
			Result := (value=xml_with_push_low_level)
		end

	is_xml_with_reader: BOOLEAN is
		do
			Result := (value=xml_with_reader_low_level)
		end

	is_xml_with_regexp: BOOLEAN is
		do
			Result := (value=xml_with_regexp_low_level)
		end

	is_xml_with_sax1: BOOLEAN is
		do
			Result := (value=xml_with_sax1_low_level)
		end

	is_xml_with_schemas: BOOLEAN is
		do
			Result := (value=xml_with_schemas_low_level)
		end

	is_xml_with_schematron: BOOLEAN is
		do
			Result := (value=xml_with_schematron_low_level)
		end

	is_xml_with_thread: BOOLEAN is
		do
			Result := (value=xml_with_thread_low_level)
		end

	is_xml_with_tree: BOOLEAN is
		do
			Result := (value=xml_with_tree_low_level)
		end

	is_xml_with_unicode: BOOLEAN is
		do
			Result := (value=xml_with_unicode_low_level)
		end

	is_xml_with_valid: BOOLEAN is
		do
			Result := (value=xml_with_valid_low_level)
		end

	is_xml_with_writer: BOOLEAN is
		do
			Result := (value=xml_with_writer_low_level)
		end

	is_xml_with_xinclude: BOOLEAN is
		do
			Result := (value=xml_with_xinclude_low_level)
		end

	is_xml_with_xpath: BOOLEAN is
		do
			Result := (value=xml_with_xpath_low_level)
		end

	is_xml_with_xptr: BOOLEAN is
		do
			Result := (value=xml_with_xptr_low_level)
		end

	is_xml_with_zlib: BOOLEAN is
		do
			Result := (value=xml_with_zlib_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_with_automata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_AUTOMATA"
 			}"
 		end

	xml_with_c14n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_C14N"
 			}"
 		end

	xml_with_catalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_CATALOG"
 			}"
 		end

	xml_with_debug_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG"
 			}"
 		end

	xml_with_debug_mem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG_MEM"
 			}"
 		end

	xml_with_debug_run_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG_RUN"
 			}"
 		end

	xml_with_expr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_EXPR"
 			}"
 		end

	xml_with_ftp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_FTP"
 			}"
 		end

	xml_with_html_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_HTML"
 			}"
 		end

	xml_with_http_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_HTTP"
 			}"
 		end

	xml_with_iconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ICONV"
 			}"
 		end

	xml_with_icu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ICU"
 			}"
 		end

	xml_with_iso8859x_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ISO8859X"
 			}"
 		end

	xml_with_legacy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_LEGACY"
 			}"
 		end

	xml_with_modules_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_MODULES"
 			}"
 		end

	xml_with_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_NONE"
 			}"
 		end

	xml_with_output_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_OUTPUT"
 			}"
 		end

	xml_with_pattern_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_PATTERN"
 			}"
 		end

	xml_with_push_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_PUSH"
 			}"
 		end

	xml_with_reader_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_READER"
 			}"
 		end

	xml_with_regexp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_REGEXP"
 			}"
 		end

	xml_with_sax1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SAX1"
 			}"
 		end

	xml_with_schemas_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SCHEMAS"
 			}"
 		end

	xml_with_schematron_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SCHEMATRON"
 			}"
 		end

	xml_with_thread_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_THREAD"
 			}"
 		end

	xml_with_tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_TREE"
 			}"
 		end

	xml_with_unicode_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_UNICODE"
 			}"
 		end

	xml_with_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_VALID"
 			}"
 		end

	xml_with_writer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_WRITER"
 			}"
 		end

	xml_with_xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XINCLUDE"
 			}"
 		end

	xml_with_xpath_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XPATH"
 			}"
 		end

	xml_with_xptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XPTR"
 			}"
 		end

	xml_with_zlib_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ZLIB"
 			}"
 		end


end -- class XML_FEATURE_ENUM
