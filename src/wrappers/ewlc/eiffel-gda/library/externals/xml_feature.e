-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_FEATURE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_with_thread) or else 
				(a_value = xml_with_tree) or else 
				(a_value = xml_with_output) or else 
				(a_value = xml_with_push) or else 
				(a_value = xml_with_reader) or else 
				(a_value = xml_with_pattern) or else 
				(a_value = xml_with_writer) or else 
				(a_value = xml_with_sax1) or else 
				(a_value = xml_with_ftp) or else 
				(a_value = xml_with_http) or else 
				(a_value = xml_with_valid) or else 
				(a_value = xml_with_html) or else 
				(a_value = xml_with_legacy) or else 
				(a_value = xml_with_c14n) or else 
				(a_value = xml_with_catalog) or else 
				(a_value = xml_with_xpath) or else 
				(a_value = xml_with_xptr) or else 
				(a_value = xml_with_xinclude) or else 
				(a_value = xml_with_iconv) or else 
				(a_value = xml_with_iso8859x) or else 
				(a_value = xml_with_unicode) or else 
				(a_value = xml_with_regexp) or else 
				(a_value = xml_with_automata) or else 
				(a_value = xml_with_expr) or else 
				(a_value = xml_with_schemas) or else 
				(a_value = xml_with_schematron) or else 
				(a_value = xml_with_modules) or else 
				(a_value = xml_with_debug) or else 
				(a_value = xml_with_debug_mem) or else 
				(a_value = xml_with_debug_run) or else 
				(a_value = xml_with_zlib) or else 
				(a_value = xml_with_none))
		end


feature {ANY} -- Setters
	default_create, set_thread
		do
			value := xml_with_thread
		end

	set_tree
		do
			value := xml_with_tree
		end

	set_output
		do
			value := xml_with_output
		end

	set_push
		do
			value := xml_with_push
		end

	set_reader
		do
			value := xml_with_reader
		end

	set_pattern
		do
			value := xml_with_pattern
		end

	set_writer
		do
			value := xml_with_writer
		end

	set_sax1
		do
			value := xml_with_sax1
		end

	set_ftp
		do
			value := xml_with_ftp
		end

	set_http
		do
			value := xml_with_http
		end

	set_valid
		do
			value := xml_with_valid
		end

	set_html
		do
			value := xml_with_html
		end

	set_legacy
		do
			value := xml_with_legacy
		end

	set_c14n
		do
			value := xml_with_c14n
		end

	set_catalog
		do
			value := xml_with_catalog
		end

	set_xpath
		do
			value := xml_with_xpath
		end

	set_xptr
		do
			value := xml_with_xptr
		end

	set_xinclude
		do
			value := xml_with_xinclude
		end

	set_iconv
		do
			value := xml_with_iconv
		end

	set_iso8859x
		do
			value := xml_with_iso8859x
		end

	set_unicode
		do
			value := xml_with_unicode
		end

	set_regexp
		do
			value := xml_with_regexp
		end

	set_automata
		do
			value := xml_with_automata
		end

	set_expr
		do
			value := xml_with_expr
		end

	set_schemas
		do
			value := xml_with_schemas
		end

	set_schematron
		do
			value := xml_with_schematron
		end

	set_modules
		do
			value := xml_with_modules
		end

	set_debug_external
		do
			value := xml_with_debug
		end

	set_debug_mem
		do
			value := xml_with_debug_mem
		end

	set_debug_run
		do
			value := xml_with_debug_run
		end

	set_zlib
		do
			value := xml_with_zlib
		end

	set_none
		do
			value := xml_with_none
		end


