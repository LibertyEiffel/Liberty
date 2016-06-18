-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_SQL_STATEMENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_sql_statement_select) or else 
				(a_value = gda_sql_statement_insert) or else 
				(a_value = gda_sql_statement_update) or else 
				(a_value = gda_sql_statement_delete) or else 
				(a_value = gda_sql_statement_compound) or else 
				(a_value = gda_sql_statement_begin) or else 
				(a_value = gda_sql_statement_rollback) or else 
				(a_value = gda_sql_statement_commit) or else 
				(a_value = gda_sql_statement_savepoint) or else 
				(a_value = gda_sql_statement_rollback_savepoint) or else 
				(a_value = gda_sql_statement_delete_savepoint) or else 
				(a_value = gda_sql_statement_unknown) or else 
				(a_value = gda_sql_statement_none))
		end


feature {ANY} -- Setters
	default_create, set_select_external
		do
			value := gda_sql_statement_select
		end

	set_insert_external
		do
			value := gda_sql_statement_insert
		end

	set_update
		do
			value := gda_sql_statement_update
		end

	set_delete
		do
			value := gda_sql_statement_delete
		end

	set_compound
		do
			value := gda_sql_statement_compound
		end

	set_begin
		do
			value := gda_sql_statement_begin
		end

	set_rollback
		do
			value := gda_sql_statement_rollback
		end

	set_commit
		do
			value := gda_sql_statement_commit
		end

	set_savepoint
		do
			value := gda_sql_statement_savepoint
		end

	set_rollback_savepoint
		do
			value := gda_sql_statement_rollback_savepoint
		end

	set_delete_savepoint
		do
			value := gda_sql_statement_delete_savepoint
		end

	set_unknown
		do
			value := gda_sql_statement_unknown
		end

	set_none
		do
			value := gda_sql_statement_none
		end


feature {ANY} -- Queries
	is_select_external: BOOLEAN
		do
			Result := (value=gda_sql_statement_select)
		end

	is_insert_external: BOOLEAN
		do
			Result := (value=gda_sql_statement_insert)
		end

	is_update: BOOLEAN
		do
			Result := (value=gda_sql_statement_update)
		end

	is_delete: BOOLEAN
		do
			Result := (value=gda_sql_statement_delete)
		end

	is_compound: BOOLEAN
		do
			Result := (value=gda_sql_statement_compound)
		end

	is_begin: BOOLEAN
		do
			Result := (value=gda_sql_statement_begin)
		end

	is_rollback: BOOLEAN
		do
			Result := (value=gda_sql_statement_rollback)
		end

	is_commit: BOOLEAN
		do
			Result := (value=gda_sql_statement_commit)
		end

	is_savepoint: BOOLEAN
		do
			Result := (value=gda_sql_statement_savepoint)
		end

	is_rollback_savepoint: BOOLEAN
		do
			Result := (value=gda_sql_statement_rollback_savepoint)
		end

	is_delete_savepoint: BOOLEAN
		do
			Result := (value=gda_sql_statement_delete_savepoint)
		end

	is_unknown: BOOLEAN
		do
			Result := (value=gda_sql_statement_unknown)
		end

	is_none: BOOLEAN
		do
			Result := (value=gda_sql_statement_none)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_sql_statement_select: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_SELECT"
		end

	gda_sql_statement_insert: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_INSERT"
		end

	gda_sql_statement_update: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_UPDATE"
		end

	gda_sql_statement_delete: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_DELETE"
		end

	gda_sql_statement_compound: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_COMPOUND"
		end

	gda_sql_statement_begin: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_BEGIN"
		end

	gda_sql_statement_rollback: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_ROLLBACK"
		end

	gda_sql_statement_commit: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_COMMIT"
		end

	gda_sql_statement_savepoint: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_SAVEPOINT"
		end

	gda_sql_statement_rollback_savepoint: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_ROLLBACK_SAVEPOINT"
		end

	gda_sql_statement_delete_savepoint: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_DELETE_SAVEPOINT"
		end

	gda_sql_statement_unknown: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_UNKNOWN"
		end

	gda_sql_statement_none: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_NONE"
		end


end

