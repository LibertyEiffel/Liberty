-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XMLERRORDOMAIN_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
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
	set_xml_from_c14n is
		do
			value := xml_from_c14n_low_level
		end

	set_xml_from_catalog is
		do
			value := xml_from_catalog_low_level
		end

	set_xml_from_check is
		do
			value := xml_from_check_low_level
		end

	set_xml_from_datatype is
		do
			value := xml_from_datatype_low_level
		end

	set_xml_from_dtd is
		do
			value := xml_from_dtd_low_level
		end

	set_xml_from_ftp is
		do
			value := xml_from_ftp_low_level
		end

	set_xml_from_html is
		do
			value := xml_from_html_low_level
		end

	set_xml_from_http is
		do
			value := xml_from_http_low_level
		end

	set_xml_from_i18n is
		do
			value := xml_from_i18n_low_level
		end

	set_xml_from_io is
		do
			value := xml_from_io_low_level
		end

	set_xml_from_memory is
		do
			value := xml_from_memory_low_level
		end

	set_xml_from_module is
		do
			value := xml_from_module_low_level
		end

	set_xml_from_namespace is
		do
			value := xml_from_namespace_low_level
		end

	set_xml_from_none is
		do
			value := xml_from_none_low_level
		end

	set_xml_from_output is
		do
			value := xml_from_output_low_level
		end

	set_xml_from_parser is
		do
			value := xml_from_parser_low_level
		end

	set_xml_from_regexp is
		do
			value := xml_from_regexp_low_level
		end

	set_xml_from_relaxngp is
		do
			value := xml_from_relaxngp_low_level
		end

	set_xml_from_relaxngv is
		do
			value := xml_from_relaxngv_low_level
		end

	set_xml_from_schemasp is
		do
			value := xml_from_schemasp_low_level
		end

	set_xml_from_schemasv is
		do
			value := xml_from_schemasv_low_level
		end

	set_xml_from_schematronv is
		do
			value := xml_from_schematronv_low_level
		end

	set_xml_from_tree is
		do
			value := xml_from_tree_low_level
		end

	set_xml_from_valid is
		do
			value := xml_from_valid_low_level
		end

	set_xml_from_writer is
		do
			value := xml_from_writer_low_level
		end

	set_xml_from_xinclude is
		do
			value := xml_from_xinclude_low_level
		end

	set_xml_from_xpath is
		do
			value := xml_from_xpath_low_level
		end

	set_xml_from_xpointer is
		do
			value := xml_from_xpointer_low_level
		end

	set_xml_from_xslt is
		do
			value := xml_from_xslt_low_level
		end

