-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CLIENT_EVENT
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_client_event_invalid) or else 
				(a_value = gda_client_event_error) or else 
				(a_value = gda_client_event_connection_opened) or else 
				(a_value = gda_client_event_connection_closed) or else 
				(a_value = gda_client_event_transaction_started) or else 
				(a_value = gda_client_event_transaction_committed) or else 
				(a_value = gda_client_event_transaction_cancelled))
		end


feature {ANY} -- Setters
	default_create, set_invalid
		do
			value := gda_client_event_invalid
		end

	set_error
		do
			value := gda_client_event_error
		end

	set_connection_opened
		do
			value := gda_client_event_connection_opened
		end

	set_connection_closed
		do
			value := gda_client_event_connection_closed
		end

	set_transaction_started
		do
			value := gda_client_event_transaction_started
		end

	set_transaction_committed
		do
			value := gda_client_event_transaction_committed
		end

	set_transaction_cancelled
		do
			value := gda_client_event_transaction_cancelled
		end


feature {ANY} -- Queries
	is_invalid: BOOLEAN
		do
			Result := (value=gda_client_event_invalid)
		end

	is_error: BOOLEAN
		do
			Result := (value=gda_client_event_error)
		end

	is_connection_opened: BOOLEAN
		do
			Result := (value=gda_client_event_connection_opened)
		end

	is_connection_closed: BOOLEAN
		do
			Result := (value=gda_client_event_connection_closed)
		end

	is_transaction_started: BOOLEAN
		do
			Result := (value=gda_client_event_transaction_started)
		end

	is_transaction_committed: BOOLEAN
		do
			Result := (value=gda_client_event_transaction_committed)
		end

	is_transaction_cancelled: BOOLEAN
		do
			Result := (value=gda_client_event_transaction_cancelled)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_client_event_invalid: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_INVALID"
		end

	gda_client_event_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_ERROR"
		end

	gda_client_event_connection_opened: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_CONNECTION_OPENED"
		end

	gda_client_event_connection_closed: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_CONNECTION_CLOSED"
		end

	gda_client_event_transaction_started: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_TRANSACTION_STARTED"
		end

	gda_client_event_transaction_committed: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_TRANSACTION_COMMITTED"
		end

	gda_client_event_transaction_cancelled: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_CLIENT_EVENT_TRANSACTION_CANCELLED"
		end


end