feature {ANY} -- Queries
	is_thread: BOOLEAN
		do
			Result := (value=xml_with_thread)
		end

	is_tree: BOOLEAN
		do
			Result := (value=xml_with_tree)
		end

	is_output: BOOLEAN
		do
			Result := (value=xml_with_output)
		end

	is_push: BOOLEAN
		do
			Result := (value=xml_with_push)
		end

	is_reader: BOOLEAN
		do
			Result := (value=xml_with_reader)
		end

	is_pattern: BOOLEAN
		do
			Result := (value=xml_with_pattern)
		end

	is_writer: BOOLEAN
		do
			Result := (value=xml_with_writer)
		end

	is_sax1: BOOLEAN
		do
			Result := (value=xml_with_sax1)
		end

	is_ftp: BOOLEAN
		do
			Result := (value=xml_with_ftp)
		end

	is_http: BOOLEAN
		do
			Result := (value=xml_with_http)
		end

	is_valid: BOOLEAN
		do
			Result := (value=xml_with_valid)
		end

	is_html: BOOLEAN
		do
			Result := (value=xml_with_html)
		end

	is_legacy: BOOLEAN
		do
			Result := (value=xml_with_legacy)
		end

	is_c14n: BOOLEAN
		do
			Result := (value=xml_with_c14n)
		end

	is_catalog: BOOLEAN
		do
			Result := (value=xml_with_catalog)
		end

	is_xpath: BOOLEAN
		do
			Result := (value=xml_with_xpath)
		end

	is_xptr: BOOLEAN
		do
			Result := (value=xml_with_xptr)
		end

	is_xinclude: BOOLEAN
		do
			Result := (value=xml_with_xinclude)
		end

	is_iconv: BOOLEAN
		do
			Result := (value=xml_with_iconv)
		end

	is_iso8859x: BOOLEAN
		do
			Result := (value=xml_with_iso8859x)
		end

	is_unicode: BOOLEAN
		do
			Result := (value=xml_with_unicode)
		end

	is_regexp: BOOLEAN
		do
			Result := (value=xml_with_regexp)
		end

	is_automata: BOOLEAN
		do
			Result := (value=xml_with_automata)
		end

	is_expr: BOOLEAN
		do
			Result := (value=xml_with_expr)
		end

	is_schemas: BOOLEAN
		do
			Result := (value=xml_with_schemas)
		end

	is_schematron: BOOLEAN
		do
			Result := (value=xml_with_schematron)
		end

	is_modules: BOOLEAN
		do
			Result := (value=xml_with_modules)
		end

	is_debug_external: BOOLEAN
		do
			Result := (value=xml_with_debug)
		end

	is_debug_mem: BOOLEAN
		do
			Result := (value=xml_with_debug_mem)
		end

	is_debug_run: BOOLEAN
		do
			Result := (value=xml_with_debug_run)
		end

	is_zlib: BOOLEAN
		do
			Result := (value=xml_with_zlib)
		end

	is_none: BOOLEAN
		do
			Result := (value=xml_with_none)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_with_thread: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_THREAD"
		end

	xml_with_tree: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_TREE"
		end

	xml_with_output: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_OUTPUT"
		end

	xml_with_push: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_PUSH"
		end

	xml_with_reader: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_READER"
		end

	xml_with_pattern: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_PATTERN"
		end

	xml_with_writer: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_WRITER"
		end

	xml_with_sax1: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_SAX1"
		end

	xml_with_ftp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_FTP"
		end

	xml_with_http: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_HTTP"
		end

	xml_with_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_VALID"
		end

	xml_with_html: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_HTML"
		end

	xml_with_legacy: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_LEGACY"
		end

	xml_with_c14n: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_C14N"
		end

	xml_with_catalog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_CATALOG"
		end

	xml_with_xpath: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_XPATH"
		end

	xml_with_xptr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_XPTR"
		end

	xml_with_xinclude: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_XINCLUDE"
		end

	xml_with_iconv: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_ICONV"
		end

	xml_with_iso8859x: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_ISO8859X"
		end

	xml_with_unicode: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_UNICODE"
		end

	xml_with_regexp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_REGEXP"
		end

	xml_with_automata: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_AUTOMATA"
		end

	xml_with_expr: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_EXPR"
		end

	xml_with_schemas: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_SCHEMAS"
		end

	xml_with_schematron: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_SCHEMATRON"
		end

	xml_with_modules: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_MODULES"
		end

	xml_with_debug: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_DEBUG"
		end

	xml_with_debug_mem: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_DEBUG_MEM"
		end

	xml_with_debug_run: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_DEBUG_RUN"
		end

	xml_with_zlib: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_ZLIB"
		end

	xml_with_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_WITH_NONE"
		end


end

