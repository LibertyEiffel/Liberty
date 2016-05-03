-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DELIMITER_STATEMENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_delimiter_sql_select) or else 
				(a_value = gda_delimiter_sql_insert) or else 
				(a_value = gda_delimiter_sql_delete) or else 
				(a_value = gda_delimiter_sql_update) or else 
				(a_value = gda_delimiter_sql_begin) or else 
				(a_value = gda_delimiter_sql_commit) or else 
				(a_value = gda_delimiter_multiple) or else 
				(a_value = gda_delimiter_unknown))
		end


feature {ANY} -- Setters
	default_create, set_sql_select is
		do
			value := gda_delimiter_sql_select
		end

	set_sql_insert is
		do
			value := gda_delimiter_sql_insert
		end

	set_sql_delete is
		do
			value := gda_delimiter_sql_delete
		end

	set_sql_update is
		do
			value := gda_delimiter_sql_update
		end

	set_sql_begin is
		do
			value := gda_delimiter_sql_begin
		end

	set_sql_commit is
		do
			value := gda_delimiter_sql_commit
		end

	set_multiple is
		do
			value := gda_delimiter_multiple
		end

	set_unknown is
		do
			value := gda_delimiter_unknown
		end


feature {ANY} -- Queries
	is_sql_select: BOOLEAN is
		do
			Result := (value=gda_delimiter_sql_select)
		end

	is_sql_insert: BOOLEAN is
		do
			Result := (value=gda_delimiter_sql_insert)
		end

	is_sql_delete: BOOLEAN is
		do
			Result := (value=gda_delimiter_sql_delete)
		end

	is_sql_update: BOOLEAN is
		do
			Result := (value=gda_delimiter_sql_update)
		end

	is_sql_begin: BOOLEAN is
		do
			Result := (value=gda_delimiter_sql_begin)
		end

	is_sql_commit: BOOLEAN is
		do
			Result := (value=gda_delimiter_sql_commit)
		end

	is_multiple: BOOLEAN is
		do
			Result := (value=gda_delimiter_multiple)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=gda_delimiter_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_delimiter_sql_select: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_SELECT"
		end

	gda_delimiter_sql_insert: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_INSERT"
		end

	gda_delimiter_sql_delete: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_DELETE"
		end

	gda_delimiter_sql_update: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_UPDATE"
		end

	gda_delimiter_sql_begin: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_BEGIN"
		end

	gda_delimiter_sql_commit: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_COMMIT"
		end

	gda_delimiter_multiple: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_MULTIPLE"
		end

	gda_delimiter_unknown: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_UNKNOWN"
		end


end

