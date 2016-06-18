-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_TRANSACTION_STATUS_EVENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_transaction_status_event_savepoint) or else 
				(a_value = gda_transaction_status_event_sql) or else 
				(a_value = gda_transaction_status_event_sub_transaction))
		end


feature {ANY} -- Setters
	default_create, set_gda_transaction_status_event_savepoint
		do
			value := gda_transaction_status_event_savepoint
		end

	set_gda_transaction_status_event_sql
		do
			value := gda_transaction_status_event_sql
		end

	set_gda_transaction_status_event_sub_transaction
		do
			value := gda_transaction_status_event_sub_transaction
		end


feature {ANY} -- Queries
	is_gda_transaction_status_event_savepoint: BOOLEAN
		do
			Result := (value=gda_transaction_status_event_savepoint)
		end

	is_gda_transaction_status_event_sql: BOOLEAN
		do
			Result := (value=gda_transaction_status_event_sql)
		end

	is_gda_transaction_status_event_sub_transaction: BOOLEAN
		do
			Result := (value=gda_transaction_status_event_sub_transaction)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_transaction_status_event_savepoint: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_STATUS_EVENT_SAVEPOINT"
		end

	gda_transaction_status_event_sql: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_STATUS_EVENT_SQL"
		end

	gda_transaction_status_event_sub_transaction: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_STATUS_EVENT_SUB_TRANSACTION"
		end


end

