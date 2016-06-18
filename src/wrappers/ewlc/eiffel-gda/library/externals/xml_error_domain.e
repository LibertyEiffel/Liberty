-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ERROR_DOMAIN
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_from_none) or else 
				(a_value = xml_from_parser) or else 
				(a_value = xml_from_tree) or else 
				(a_value = xml_from_namespace) or else 
				(a_value = xml_from_dtd) or else 
				(a_value = xml_from_html) or else 
				(a_value = xml_from_memory) or else 
				(a_value = xml_from_output) or else 
				(a_value = xml_from_io) or else 
				(a_value = xml_from_ftp) or else 
				(a_value = xml_from_http) or else 
				(a_value = xml_from_xinclude) or else 
				(a_value = xml_from_xpath) or else 
				(a_value = xml_from_xpointer) or else 
				(a_value = xml_from_regexp) or else 
				(a_value = xml_from_datatype) or else 
				(a_value = xml_from_schemasp) or else 
				(a_value = xml_from_schemasv) or else 
				(a_value = xml_from_relaxngp) or else 
				(a_value = xml_from_relaxngv) or else 
				(a_value = xml_from_catalog) or else 
				(a_value = xml_from_c14n) or else 
				(a_value = xml_from_xslt) or else 
				(a_value = xml_from_valid) or else 
				(a_value = xml_from_check) or else 
				(a_value = xml_from_writer) or else 
				(a_value = xml_from_module) or else 
				(a_value = xml_from_i18n))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := xml_from_none
		end

	set_parser
		do
			value := xml_from_parser
		end

	set_tree
		do
			value := xml_from_tree
		end

	set_namespace
		do
			value := xml_from_namespace
		end

	set_dtd
		do
			value := xml_from_dtd
		end

	set_html
		do
			value := xml_from_html
		end

	set_memory
		do
			value := xml_from_memory
		end

	set_output
		do
			value := xml_from_output
		end

	set_io
		do
			value := xml_from_io
		end

	set_ftp
		do
			value := xml_from_ftp
		end

	set_http
		do
			value := xml_from_http
		end

	set_xinclude
		do
			value := xml_from_xinclude
		end

	set_xpath
		do
			value := xml_from_xpath
		end

	set_xpointer
		do
			value := xml_from_xpointer
		end

	set_regexp
		do
			value := xml_from_regexp
		end

	set_datatype
		do
			value := xml_from_datatype
		end

	set_schemasp
		do
			value := xml_from_schemasp
		end

	set_schemasv
		do
			value := xml_from_schemasv
		end

	set_relaxngp
		do
			value := xml_from_relaxngp
		end

	set_relaxngv
		do
			value := xml_from_relaxngv
		end

	set_catalog
		do
			value := xml_from_catalog
		end

	set_c14n
		do
			value := xml_from_c14n
		end

	set_xslt
		do
			value := xml_from_xslt
		end

	set_valid
		do
			value := xml_from_valid
		end

	set_check_external
		do
			value := xml_from_check
		end

	set_writer
		do
			value := xml_from_writer
		end

	set_module
		do
			value := xml_from_module
		end

	set_i18n
		do
			value := xml_from_i18n
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=xml_from_none)
		end

	is_parser: BOOLEAN
		do
			Result := (value=xml_from_parser)
		end

	is_tree: BOOLEAN
		do
			Result := (value=xml_from_tree)
		end

	is_namespace: BOOLEAN
		do
			Result := (value=xml_from_namespace)
		end

	is_dtd: BOOLEAN
		do
			Result := (value=xml_from_dtd)
		end

	is_html: BOOLEAN
		do
			Result := (value=xml_from_html)
		end

	is_memory: BOOLEAN
		do
			Result := (value=xml_from_memory)
		end

	is_output: BOOLEAN
		do
			Result := (value=xml_from_output)
		end

	is_io: BOOLEAN
		do
			Result := (value=xml_from_io)
		end

	is_ftp: BOOLEAN
		do
			Result := (value=xml_from_ftp)
		end

	is_http: BOOLEAN
		do
			Result := (value=xml_from_http)
		end

	is_xinclude: BOOLEAN
		do
			Result := (value=xml_from_xinclude)
		end

	is_xpath: BOOLEAN
		do
			Result := (value=xml_from_xpath)
		end

	is_xpointer: BOOLEAN
		do
			Result := (value=xml_from_xpointer)
		end

	is_regexp: BOOLEAN
		do
			Result := (value=xml_from_regexp)
		end

	is_datatype: BOOLEAN
		do
			Result := (value=xml_from_datatype)
		end

	is_schemasp: BOOLEAN
		do
			Result := (value=xml_from_schemasp)
		end

	is_schemasv: BOOLEAN
		do
			Result := (value=xml_from_schemasv)
		end

	is_relaxngp: BOOLEAN
		do
			Result := (value=xml_from_relaxngp)
		end

	is_relaxngv: BOOLEAN
		do
			Result := (value=xml_from_relaxngv)
		end

	is_catalog: BOOLEAN
		do
			Result := (value=xml_from_catalog)
		end

	is_c14n: BOOLEAN
		do
			Result := (value=xml_from_c14n)
		end

	is_xslt: BOOLEAN
		do
			Result := (value=xml_from_xslt)
		end

	is_valid: BOOLEAN
		do
			Result := (value=xml_from_valid)
		end

	is_check_external: BOOLEAN
		do
			Result := (value=xml_from_check)
		end

	is_writer: BOOLEAN
		do
			Result := (value=xml_from_writer)
		end

	is_module: BOOLEAN
		do
			Result := (value=xml_from_module)
		end

	is_i18n: BOOLEAN
		do
			Result := (value=xml_from_i18n)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_from_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_NONE"
		end

	xml_from_parser: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_PARSER"
		end

	xml_from_tree: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_TREE"
		end

	xml_from_namespace: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_NAMESPACE"
		end

	xml_from_dtd: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_DTD"
		end

	xml_from_html: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_HTML"
		end

	xml_from_memory: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_MEMORY"
		end

	xml_from_output: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_OUTPUT"
		end

	xml_from_io: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_IO"
		end

	xml_from_ftp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_FTP"
		end

	xml_from_http: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_HTTP"
		end

	xml_from_xinclude: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_XINCLUDE"
		end

	xml_from_xpath: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_XPATH"
		end

	xml_from_xpointer: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_XPOINTER"
		end

	xml_from_regexp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_REGEXP"
		end

	xml_from_datatype: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_DATATYPE"
		end

	xml_from_schemasp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_SCHEMASP"
		end

	xml_from_schemasv: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_SCHEMASV"
		end

	xml_from_relaxngp: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_RELAXNGP"
		end

	xml_from_relaxngv: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_RELAXNGV"
		end

	xml_from_catalog: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_CATALOG"
		end

	xml_from_c14n: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_C14N"
		end

	xml_from_xslt: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_XSLT"
		end

	xml_from_valid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_VALID"
		end

	xml_from_check: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_CHECK"
		end

	xml_from_writer: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_WRITER"
		end

	xml_from_module: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_MODULE"
		end

	xml_from_i18n: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_FROM_I18N"
		end


end

