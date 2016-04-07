-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ERROR_DOMAIN_ENUM

-- Wrapper of enum xmlErrorDomain defined in file /usr/include/libxml2/libxml/xmlerror.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = buffer_low_level)  or else
				(a_value = c14n_low_level)  or else
				(a_value = catalog_low_level)  or else
				(a_value = check_external_low_level)  or else
				(a_value = datatype_low_level)  or else
				(a_value = dtd_low_level)  or else
				(a_value = ftp_low_level)  or else
				(a_value = html_low_level)  or else
				(a_value = http_low_level)  or else
				(a_value = i18n_low_level)  or else
				(a_value = io_low_level)  or else
				(a_value = memory_low_level)  or else
				(a_value = module_low_level)  or else
				(a_value = namespace_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = output_low_level)  or else
				(a_value = parser_low_level)  or else
				(a_value = regexp_low_level)  or else
				(a_value = relaxngp_low_level)  or else
				(a_value = relaxngv_low_level)  or else
				(a_value = schemasp_low_level)  or else
				(a_value = schemasv_low_level)  or else
				(a_value = schematronv_low_level)  or else
				(a_value = tree_low_level)  or else
				(a_value = uri_low_level)  or else
				(a_value = valid_low_level)  or else
				(a_value = writer_low_level)  or else
				(a_value = xinclude_low_level)  or else
				(a_value = xpath_low_level)  or else
				(a_value = xpointer_low_level)  or else
				(a_value = xslt_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_buffer
               do
                       value := buffer_low_level
               end

	set_c14n
               do
                       value := c14n_low_level
               end

	set_catalog
               do
                       value := catalog_low_level
               end

	set_check_external
               do
                       value := check_external_low_level
               end

	set_datatype
               do
                       value := datatype_low_level
               end

	set_dtd
               do
                       value := dtd_low_level
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

	set_i18n
               do
                       value := i18n_low_level
               end

	set_io
               do
                       value := io_low_level
               end

	set_memory
               do
                       value := memory_low_level
               end

	set_module
               do
                       value := module_low_level
               end

	set_namespace
               do
                       value := namespace_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_output
               do
                       value := output_low_level
               end

	set_parser
               do
                       value := parser_low_level
               end

	set_regexp
               do
                       value := regexp_low_level
               end

	set_relaxngp
               do
                       value := relaxngp_low_level
               end

	set_relaxngv
               do
                       value := relaxngv_low_level
               end

	set_schemasp
               do
                       value := schemasp_low_level
               end

	set_schemasv
               do
                       value := schemasv_low_level
               end

	set_schematronv
               do
                       value := schematronv_low_level
               end

	set_tree
               do
                       value := tree_low_level
               end

	set_uri
               do
                       value := uri_low_level
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

	set_xpointer
               do
                       value := xpointer_low_level
               end

	set_xslt
               do
                       value := xslt_low_level
               end

feature {ANY} -- Queries
       is_buffer: BOOLEAN
               do
                       Result := (value=buffer_low_level)
               end

       is_c14n: BOOLEAN
               do
                       Result := (value=c14n_low_level)
               end

       is_catalog: BOOLEAN
               do
                       Result := (value=catalog_low_level)
               end

       is_check_external: BOOLEAN
               do
                       Result := (value=check_external_low_level)
               end

       is_datatype: BOOLEAN
               do
                       Result := (value=datatype_low_level)
               end

       is_dtd: BOOLEAN
               do
                       Result := (value=dtd_low_level)
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

       is_i18n: BOOLEAN
               do
                       Result := (value=i18n_low_level)
               end

       is_io: BOOLEAN
               do
                       Result := (value=io_low_level)
               end

       is_memory: BOOLEAN
               do
                       Result := (value=memory_low_level)
               end

       is_module: BOOLEAN
               do
                       Result := (value=module_low_level)
               end

       is_namespace: BOOLEAN
               do
                       Result := (value=namespace_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_output: BOOLEAN
               do
                       Result := (value=output_low_level)
               end

       is_parser: BOOLEAN
               do
                       Result := (value=parser_low_level)
               end

       is_regexp: BOOLEAN
               do
                       Result := (value=regexp_low_level)
               end

       is_relaxngp: BOOLEAN
               do
                       Result := (value=relaxngp_low_level)
               end

       is_relaxngv: BOOLEAN
               do
                       Result := (value=relaxngv_low_level)
               end

       is_schemasp: BOOLEAN
               do
                       Result := (value=schemasp_low_level)
               end

       is_schemasv: BOOLEAN
               do
                       Result := (value=schemasv_low_level)
               end

       is_schematronv: BOOLEAN
               do
                       Result := (value=schematronv_low_level)
               end

       is_tree: BOOLEAN
               do
                       Result := (value=tree_low_level)
               end

       is_uri: BOOLEAN
               do
                       Result := (value=uri_low_level)
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

       is_xpointer: BOOLEAN
               do
                       Result := (value=xpointer_low_level)
               end

       is_xslt: BOOLEAN
               do
                       Result := (value=xslt_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     buffer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_BUFFER"
                       }"
               end

     c14n_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_C14N"
                       }"
               end

     catalog_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_CATALOG"
                       }"
               end

     check_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_CHECK"
                       }"
               end

     datatype_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_DATATYPE"
                       }"
               end

     dtd_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_DTD"
                       }"
               end

     ftp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_FTP"
                       }"
               end

     html_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_HTML"
                       }"
               end

     http_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_HTTP"
                       }"
               end

     i18n_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_I18N"
                       }"
               end

     io_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_IO"
                       }"
               end

     memory_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_MEMORY"
                       }"
               end

     module_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_MODULE"
                       }"
               end

     namespace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_NAMESPACE"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_NONE"
                       }"
               end

     output_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_OUTPUT"
                       }"
               end

     parser_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_PARSER"
                       }"
               end

     regexp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_REGEXP"
                       }"
               end

     relaxngp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_RELAXNGP"
                       }"
               end

     relaxngv_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_RELAXNGV"
                       }"
               end

     schemasp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_SCHEMASP"
                       }"
               end

     schemasv_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_SCHEMASV"
                       }"
               end

     schematronv_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_SCHEMATRONV"
                       }"
               end

     tree_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_TREE"
                       }"
               end

     uri_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_URI"
                       }"
               end

     valid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_VALID"
                       }"
               end

     writer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_WRITER"
                       }"
               end

     xinclude_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_XINCLUDE"
                       }"
               end

     xpath_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_XPATH"
                       }"
               end

     xpointer_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_XPOINTER"
                       }"
               end

     xslt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_FROM_XSLT"
                       }"
               end


end -- class XML_ERROR_DOMAIN_ENUM
