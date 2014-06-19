-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ERROR_DOMAIN_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_from_c14n_low_level)  or else
				(a_value = xml_from_catalog_low_level)  or else
				(a_value = xml_from_check_low_level)  or else
				(a_value = xml_from_datatype_low_level)  or else
				(a_value = xml_from_dtd_low_level)  or else
				(a_value = xml_from_ftp_low_level)  or else
				(a_value = xml_from_html_low_level)  or else
				(a_value = xml_from_http_low_level)  or else
				(a_value = xml_from_i18n_low_level)  or else
				(a_value = xml_from_io_low_level)  or else
				(a_value = xml_from_memory_low_level)  or else
				(a_value = xml_from_module_low_level)  or else
				(a_value = xml_from_namespace_low_level)  or else
				(a_value = xml_from_none_low_level)  or else
				(a_value = xml_from_output_low_level)  or else
				(a_value = xml_from_parser_low_level)  or else
				(a_value = xml_from_regexp_low_level)  or else
				(a_value = xml_from_relaxngp_low_level)  or else
				(a_value = xml_from_relaxngv_low_level)  or else
				(a_value = xml_from_schemasp_low_level)  or else
				(a_value = xml_from_schemasv_low_level)  or else
				(a_value = xml_from_schematronv_low_level)  or else
				(a_value = xml_from_tree_low_level)  or else
				(a_value = xml_from_valid_low_level)  or else
				(a_value = xml_from_writer_low_level)  or else
				(a_value = xml_from_xinclude_low_level)  or else
				(a_value = xml_from_xpath_low_level)  or else
				(a_value = xml_from_xpointer_low_level)  or else
				(a_value = xml_from_xslt_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_from_c14n
		do
			value := xml_from_c14n_low_level
		end

	set_xml_from_catalog
		do
			value := xml_from_catalog_low_level
		end

	set_xml_from_check
		do
			value := xml_from_check_low_level
		end

	set_xml_from_datatype
		do
			value := xml_from_datatype_low_level
		end

	set_xml_from_dtd
		do
			value := xml_from_dtd_low_level
		end

	set_xml_from_ftp
		do
			value := xml_from_ftp_low_level
		end

	set_xml_from_html
		do
			value := xml_from_html_low_level
		end

	set_xml_from_http
		do
			value := xml_from_http_low_level
		end

	set_xml_from_i18n
		do
			value := xml_from_i18n_low_level
		end

	set_xml_from_io
		do
			value := xml_from_io_low_level
		end

	set_xml_from_memory
		do
			value := xml_from_memory_low_level
		end

	set_xml_from_module
		do
			value := xml_from_module_low_level
		end

	set_xml_from_namespace
		do
			value := xml_from_namespace_low_level
		end

	set_xml_from_none
		do
			value := xml_from_none_low_level
		end

	set_xml_from_output
		do
			value := xml_from_output_low_level
		end

	set_xml_from_parser
		do
			value := xml_from_parser_low_level
		end

	set_xml_from_regexp
		do
			value := xml_from_regexp_low_level
		end

	set_xml_from_relaxngp
		do
			value := xml_from_relaxngp_low_level
		end

	set_xml_from_relaxngv
		do
			value := xml_from_relaxngv_low_level
		end

	set_xml_from_schemasp
		do
			value := xml_from_schemasp_low_level
		end

	set_xml_from_schemasv
		do
			value := xml_from_schemasv_low_level
		end

	set_xml_from_schematronv
		do
			value := xml_from_schematronv_low_level
		end

	set_xml_from_tree
		do
			value := xml_from_tree_low_level
		end

	set_xml_from_valid
		do
			value := xml_from_valid_low_level
		end

	set_xml_from_writer
		do
			value := xml_from_writer_low_level
		end

	set_xml_from_xinclude
		do
			value := xml_from_xinclude_low_level
		end

	set_xml_from_xpath
		do
			value := xml_from_xpath_low_level
		end

	set_xml_from_xpointer
		do
			value := xml_from_xpointer_low_level
		end

	set_xml_from_xslt
		do
			value := xml_from_xslt_low_level
		end

feature -- Queries
	is_xml_from_c14n: BOOLEAN
		do
			Result := (value=xml_from_c14n_low_level)
		end

	is_xml_from_catalog: BOOLEAN
		do
			Result := (value=xml_from_catalog_low_level)
		end

	is_xml_from_check: BOOLEAN
		do
			Result := (value=xml_from_check_low_level)
		end

	is_xml_from_datatype: BOOLEAN
		do
			Result := (value=xml_from_datatype_low_level)
		end

	is_xml_from_dtd: BOOLEAN
		do
			Result := (value=xml_from_dtd_low_level)
		end

	is_xml_from_ftp: BOOLEAN
		do
			Result := (value=xml_from_ftp_low_level)
		end

	is_xml_from_html: BOOLEAN
		do
			Result := (value=xml_from_html_low_level)
		end

	is_xml_from_http: BOOLEAN
		do
			Result := (value=xml_from_http_low_level)
		end

	is_xml_from_i18n: BOOLEAN
		do
			Result := (value=xml_from_i18n_low_level)
		end

	is_xml_from_io: BOOLEAN
		do
			Result := (value=xml_from_io_low_level)
		end

	is_xml_from_memory: BOOLEAN
		do
			Result := (value=xml_from_memory_low_level)
		end

	is_xml_from_module: BOOLEAN
		do
			Result := (value=xml_from_module_low_level)
		end

	is_xml_from_namespace: BOOLEAN
		do
			Result := (value=xml_from_namespace_low_level)
		end

	is_xml_from_none: BOOLEAN
		do
			Result := (value=xml_from_none_low_level)
		end

	is_xml_from_output: BOOLEAN
		do
			Result := (value=xml_from_output_low_level)
		end

	is_xml_from_parser: BOOLEAN
		do
			Result := (value=xml_from_parser_low_level)
		end

	is_xml_from_regexp: BOOLEAN
		do
			Result := (value=xml_from_regexp_low_level)
		end

	is_xml_from_relaxngp: BOOLEAN
		do
			Result := (value=xml_from_relaxngp_low_level)
		end

	is_xml_from_relaxngv: BOOLEAN
		do
			Result := (value=xml_from_relaxngv_low_level)
		end

	is_xml_from_schemasp: BOOLEAN
		do
			Result := (value=xml_from_schemasp_low_level)
		end

	is_xml_from_schemasv: BOOLEAN
		do
			Result := (value=xml_from_schemasv_low_level)
		end

	is_xml_from_schematronv: BOOLEAN
		do
			Result := (value=xml_from_schematronv_low_level)
		end

	is_xml_from_tree: BOOLEAN
		do
			Result := (value=xml_from_tree_low_level)
		end

	is_xml_from_valid: BOOLEAN
		do
			Result := (value=xml_from_valid_low_level)
		end

	is_xml_from_writer: BOOLEAN
		do
			Result := (value=xml_from_writer_low_level)
		end

	is_xml_from_xinclude: BOOLEAN
		do
			Result := (value=xml_from_xinclude_low_level)
		end

	is_xml_from_xpath: BOOLEAN
		do
			Result := (value=xml_from_xpath_low_level)
		end

	is_xml_from_xpointer: BOOLEAN
		do
			Result := (value=xml_from_xpointer_low_level)
		end

	is_xml_from_xslt: BOOLEAN
		do
			Result := (value=xml_from_xslt_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_from_c14n_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_C14N"
 			}"
 		end

	xml_from_catalog_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_CATALOG"
 			}"
 		end

	xml_from_check_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_CHECK"
 			}"
 		end

	xml_from_datatype_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_DATATYPE"
 			}"
 		end

	xml_from_dtd_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_DTD"
 			}"
 		end

	xml_from_ftp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_FTP"
 			}"
 		end

	xml_from_html_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_HTML"
 			}"
 		end

	xml_from_http_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_HTTP"
 			}"
 		end

	xml_from_i18n_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_I18N"
 			}"
 		end

	xml_from_io_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_IO"
 			}"
 		end

	xml_from_memory_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_MEMORY"
 			}"
 		end

	xml_from_module_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_MODULE"
 			}"
 		end

	xml_from_namespace_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_NAMESPACE"
 			}"
 		end

	xml_from_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_NONE"
 			}"
 		end

	xml_from_output_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_OUTPUT"
 			}"
 		end

	xml_from_parser_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_PARSER"
 			}"
 		end

	xml_from_regexp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_REGEXP"
 			}"
 		end

	xml_from_relaxngp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_RELAXNGP"
 			}"
 		end

	xml_from_relaxngv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_RELAXNGV"
 			}"
 		end

	xml_from_schemasp_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_SCHEMASP"
 			}"
 		end

	xml_from_schemasv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_SCHEMASV"
 			}"
 		end

	xml_from_schematronv_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_SCHEMATRONV"
 			}"
 		end

	xml_from_tree_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_TREE"
 			}"
 		end

	xml_from_valid_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_VALID"
 			}"
 		end

	xml_from_writer_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_WRITER"
 			}"
 		end

	xml_from_xinclude_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XINCLUDE"
 			}"
 		end

	xml_from_xpath_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XPATH"
 			}"
 		end

	xml_from_xpointer_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XPOINTER"
 			}"
 		end

	xml_from_xslt_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XSLT"
 			}"
 		end


end -- class XML_ERROR_DOMAIN_ENUM
