-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CLIENT_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_client_general_error))
		end


feature {ANY} -- Setters
	default_create, set_gda_client_general_error
		do
			value := gda_client_general_error
		end


feature {ANY} -- Queries
	is_gda_client_general_error: BOOLEAN
		do
			Result := (value=gda_client_general_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_client_general_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_GENERAL_ERROR"
		end


end

