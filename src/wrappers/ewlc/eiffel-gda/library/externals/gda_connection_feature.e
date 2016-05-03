-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_CONNECTION_FEATURE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_connection_feature_aggregates) or else 
				(a_value = gda_connection_feature_blobs) or else 
				(a_value = gda_connection_feature_indexes) or else 
				(a_value = gda_connection_feature_inheritance) or else 
				(a_value = gda_connection_feature_namespaces) or else 
				(a_value = gda_connection_feature_procedures) or else 
				(a_value = gda_connection_feature_sequences) or else 
				(a_value = gda_connection_feature_sql) or else 
				(a_value = gda_connection_feature_transactions) or else 
				(a_value = gda_connection_feature_savepoints) or else 
				(a_value = gda_connection_feature_savepoints_remove) or else 
				(a_value = gda_connection_feature_triggers) or else 
				(a_value = gda_connection_feature_updatable_cursor) or else 
				(a_value = gda_connection_feature_users) or else 
				(a_value = gda_connection_feature_views) or else 
				(a_value = gda_connection_feature_xa_transactions) or else 
				(a_value = gda_connection_feature_last))
		end


feature {ANY} -- Setters
	default_create, set_aggregates is
		do
			value := gda_connection_feature_aggregates
		end

	set_blobs is
		do
			value := gda_connection_feature_blobs
		end

	set_indexes is
		do
			value := gda_connection_feature_indexes
		end

	set_inheritance is
		do
			value := gda_connection_feature_inheritance
		end

	set_namespaces is
		do
			value := gda_connection_feature_namespaces
		end

	set_procedures is
		do
			value := gda_connection_feature_procedures
		end

	set_sequences is
		do
			value := gda_connection_feature_sequences
		end

	set_sql is
		do
			value := gda_connection_feature_sql
		end

	set_transactions is
		do
			value := gda_connection_feature_transactions
		end

	set_savepoints is
		do
			value := gda_connection_feature_savepoints
		end

	set_savepoints_remove is
		do
			value := gda_connection_feature_savepoints_remove
		end

	set_triggers is
		do
			value := gda_connection_feature_triggers
		end

	set_updatable_cursor is
		do
			value := gda_connection_feature_updatable_cursor
		end

	set_users is
		do
			value := gda_connection_feature_users
		end

	set_views is
		do
			value := gda_connection_feature_views
		end

	set_xa_transactions is
		do
			value := gda_connection_feature_xa_transactions
		end

	set_last is
		do
			value := gda_connection_feature_last
		end


feature {ANY} -- Queries
	is_aggregates: BOOLEAN is
		do
			Result := (value=gda_connection_feature_aggregates)
		end

	is_blobs: BOOLEAN is
		do
			Result := (value=gda_connection_feature_blobs)
		end

	is_indexes: BOOLEAN is
		do
			Result := (value=gda_connection_feature_indexes)
		end

	is_inheritance: BOOLEAN is
		do
			Result := (value=gda_connection_feature_inheritance)
		end

	is_namespaces: BOOLEAN is
		do
			Result := (value=gda_connection_feature_namespaces)
		end

	is_procedures: BOOLEAN is
		do
			Result := (value=gda_connection_feature_procedures)
		end

	is_sequences: BOOLEAN is
		do
			Result := (value=gda_connection_feature_sequences)
		end

	is_sql: BOOLEAN is
		do
			Result := (value=gda_connection_feature_sql)
		end

	is_transactions: BOOLEAN is
		do
			Result := (value=gda_connection_feature_transactions)
		end

	is_savepoints: BOOLEAN is
		do
			Result := (value=gda_connection_feature_savepoints)
		end

	is_savepoints_remove: BOOLEAN is
		do
			Result := (value=gda_connection_feature_savepoints_remove)
		end

	is_triggers: BOOLEAN is
		do
			Result := (value=gda_connection_feature_triggers)
		end

	is_updatable_cursor: BOOLEAN is
		do
			Result := (value=gda_connection_feature_updatable_cursor)
		end

	is_users: BOOLEAN is
		do
			Result := (value=gda_connection_feature_users)
		end

	is_views: BOOLEAN is
		do
			Result := (value=gda_connection_feature_views)
		end

	is_xa_transactions: BOOLEAN is
		do
			Result := (value=gda_connection_feature_xa_transactions)
		end

	is_last: BOOLEAN is
		do
			Result := (value=gda_connection_feature_last)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_connection_feature_aggregates: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_AGGREGATES"
		end

	gda_connection_feature_blobs: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_BLOBS"
		end

	gda_connection_feature_indexes: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_INDEXES"
		end

	gda_connection_feature_inheritance: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_INHERITANCE"
		end

	gda_connection_feature_namespaces: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_NAMESPACES"
		end

	gda_connection_feature_procedures: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_PROCEDURES"
		end

	gda_connection_feature_sequences: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_SEQUENCES"
		end

	gda_connection_feature_sql: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_SQL"
		end

	gda_connection_feature_transactions: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_TRANSACTIONS"
		end

	gda_connection_feature_savepoints: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_SAVEPOINTS"
		end

	gda_connection_feature_savepoints_remove: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_SAVEPOINTS_REMOVE"
		end

	gda_connection_feature_triggers: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_TRIGGERS"
		end

	gda_connection_feature_updatable_cursor: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_UPDATABLE_CURSOR"
		end

	gda_connection_feature_users: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_USERS"
		end

	gda_connection_feature_views: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_VIEWS"
		end

	gda_connection_feature_xa_transactions: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_XA_TRANSACTIONS"
		end

	gda_connection_feature_last: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_CONNECTION_FEATURE_LAST"
		end


end

