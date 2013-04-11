-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_SQL_STATEMENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
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
	default_create, set_select_external is
		do
			value := gda_sql_statement_select
		end

	set_insert_external is
		do
			value := gda_sql_statement_insert
		end

	set_update is
		do
			value := gda_sql_statement_update
		end

	set_delete is
		do
			value := gda_sql_statement_delete
		end

	set_compound is
		do
			value := gda_sql_statement_compound
		end

	set_begin is
		do
			value := gda_sql_statement_begin
		end

	set_rollback is
		do
			value := gda_sql_statement_rollback
		end

	set_commit is
		do
			value := gda_sql_statement_commit
		end

	set_savepoint is
		do
			value := gda_sql_statement_savepoint
		end

	set_rollback_savepoint is
		do
			value := gda_sql_statement_rollback_savepoint
		end

	set_delete_savepoint is
		do
			value := gda_sql_statement_delete_savepoint
		end

	set_unknown is
		do
			value := gda_sql_statement_unknown
		end

	set_none is
		do
			value := gda_sql_statement_none
		end


feature {ANY} -- Queries
	is_select_external: BOOLEAN is
		do
			Result := (value=gda_sql_statement_select)
		end

	is_insert_external: BOOLEAN is
		do
			Result := (value=gda_sql_statement_insert)
		end

	is_update: BOOLEAN is
		do
			Result := (value=gda_sql_statement_update)
		end

	is_delete: BOOLEAN is
		do
			Result := (value=gda_sql_statement_delete)
		end

	is_compound: BOOLEAN is
		do
			Result := (value=gda_sql_statement_compound)
		end

	is_begin: BOOLEAN is
		do
			Result := (value=gda_sql_statement_begin)
		end

	is_rollback: BOOLEAN is
		do
			Result := (value=gda_sql_statement_rollback)
		end

	is_commit: BOOLEAN is
		do
			Result := (value=gda_sql_statement_commit)
		end

	is_savepoint: BOOLEAN is
		do
			Result := (value=gda_sql_statement_savepoint)
		end

	is_rollback_savepoint: BOOLEAN is
		do
			Result := (value=gda_sql_statement_rollback_savepoint)
		end

	is_delete_savepoint: BOOLEAN is
		do
			Result := (value=gda_sql_statement_delete_savepoint)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=gda_sql_statement_unknown)
		end

	is_none: BOOLEAN is
		do
			Result := (value=gda_sql_statement_none)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_sql_statement_select: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_SELECT"
		end

	gda_sql_statement_insert: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_INSERT"
		end

	gda_sql_statement_update: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_UPDATE"
		end

	gda_sql_statement_delete: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_DELETE"
		end

	gda_sql_statement_compound: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_COMPOUND"
		end

	gda_sql_statement_begin: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_BEGIN"
		end

	gda_sql_statement_rollback: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_ROLLBACK"
		end

	gda_sql_statement_commit: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_COMMIT"
		end

	gda_sql_statement_savepoint: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_SAVEPOINT"
		end

	gda_sql_statement_rollback_savepoint: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_ROLLBACK_SAVEPOINT"
		end

	gda_sql_statement_delete_savepoint: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_DELETE_SAVEPOINT"
		end

	gda_sql_statement_unknown: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_UNKNOWN"
		end

	gda_sql_statement_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_SQL_STATEMENT_NONE"
		end


end

