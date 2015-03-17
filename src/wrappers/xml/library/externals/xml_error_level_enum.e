-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class XML_ERROR_LEVEL_ENUM

insert ENUM

create default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = xml_err_error_low_level)  or else
				(a_value = xml_err_fatal_low_level)  or else
				(a_value = xml_err_none_low_level)  or else
				(a_value = xml_err_warning_low_level) )
		end

feature -- Setters
	default_create,
	set_xml_err_error
		do
			value := xml_err_error_low_level
		end

	set_xml_err_fatal
		do
			value := xml_err_fatal_low_level
		end

	set_xml_err_none
		do
			value := xml_err_none_low_level
		end

	set_xml_err_warning
		do
			value := xml_err_warning_low_level
		end

feature -- Queries
	is_xml_err_error: BOOLEAN
		do
			Result := (value=xml_err_error_low_level)
		end

	is_xml_err_fatal: BOOLEAN
		do
			Result := (value=xml_err_fatal_low_level)
		end

	is_xml_err_none: BOOLEAN
		do
			Result := (value=xml_err_none_low_level)
		end

	is_xml_err_warning: BOOLEAN
		do
			Result := (value=xml_err_warning_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	xml_err_error_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_ERROR"
 			}"
 		end

	xml_err_fatal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_FATAL"
 			}"
 		end

	xml_err_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_NONE"
 			}"
 		end

	xml_err_warning_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "XML_ERR_WARNING"
 			}"
 		end


end -- class XML_ERROR_LEVEL_ENUM
