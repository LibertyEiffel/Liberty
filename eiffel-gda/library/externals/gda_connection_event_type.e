-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_EVENT_TYPE
insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_connection_event_notice) or else 
				(a_value = gda_connection_event_warning) or else 
				(a_value = gda_connection_event_error))
		end


feature -- Setters
	default_create, set_gda_connection_event_notice is
		do
			value := gda_connection_event_notice
		end

	set_gda_connection_event_warning is
		do
			value := gda_connection_event_warning
		end

	set_gda_connection_event_error is
		do
			value := gda_connection_event_error
		end


feature -- Queries
	is_gda_connection_event_notice: BOOLEAN is
		do
			Result := (value=gda_connection_event_notice)
		end

	is_gda_connection_event_warning: BOOLEAN is
		do
			Result := (value=gda_connection_event_warning)
		end

	is_gda_connection_event_error: BOOLEAN is
		do
			Result := (value=gda_connection_event_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_event_notice: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_NOTICE"
		end

	gda_connection_event_warning: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_WARNING"
		end

	gda_connection_event_error: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CONNECTION_EVENT_ERROR"
		end


end

