-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_DELIMITER_STATEMENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
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
	default_create, set_sql_select
		do
			value := gda_delimiter_sql_select
		end

	set_sql_insert
		do
			value := gda_delimiter_sql_insert
		end

	set_sql_delete
		do
			value := gda_delimiter_sql_delete
		end

	set_sql_update
		do
			value := gda_delimiter_sql_update
		end

	set_sql_begin
		do
			value := gda_delimiter_sql_begin
		end

	set_sql_commit
		do
			value := gda_delimiter_sql_commit
		end

	set_multiple
		do
			value := gda_delimiter_multiple
		end

	set_unknown
		do
			value := gda_delimiter_unknown
		end


feature {ANY} -- Queries
	is_sql_select: BOOLEAN
		do
			Result := (value=gda_delimiter_sql_select)
		end

	is_sql_insert: BOOLEAN
		do
			Result := (value=gda_delimiter_sql_insert)
		end

	is_sql_delete: BOOLEAN
		do
			Result := (value=gda_delimiter_sql_delete)
		end

	is_sql_update: BOOLEAN
		do
			Result := (value=gda_delimiter_sql_update)
		end

	is_sql_begin: BOOLEAN
		do
			Result := (value=gda_delimiter_sql_begin)
		end

	is_sql_commit: BOOLEAN
		do
			Result := (value=gda_delimiter_sql_commit)
		end

	is_multiple: BOOLEAN
		do
			Result := (value=gda_delimiter_multiple)
		end

	is_unknown: BOOLEAN
		do
			Result := (value=gda_delimiter_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_delimiter_sql_select: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_SELECT"
		end

	gda_delimiter_sql_insert: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_INSERT"
		end

	gda_delimiter_sql_delete: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_DELETE"
		end

	gda_delimiter_sql_update: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_UPDATE"
		end

	gda_delimiter_sql_begin: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_BEGIN"
		end

	gda_delimiter_sql_commit: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_SQL_COMMIT"
		end

	gda_delimiter_multiple: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_MULTIPLE"
		end

	gda_delimiter_unknown: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_DELIMITER_UNKNOWN"
		end


end

