-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_FEATURE_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_xml_with_automata
		do
			value := xml_with_automata_low_level
		end

	set_xml_with_c14n
		do
			value := xml_with_c14n_low_level
		end

	set_xml_with_catalog
		do
			value := xml_with_catalog_low_level
		end

	set_xml_with_debug
		do
			value := xml_with_debug_low_level
		end

	set_xml_with_debug_mem
		do
			value := xml_with_debug_mem_low_level
		end

	set_xml_with_debug_run
		do
			value := xml_with_debug_run_low_level
		end

	set_xml_with_expr
		do
			value := xml_with_expr_low_level
		end

	set_xml_with_ftp
		do
			value := xml_with_ftp_low_level
		end

	set_xml_with_html
		do
			value := xml_with_html_low_level
		end

	set_xml_with_http
		do
			value := xml_with_http_low_level
		end

	set_xml_with_iconv
		do
			value := xml_with_iconv_low_level
		end

	set_xml_with_icu
		do
			value := xml_with_icu_low_level
		end

	set_xml_with_iso8859x
		do
			value := xml_with_iso8859x_low_level
		end

	set_xml_with_legacy
		do
			value := xml_with_legacy_low_level
		end

	set_xml_with_modules
		do
			value := xml_with_modules_low_level
		end

	set_xml_with_none
		do
			value := xml_with_none_low_level
		end

	set_xml_with_output
		do
			value := xml_with_output_low_level
		end

	set_xml_with_pattern
		do
			value := xml_with_pattern_low_level
		end

	set_xml_with_push
		do
			value := xml_with_push_low_level
		end

	set_xml_with_reader
		do
			value := xml_with_reader_low_level
		end

	set_xml_with_regexp
		do
			value := xml_with_regexp_low_level
		end

	set_xml_with_sax1
		do
			value := xml_with_sax1_low_level
		end

	set_xml_with_schemas
		do
			value := xml_with_schemas_low_level
		end

	set_xml_with_schematron
		do
			value := xml_with_schematron_low_level
		end

	set_xml_with_thread
		do
			value := xml_with_thread_low_level
		end

	set_xml_with_tree
		do
			value := xml_with_tree_low_level
		end

	set_xml_with_unicode
		do
			value := xml_with_unicode_low_level
		end

	set_xml_with_valid
		do
			value := xml_with_valid_low_level
		end

	set_xml_with_writer
		do
			value := xml_with_writer_low_level
		end

	set_xml_with_xinclude
		do
			value := xml_with_xinclude_low_level
		end

	set_xml_with_xpath
		do
			value := xml_with_xpath_low_level
		end

	set_xml_with_xptr
		do
			value := xml_with_xptr_low_level
		end

	set_xml_with_zlib
		do
			value := xml_with_zlib_low_level
		end

