-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ERROR_LEVEL
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = xml_err_none) or else 
				(a_value = xml_err_warning) or else 
				(a_value = xml_err_error) or else 
				(a_value = xml_err_fatal))
		end


feature {ANY} -- Setters
	default_create, set_none
		do
			value := xml_err_none
		end

	set_warning
		do
			value := xml_err_warning
		end

	set_error
		do
			value := xml_err_error
		end

	set_fatal
		do
			value := xml_err_fatal
		end


feature {ANY} -- Queries
	is_none: BOOLEAN
		do
			Result := (value=xml_err_none)
		end

	is_warning: BOOLEAN
		do
			Result := (value=xml_err_warning)
		end

	is_error: BOOLEAN
		do
			Result := (value=xml_err_error)
		end

	is_fatal: BOOLEAN
		do
			Result := (value=xml_err_fatal)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_err_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_NONE"
		end

	xml_err_warning: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_WARNING"
		end

	xml_err_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_ERROR"
		end

	xml_err_fatal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "XML_ERR_FATAL"
		end


end

