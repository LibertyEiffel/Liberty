-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_PARAMETER_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_parameter_query_limit_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_parameter_query_limit_error
		do
			value := gda_parameter_query_limit_error
		end


feature {ANY} -- Queries
	is_gda_parameter_query_limit_error: BOOLEAN
		do
			Result := (value=gda_parameter_query_limit_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_parameter_query_limit_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_QUERY_LIMIT_ERROR"
		end


end