feature -- Queries
	is_xml_with_automata: BOOLEAN
		do
			Result := (value=xml_with_automata_low_level)
		end

	is_xml_with_c14n: BOOLEAN
		do
			Result := (value=xml_with_c14n_low_level)
		end

	is_xml_with_catalog: BOOLEAN
		do
			Result := (value=xml_with_catalog_low_level)
		end

	is_xml_with_debug: BOOLEAN
		do
			Result := (value=xml_with_debug_low_level)
		end

	is_xml_with_debug_mem: BOOLEAN
		do
			Result := (value=xml_with_debug_mem_low_level)
		end

	is_xml_with_debug_run: BOOLEAN
		do
			Result := (value=xml_with_debug_run_low_level)
		end

	is_xml_with_expr: BOOLEAN
		do
			Result := (value=xml_with_expr_low_level)
		end

	is_xml_with_ftp: BOOLEAN
		do
			Result := (value=xml_with_ftp_low_level)
		end

	is_xml_with_html: BOOLEAN
		do
			Result := (value=xml_with_html_low_level)
		end

	is_xml_with_http: BOOLEAN
		do
			Result := (value=xml_with_http_low_level)
		end

	is_xml_with_iconv: BOOLEAN
		do
			Result := (value=xml_with_iconv_low_level)
		end

	is_xml_with_icu: BOOLEAN
		do
			Result := (value=xml_with_icu_low_level)
		end

	is_xml_with_iso8859x: BOOLEAN
		do
			Result := (value=xml_with_iso8859x_low_level)
		end

	is_xml_with_legacy: BOOLEAN
		do
			Result := (value=xml_with_legacy_low_level)
		end

	is_xml_with_modules: BOOLEAN
		do
			Result := (value=xml_with_modules_low_level)
		end

	is_xml_with_none: BOOLEAN
		do
			Result := (value=xml_with_none_low_level)
		end

	is_xml_with_output: BOOLEAN
		do
			Result := (value=xml_with_output_low_level)
		end

	is_xml_with_pattern: BOOLEAN
		do
			Result := (value=xml_with_pattern_low_level)
		end

	is_xml_with_push: BOOLEAN
		do
			Result := (value=xml_with_push_low_level)
		end

	is_xml_with_reader: BOOLEAN
		do
			Result := (value=xml_with_reader_low_level)
		end

	is_xml_with_regexp: BOOLEAN
		do
			Result := (value=xml_with_regexp_low_level)
		end

	is_xml_with_sax1: BOOLEAN
		do
			Result := (value=xml_with_sax1_low_level)
		end

	is_xml_with_schemas: BOOLEAN
		do
			Result := (value=xml_with_schemas_low_level)
		end

	is_xml_with_schematron: BOOLEAN
		do
			Result := (value=xml_with_schematron_low_level)
		end

	is_xml_with_thread: BOOLEAN
		do
			Result := (value=xml_with_thread_low_level)
		end

	is_xml_with_tree: BOOLEAN
		do
			Result := (value=xml_with_tree_low_level)
		end

	is_xml_with_unicode: BOOLEAN
		do
			Result := (value=xml_with_unicode_low_level)
		end

	is_xml_with_valid: BOOLEAN
		do
			Result := (value=xml_with_valid_low_level)
		end

	is_xml_with_writer: BOOLEAN
		do
			Result := (value=xml_with_writer_low_level)
		end

	is_xml_with_xinclude: BOOLEAN
		do
			Result := (value=xml_with_xinclude_low_level)
		end

	is_xml_with_xpath: BOOLEAN
		do
			Result := (value=xml_with_xpath_low_level)
		end

	is_xml_with_xptr: BOOLEAN
		do
			Result := (value=xml_with_xptr_low_level)
		end

	is_xml_with_zlib: BOOLEAN
		do
			Result := (value=xml_with_zlib_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_with_automata_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_AUTOMATA"
 			}"
 		end

	xml_with_c14n_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_C14N"
 			}"
 		end

	xml_with_catalog_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_CATALOG"
 			}"
 		end

	xml_with_debug_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG"
 			}"
 		end

	xml_with_debug_mem_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG_MEM"
 			}"
 		end

	xml_with_debug_run_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG_RUN"
 			}"
 		end

	xml_with_expr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_EXPR"
 			}"
 		end

	xml_with_ftp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_FTP"
 			}"
 		end

	xml_with_html_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_HTML"
 			}"
 		end

	xml_with_http_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_HTTP"
 			}"
 		end

	xml_with_iconv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ICONV"
 			}"
 		end

	xml_with_icu_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ICU"
 			}"
 		end

	xml_with_iso8859x_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ISO8859X"
 			}"
 		end

	xml_with_legacy_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_LEGACY"
 			}"
 		end

	xml_with_modules_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_MODULES"
 			}"
 		end

	xml_with_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_NONE"
 			}"
 		end

	xml_with_output_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_OUTPUT"
 			}"
 		end

	xml_with_pattern_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_PATTERN"
 			}"
 		end

	xml_with_push_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_PUSH"
 			}"
 		end

	xml_with_reader_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_READER"
 			}"
 		end

	xml_with_regexp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_REGEXP"
 			}"
 		end

	xml_with_sax1_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SAX1"
 			}"
 		end

	xml_with_schemas_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SCHEMAS"
 			}"
 		end

	xml_with_schematron_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SCHEMATRON"
 			}"
 		end

	xml_with_thread_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_THREAD"
 			}"
 		end

	xml_with_tree_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_TREE"
 			}"
 		end

	xml_with_unicode_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_UNICODE"
 			}"
 		end

	xml_with_valid_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_VALID"
 			}"
 		end

	xml_with_writer_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_WRITER"
 			}"
 		end

	xml_with_xinclude_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XINCLUDE"
 			}"
 		end

	xml_with_xpath_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XPATH"
 			}"
 		end

	xml_with_xptr_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XPTR"
 			}"
 		end

	xml_with_zlib_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ZLIB"
 			}"
 		end


end -- class XML_FEATURE_ENUM