feature -- Queries
	is_xml_from_c14n: BOOLEAN is
		do
			Result := (value=xml_from_c14n_low_level)
		end

	is_xml_from_catalog: BOOLEAN is
		do
			Result := (value=xml_from_catalog_low_level)
		end

	is_xml_from_check: BOOLEAN is
		do
			Result := (value=xml_from_check_low_level)
		end

	is_xml_from_datatype: BOOLEAN is
		do
			Result := (value=xml_from_datatype_low_level)
		end

	is_xml_from_dtd: BOOLEAN is
		do
			Result := (value=xml_from_dtd_low_level)
		end

	is_xml_from_ftp: BOOLEAN is
		do
			Result := (value=xml_from_ftp_low_level)
		end

	is_xml_from_html: BOOLEAN is
		do
			Result := (value=xml_from_html_low_level)
		end

	is_xml_from_http: BOOLEAN is
		do
			Result := (value=xml_from_http_low_level)
		end

	is_xml_from_i18n: BOOLEAN is
		do
			Result := (value=xml_from_i18n_low_level)
		end

	is_xml_from_io: BOOLEAN is
		do
			Result := (value=xml_from_io_low_level)
		end

	is_xml_from_memory: BOOLEAN is
		do
			Result := (value=xml_from_memory_low_level)
		end

	is_xml_from_module: BOOLEAN is
		do
			Result := (value=xml_from_module_low_level)
		end

	is_xml_from_namespace: BOOLEAN is
		do
			Result := (value=xml_from_namespace_low_level)
		end

	is_xml_from_none: BOOLEAN is
		do
			Result := (value=xml_from_none_low_level)
		end

	is_xml_from_output: BOOLEAN is
		do
			Result := (value=xml_from_output_low_level)
		end

	is_xml_from_parser: BOOLEAN is
		do
			Result := (value=xml_from_parser_low_level)
		end

	is_xml_from_regexp: BOOLEAN is
		do
			Result := (value=xml_from_regexp_low_level)
		end

	is_xml_from_relaxngp: BOOLEAN is
		do
			Result := (value=xml_from_relaxngp_low_level)
		end

	is_xml_from_relaxngv: BOOLEAN is
		do
			Result := (value=xml_from_relaxngv_low_level)
		end

	is_xml_from_schemasp: BOOLEAN is
		do
			Result := (value=xml_from_schemasp_low_level)
		end

	is_xml_from_schemasv: BOOLEAN is
		do
			Result := (value=xml_from_schemasv_low_level)
		end

	is_xml_from_schematronv: BOOLEAN is
		do
			Result := (value=xml_from_schematronv_low_level)
		end

	is_xml_from_tree: BOOLEAN is
		do
			Result := (value=xml_from_tree_low_level)
		end

	is_xml_from_valid: BOOLEAN is
		do
			Result := (value=xml_from_valid_low_level)
		end

	is_xml_from_writer: BOOLEAN is
		do
			Result := (value=xml_from_writer_low_level)
		end

	is_xml_from_xinclude: BOOLEAN is
		do
			Result := (value=xml_from_xinclude_low_level)
		end

	is_xml_from_xpath: BOOLEAN is
		do
			Result := (value=xml_from_xpath_low_level)
		end

	is_xml_from_xpointer: BOOLEAN is
		do
			Result := (value=xml_from_xpointer_low_level)
		end

	is_xml_from_xslt: BOOLEAN is
		do
			Result := (value=xml_from_xslt_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_from_c14n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_C14N"
 			}"
 		end

	xml_from_catalog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_CATALOG"
 			}"
 		end

	xml_from_check_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_CHECK"
 			}"
 		end

	xml_from_datatype_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_DATATYPE"
 			}"
 		end

	xml_from_dtd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_DTD"
 			}"
 		end

	xml_from_ftp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_FTP"
 			}"
 		end

	xml_from_html_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_HTML"
 			}"
 		end

	xml_from_http_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_HTTP"
 			}"
 		end

	xml_from_i18n_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_I18N"
 			}"
 		end

	xml_from_io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_IO"
 			}"
 		end

	xml_from_memory_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_MEMORY"
 			}"
 		end

	xml_from_module_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_MODULE"
 			}"
 		end

	xml_from_namespace_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_NAMESPACE"
 			}"
 		end

	xml_from_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_NONE"
 			}"
 		end

	xml_from_output_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_OUTPUT"
 			}"
 		end

	xml_from_parser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_PARSER"
 			}"
 		end

	xml_from_regexp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_REGEXP"
 			}"
 		end

	xml_from_relaxngp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_RELAXNGP"
 			}"
 		end

	xml_from_relaxngv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_RELAXNGV"
 			}"
 		end

	xml_from_schemasp_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_SCHEMASP"
 			}"
 		end

	xml_from_schemasv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_SCHEMASV"
 			}"
 		end

	xml_from_schematronv_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_SCHEMATRONV"
 			}"
 		end

	xml_from_tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_TREE"
 			}"
 		end

	xml_from_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_VALID"
 			}"
 		end

	xml_from_writer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_WRITER"
 			}"
 		end

	xml_from_xinclude_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XINCLUDE"
 			}"
 		end

	xml_from_xpath_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XPATH"
 			}"
 		end

	xml_from_xpointer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XPOINTER"
 			}"
 		end

	xml_from_xslt_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_FROM_XSLT"
 			}"
 		end


end -- class XMLERRORDOMAIN_ENUM
