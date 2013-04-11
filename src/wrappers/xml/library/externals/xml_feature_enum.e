-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_FEATURE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = thread_low_level)  or else
				(a_value = tree_low_level)  or else
				(a_value = output_low_level)  or else
				(a_value = push_low_level)  or else
				(a_value = reader_low_level)  or else
				(a_value = pattern_low_level)  or else
				(a_value = writer_low_level)  or else
				(a_value = sax1_low_level)  or else
				(a_value = ftp_low_level)  or else
				(a_value = http_low_level)  or else
				(a_value = valid_low_level)  or else
				(a_value = html_low_level)  or else
				(a_value = legacy_low_level)  or else
				(a_value = c14n_low_level)  or else
				(a_value = catalog_low_level)  or else
				(a_value = xpath_low_level)  or else
				(a_value = xptr_low_level)  or else
				(a_value = xinclude_low_level)  or else
				(a_value = iconv_low_level)  or else
				(a_value = iso8859x_low_level)  or else
				(a_value = unicode_low_level)  or else
				(a_value = regexp_low_level)  or else
				(a_value = automata_low_level)  or else
				(a_value = expr_low_level)  or else
				(a_value = schemas_low_level)  or else
				(a_value = schematron_low_level)  or else
				(a_value = modules_low_level)  or else
				(a_value = debug_external_low_level)  or else
				(a_value = debug_mem_low_level)  or else
				(a_value = debug_run_low_level)  or else
				(a_value = zlib_low_level)  or else
				(a_value = icu_low_level)  or else
				(a_value = none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_thread is
		do
			value := thread_low_level
		end

	set_tree is
		do
			value := tree_low_level
		end

	set_output is
		do
			value := output_low_level
		end

	set_push is
		do
			value := push_low_level
		end

	set_reader is
		do
			value := reader_low_level
		end

	set_pattern is
		do
			value := pattern_low_level
		end

	set_writer is
		do
			value := writer_low_level
		end

	set_sax1 is
		do
			value := sax1_low_level
		end

	set_ftp is
		do
			value := ftp_low_level
		end

	set_http is
		do
			value := http_low_level
		end

	set_valid is
		do
			value := valid_low_level
		end

	set_html is
		do
			value := html_low_level
		end

	set_legacy is
		do
			value := legacy_low_level
		end

	set_c14n is
		do
			value := c14n_low_level
		end

	set_catalog is
		do
			value := catalog_low_level
		end

	set_xpath is
		do
			value := xpath_low_level
		end

	set_xptr is
		do
			value := xptr_low_level
		end

	set_xinclude is
		do
			value := xinclude_low_level
		end

	set_iconv is
		do
			value := iconv_low_level
		end

	set_iso8859x is
		do
			value := iso8859x_low_level
		end

	set_unicode is
		do
			value := unicode_low_level
		end

	set_regexp is
		do
			value := regexp_low_level
		end

	set_automata is
		do
			value := automata_low_level
		end

	set_expr is
		do
			value := expr_low_level
		end

	set_schemas is
		do
			value := schemas_low_level
		end

	set_schematron is
		do
			value := schematron_low_level
		end

	set_modules is
		do
			value := modules_low_level
		end

	set_debug_external is
		do
			value := debug_external_low_level
		end

	set_debug_mem is
		do
			value := debug_mem_low_level
		end

	set_debug_run is
		do
			value := debug_run_low_level
		end

	set_zlib is
		do
			value := zlib_low_level
		end

	set_icu is
		do
			value := icu_low_level
		end

	set_none is
		do
			value := none_low_level
		end

feature {ANY} -- Queries
	thread: BOOLEAN is
		do
			Result := (value=thread_low_level)
		end

	tree: BOOLEAN is
		do
			Result := (value=tree_low_level)
		end

	output: BOOLEAN is
		do
			Result := (value=output_low_level)
		end

	push: BOOLEAN is
		do
			Result := (value=push_low_level)
		end

	reader: BOOLEAN is
		do
			Result := (value=reader_low_level)
		end

	pattern: BOOLEAN is
		do
			Result := (value=pattern_low_level)
		end

	writer: BOOLEAN is
		do
			Result := (value=writer_low_level)
		end

	sax1: BOOLEAN is
		do
			Result := (value=sax1_low_level)
		end

	ftp: BOOLEAN is
		do
			Result := (value=ftp_low_level)
		end

	http: BOOLEAN is
		do
			Result := (value=http_low_level)
		end

	valid: BOOLEAN is
		do
			Result := (value=valid_low_level)
		end

	html: BOOLEAN is
		do
			Result := (value=html_low_level)
		end

	legacy: BOOLEAN is
		do
			Result := (value=legacy_low_level)
		end

	c14n: BOOLEAN is
		do
			Result := (value=c14n_low_level)
		end

	catalog: BOOLEAN is
		do
			Result := (value=catalog_low_level)
		end

	xpath: BOOLEAN is
		do
			Result := (value=xpath_low_level)
		end

	xptr: BOOLEAN is
		do
			Result := (value=xptr_low_level)
		end

	xinclude: BOOLEAN is
		do
			Result := (value=xinclude_low_level)
		end

	iconv: BOOLEAN is
		do
			Result := (value=iconv_low_level)
		end

	iso8859x: BOOLEAN is
		do
			Result := (value=iso8859x_low_level)
		end

	unicode: BOOLEAN is
		do
			Result := (value=unicode_low_level)
		end

	regexp: BOOLEAN is
		do
			Result := (value=regexp_low_level)
		end

	automata: BOOLEAN is
		do
			Result := (value=automata_low_level)
		end

	expr: BOOLEAN is
		do
			Result := (value=expr_low_level)
		end

	schemas: BOOLEAN is
		do
			Result := (value=schemas_low_level)
		end

	schematron: BOOLEAN is
		do
			Result := (value=schematron_low_level)
		end

	modules: BOOLEAN is
		do
			Result := (value=modules_low_level)
		end

	debug_external: BOOLEAN is
		do
			Result := (value=debug_external_low_level)
		end

	debug_mem: BOOLEAN is
		do
			Result := (value=debug_mem_low_level)
		end

	debug_run: BOOLEAN is
		do
			Result := (value=debug_run_low_level)
		end

	zlib: BOOLEAN is
		do
			Result := (value=zlib_low_level)
		end

	icu: BOOLEAN is
		do
			Result := (value=icu_low_level)
		end

	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	thread_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_THREAD"
 			}"
 		end

	tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_TREE"
 			}"
 		end

	output_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_OUTPUT"
 			}"
 		end

	push_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_PUSH"
 			}"
 		end

	reader_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_READER"
 			}"
 		end

	pattern_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_PATTERN"
 			}"
 		end

	writer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_WRITER"
 			}"
 		end

	sax1_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SAX1"
 			}"
 		end

	ftp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_FTP"
 			}"
 		end

	http_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_HTTP"
 			}"
 		end

	valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_VALID"
 			}"
 		end

	html_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_HTML"
 			}"
 		end

	legacy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_LEGACY"
 			}"
 		end

	c14n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_C14N"
 			}"
 		end

	catalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_CATALOG"
 			}"
 		end

	xpath_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XPATH"
 			}"
 		end

	xptr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XPTR"
 			}"
 		end

	xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_XINCLUDE"
 			}"
 		end

	iconv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ICONV"
 			}"
 		end

	iso8859x_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ISO8859X"
 			}"
 		end

	unicode_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_UNICODE"
 			}"
 		end

	regexp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_REGEXP"
 			}"
 		end

	automata_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_AUTOMATA"
 			}"
 		end

	expr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_EXPR"
 			}"
 		end

	schemas_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SCHEMAS"
 			}"
 		end

	schematron_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_SCHEMATRON"
 			}"
 		end

	modules_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_MODULES"
 			}"
 		end

	debug_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG"
 			}"
 		end

	debug_mem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG_MEM"
 			}"
 		end

	debug_run_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_DEBUG_RUN"
 			}"
 		end

	zlib_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ZLIB"
 			}"
 		end

	icu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_ICU"
 			}"
 		end

	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_WITH_NONE"
 			}"
 		end


end -- class XML_FEATURE_ENUM
