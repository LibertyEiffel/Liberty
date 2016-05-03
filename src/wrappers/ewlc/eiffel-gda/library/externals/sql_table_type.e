-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_TABLE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = sql_simple) or else 
				(a_value = sql_nestedselect) or else 
				(a_value = sql_tablefunction))
		end


feature {ANY} -- Setters
	default_create, set_sql_simple is
		do
			value := sql_simple
		end

	set_sql_nestedselect is
		do
			value := sql_nestedselect
		end

	set_sql_tablefunction is
		do
			value := sql_tablefunction
		end


feature {ANY} -- Queries
	is_sql_simple: BOOLEAN is
		do
			Result := (value=sql_simple)
		end

	is_sql_nestedselect: BOOLEAN is
		do
			Result := (value=sql_nestedselect)
		end

	is_sql_tablefunction: BOOLEAN is
		do
			Result := (value=sql_tablefunction)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_simple: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_simple"
		end

	sql_nestedselect: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_nestedselect"
		end

	sql_tablefunction: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_tablefunction"
		end


end

