-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_STATEMENT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_select) or else 
				(a_value = sql_insert) or else 
				(a_value = sql_delete) or else 
				(a_value = sql_update))
		end


feature {ANY} -- Setters
	default_create, set_select_external
		do
			value := sql_select
		end

	set_insert_external
		do
			value := sql_insert
		end

	set_delete
		do
			value := sql_delete
		end

	set_update
		do
			value := sql_update
		end


feature {ANY} -- Queries
	is_select_external: BOOLEAN
		do
			Result := (value=sql_select)
		end

	is_insert_external: BOOLEAN
		do
			Result := (value=sql_insert)
		end

	is_delete: BOOLEAN
		do
			Result := (value=sql_delete)
		end

	is_update: BOOLEAN
		do
			Result := (value=sql_update)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_select: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_select"
		end

	sql_insert: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_insert"
		end

	sql_delete: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_delete"
		end

	sql_update: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_update"
		end


end

