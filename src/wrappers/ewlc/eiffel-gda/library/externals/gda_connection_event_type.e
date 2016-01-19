-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_EVENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_connection_event_notice) or else 
				(a_value = gda_connection_event_warning) or else 
				(a_value = gda_connection_event_error) or else 
				(a_value = gda_connection_event_command))
		end


feature {ANY} -- Setters
	default_create, set_notice is
		do
			value := gda_connection_event_notice
		end

	set_warning is
		do
			value := gda_connection_event_warning
		end

	set_error is
		do
			value := gda_connection_event_error
		end

	set_command is
		do
			value := gda_connection_event_command
		end


feature {ANY} -- Queries
	is_notice: BOOLEAN is
		do
			Result := (value=gda_connection_event_notice)
		end

	is_warning: BOOLEAN is
		do
			Result := (value=gda_connection_event_warning)
		end

	is_error: BOOLEAN is
		do
			Result := (value=gda_connection_event_error)
		end

	is_command: BOOLEAN is
		do
			Result := (value=gda_connection_event_command)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_event_notice: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_NOTICE"
		end

	gda_connection_event_warning: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_WARNING"
		end

	gda_connection_event_error: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_ERROR"
		end

	gda_connection_event_command: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_EVENT_COMMAND"
		end


end

