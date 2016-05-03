-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_FEATURE_ENUM

-- Wrapper of enum xmlFeature defined in file /usr/include/libxml2/libxml/parser.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = automata_low_level)  or else
				(a_value = c14n_low_level)  or else
				(a_value = catalog_low_level)  or else
				(a_value = debug_external_low_level)  or else
				(a_value = debug_mem_low_level)  or else
				(a_value = debug_run_low_level)  or else
				(a_value = expr_low_level)  or else
				(a_value = ftp_low_level)  or else
				(a_value = html_low_level)  or else
				(a_value = http_low_level)  or else
				(a_value = iconv_low_level)  or else
				(a_value = icu_low_level)  or else
				(a_value = iso8859x_low_level)  or else
				(a_value = legacy_low_level)  or else
				(a_value = lzma_low_level)  or else
				(a_value = modules_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = output_low_level)  or else
				(a_value = pattern_low_level)  or else
				(a_value = push_low_level)  or else
				(a_value = reader_low_level)  or else
				(a_value = regexp_low_level)  or else
				(a_value = sax1_low_level)  or else
				(a_value = schemas_low_level)  or else
				(a_value = schematron_low_level)  or else
				(a_value = thread_low_level)  or else
				(a_value = tree_low_level)  or else
				(a_value = unicode_low_level)  or else
				(a_value = valid_low_level)  or else
				(a_value = writer_low_level)  or else
				(a_value = xinclude_low_level)  or else
				(a_value = xpath_low_level)  or else
				(a_value = xptr_low_level)  or else
				(a_value = zlib_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_automata
               do
                       value := automata_low_level
               end

	set_c14n
               do
                       value := c14n_low_level
               end

	set_catalog
               do
                       value := catalog_low_level
               end

	set_debug_external
               do
                       value := debug_external_low_level
               end

	set_debug_mem
               do
                       value := debug_mem_low_level
               end

	set_debug_run
               do
                       value := debug_run_low_level
               end

	set_expr
               do
                       value := expr_low_level
               end

	set_ftp
               do
                       value := ftp_low_level
               end

	set_html
               do
                       value := html_low_level
               end

	set_http
               do
                       value := http_low_level
               end

	set_iconv
               do
                       value := iconv_low_level
               end

	set_icu
               do
                       value := icu_low_level
               end

	set_iso8859x
               do
                       value := iso8859x_low_level
               end

	set_legacy
               do
                       value := legacy_low_level
               end

	set_lzma
               do
                       value := lzma_low_level
               end

	set_modules
               do
                       value := modules_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_output
               do
                       value := output_low_level
               end

	set_pattern
               do
                       value := pattern_low_level
               end

	set_push
               do
                       value := push_low_level
               end

	set_reader
               do
                       value := reader_low_level
               end

	set_regexp
               do
                       value := regexp_low_level
               end

	set_sax1
               do
                       value := sax1_low_level
               end

	set_schemas
               do
                       value := schemas_low_level
               end

	set_schematron
               do
                       value := schematron_low_level
               end

	set_thread
               do
                       value := thread_low_level
               end

	set_tree
               do
                       value := tree_low_level
               end

	set_unicode
               do
                       value := unicode_low_level
               end

	set_valid
               do
                       value := valid_low_level
               end

	set_writer
               do
                       value := writer_low_level
               end

	set_xinclude
               do
                       value := xinclude_low_level
               end

	set_xpath
               do
                       value := xpath_low_level
               end

	set_xptr
               do
                       value := xptr_low_level
               end

	set_zlib
               do
                       value := zlib_low_level
               end

feature {ANY} -- Queries
       is_automata: BOOLEAN
               do
                       Result := (value=automata_low_level)
               end

       is_c14n: BOOLEAN
               do
                       Result := (value=c14n_low_level)
               end

       is_catalog: BOOLEAN
               do
                       Result := (value=catalog_low_level)
               end

       is_debug_external: BOOLEAN
               do
                       Result := (value=debug_external_low_level)
               end

       is_debug_mem: BOOLEAN
               do
                       Result := (value=debug_mem_low_level)
               end

       is_debug_run: BOOLEAN
               do
                       Result := (value=debug_run_low_level)
               end

       is_expr: BOOLEAN
               do
                       Result := (value=expr_low_level)
               end

       is_ftp: BOOLEAN
               do
                       Result := (value=ftp_low_level)
               end

       is_html: BOOLEAN
               do
                       Result := (value=html_low_level)
               end

       is_http: BOOLEAN
               do
                       Result := (value=http_low_level)
               end

       is_iconv: BOOLEAN
               do
                       Result := (value=iconv_low_level)
               end

       is_icu: BOOLEAN
               do
                       Result := (value=icu_low_level)
               end

       is_iso8859x: BOOLEAN
               do
                       Result := (value=iso8859x_low_level)
               end

       is_legacy: BOOLEAN
               do
                       Result := (value=legacy_low_level)
               end

       is_lzma: BOOLEAN
               do
                       Result := (value=lzma_low_level)
               end

       is_modules: BOOLEAN
               do
                       Result := (value=modules_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_output: BOOLEAN
               do
                       Result := (value=output_low_level)
               end

       is_pattern: BOOLEAN
               do
                       Result := (value=pattern_low_level)
               end

       is_push: BOOLEAN
               do
                       Result := (value=push_low_level)
               end

       is_reader: BOOLEAN
               do
                       Result := (value=reader_low_level)
               end

       is_regexp: BOOLEAN
               do
                       Result := (value=regexp_low_level)
               end

       is_sax1: BOOLEAN
               do
                       Result := (value=sax1_low_level)
               end

       is_schemas: BOOLEAN
               do
                       Result := (value=schemas_low_level)
               end

       is_schematron: BOOLEAN
               do
                       Result := (value=schematron_low_level)
               end

       is_thread: BOOLEAN
               do
                       Result := (value=thread_low_level)
               end

       is_tree: BOOLEAN
               do
                       Result := (value=tree_low_level)
               end

       is_unicode: BOOLEAN
               do
                       Result := (value=unicode_low_level)
               end

       is_valid: BOOLEAN
               do
                       Result := (value=valid_low_level)
               end

       is_writer: BOOLEAN
               do
                       Result := (value=writer_low_level)
               end

       is_xinclude: BOOLEAN
               do
                       Result := (value=xinclude_low_level)
               end

       is_xpath: BOOLEAN
               do
                       Result := (value=xpath_low_level)
               end

       is_xptr: BOOLEAN
               do
                       Result := (value=xptr_low_level)
               end

       is_zlib: BOOLEAN
               do
                       Result := (value=zlib_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     automata_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_AUTOMATA"
                       }"
               end

     c14n_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_C14N"
                       }"
               end

     catalog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_CATALOG"
                       }"
               end

     debug_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_DEBUG"
                       }"
               end

     debug_mem_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_DEBUG_MEM"
                       }"
               end

     debug_run_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_DEBUG_RUN"
                       }"
               end

     expr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_EXPR"
                       }"
               end

     ftp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_FTP"
                       }"
               end

     html_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_HTML"
                       }"
               end

     http_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_HTTP"
                       }"
               end

     iconv_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_ICONV"
                       }"
               end

     icu_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_ICU"
                       }"
               end

     iso8859x_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_ISO8859X"
                       }"
               end

     legacy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_LEGACY"
                       }"
               end

     lzma_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_LZMA"
                       }"
               end

     modules_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_MODULES"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_NONE"
                       }"
               end

     output_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_OUTPUT"
                       }"
               end

     pattern_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_PATTERN"
                       }"
               end

     push_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_PUSH"
                       }"
               end

     reader_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_READER"
                       }"
               end

     regexp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_REGEXP"
                       }"
               end

     sax1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_SAX1"
                       }"
               end

     schemas_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_SCHEMAS"
                       }"
               end

     schematron_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_SCHEMATRON"
                       }"
               end

     thread_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_THREAD"
                       }"
               end

     tree_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_TREE"
                       }"
               end

     unicode_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_UNICODE"
                       }"
               end

     valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_VALID"
                       }"
               end

     writer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_WRITER"
                       }"
               end

     xinclude_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_XINCLUDE"
                       }"
               end

     xpath_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_XPATH"
                       }"
               end

     xptr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_XPTR"
                       }"
               end

     zlib_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_WITH_ZLIB"
                       }"
               end


end -- class XML_FEATURE_ENUM
