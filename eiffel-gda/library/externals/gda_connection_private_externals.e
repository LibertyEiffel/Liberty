-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONNECTION_PRIVATE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_connection_internal_treat_sql (a_cnc: POINTER; a_sql: POINTER; an_error: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_change_transaction_state (a_cnc: POINTER; a_newstate: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_savepoint_removed (a_cnc: POINTER; a_svp_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_savepoint_rolledback (a_cnc: POINTER; a_svp_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_savepoint_added (a_cnc: POINTER; a_parent_trans: POINTER; a_svp_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_sql_executed (a_cnc: POINTER; a_sql: POINTER; an_error: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_transaction_committed (a_cnc: POINTER; a_trans_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_transaction_rolledback (a_cnc: POINTER; a_trans_name: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_connection_internal_transaction_started (a_cnc: POINTER; a_parent_trans: POINTER; a_trans_name: POINTER; an_isol_level: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

end
