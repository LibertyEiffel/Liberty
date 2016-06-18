-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_TRANSACTION_STATUS_PRIVATE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_transaction_status_find_current (a_tstatus: POINTER; a_destev: POINTER; an_unnamed_only: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_transaction_status_find (a_tstatus: POINTER; a_str: POINTER; a_destev: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_transaction_status_free_events (a_tstatus: POINTER; an_event: POINTER; a_free_after: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_transaction_status_add_event_sub (a_tstatus: POINTER; a_sub_trans: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_transaction_status_add_event_sql (a_tstatus: POINTER; a_sql: POINTER; a_conn_event: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_transaction_status_add_event_svp (a_tstatus: POINTER; a_svp_name: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

end
