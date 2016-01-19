-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_TRANSACTION_STATUS_STATE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_transaction_status_state_ok) or else 
				(a_value = gda_transaction_status_state_failed))
		end


feature {ANY} -- Setters
	default_create, set_gda_transaction_status_state_ok is
		do
			value := gda_transaction_status_state_ok
		end

	set_gda_transaction_status_state_failed is
		do
			value := gda_transaction_status_state_failed
		end


feature {ANY} -- Queries
	is_gda_transaction_status_state_ok: BOOLEAN is
		do
			Result := (value=gda_transaction_status_state_ok)
		end

	is_gda_transaction_status_state_failed: BOOLEAN is
		do
			Result := (value=gda_transaction_status_state_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_transaction_status_state_ok: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_STATUS_STATE_OK"
		end

	gda_transaction_status_state_failed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_TRANSACTION_STATUS_STATE_FAILED"
		end


end

