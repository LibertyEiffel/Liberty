-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_CONNECTION_PRIVATE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_connection_get_prepared_statement (a_cnc: POINTER; a_gda_stmt: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_del_prepared_statement (a_cnc: POINTER; a_gda_stmt: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_add_prepared_statement (a_cnc: POINTER; a_gda_stmt: POINTER; a_prepared_stmt: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_change_transaction_state (a_cnc: POINTER; a_newstate: INTEGER_32) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_savepoint_removed (a_cnc: POINTER; a_svp_name: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_savepoint_rolledback (a_cnc: POINTER; a_svp_name: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_savepoint_added (a_cnc: POINTER; a_parent_trans: POINTER; a_svp_name: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_statement_executed (a_cnc: POINTER; a_stmt: POINTER; a_params: POINTER; an_error: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_transaction_committed (a_cnc: POINTER; a_trans_name: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_transaction_rolledback (a_cnc: POINTER; a_trans_name: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_transaction_started (a_cnc: POINTER; a_parent_trans: POINTER; a_trans_name: POINTER; an_isol_level: INTEGER_32) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_get_provider_data (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_internal_set_provider_data (a_cnc: POINTER; a_data: POINTER; a_destroy_func: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_connection_get_meta_store (a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
