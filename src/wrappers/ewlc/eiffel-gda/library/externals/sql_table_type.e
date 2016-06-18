-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_TABLE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_simple) or else 
				(a_value = sql_nestedselect) or else 
				(a_value = sql_tablefunction))
		end


feature {ANY} -- Setters
	default_create, set_sql_simple
		do
			value := sql_simple
		end

	set_sql_nestedselect
		do
			value := sql_nestedselect
		end

	set_sql_tablefunction
		do
			value := sql_tablefunction
		end


feature {ANY} -- Queries
	is_sql_simple: BOOLEAN
		do
			Result := (value=sql_simple)
		end

	is_sql_nestedselect: BOOLEAN
		do
			Result := (value=sql_nestedselect)
		end

	is_sql_tablefunction: BOOLEAN
		do
			Result := (value=sql_tablefunction)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_simple: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_simple"
		end

	sql_nestedselect: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_nestedselect"
		end

	sql_tablefunction: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_tablefunction"
		end


end

