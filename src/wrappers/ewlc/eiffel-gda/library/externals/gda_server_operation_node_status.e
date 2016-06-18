-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_SERVER_OPERATION_NODE_STATUS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_server_operation_status_optional) or else 
				(a_value = gda_server_operation_status_required) or else 
				(a_value = gda_server_operation_status_unknown))
		end


feature {ANY} -- Setters
	default_create, set_gda_server_operation_status_optional
		do
			value := gda_server_operation_status_optional
		end

	set_gda_server_operation_status_required
		do
			value := gda_server_operation_status_required
		end

	set_gda_server_operation_status_unknown
		do
			value := gda_server_operation_status_unknown
		end


feature {ANY} -- Queries
	is_gda_server_operation_status_optional: BOOLEAN
		do
			Result := (value=gda_server_operation_status_optional)
		end

	is_gda_server_operation_status_required: BOOLEAN
		do
			Result := (value=gda_server_operation_status_required)
		end

	is_gda_server_operation_status_unknown: BOOLEAN
		do
			Result := (value=gda_server_operation_status_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_server_operation_status_optional: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_STATUS_OPTIONAL"
		end

	gda_server_operation_status_required: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_STATUS_REQUIRED"
		end

	gda_server_operation_status_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SERVER_OPERATION_STATUS_UNKNOWN"
		end


end

