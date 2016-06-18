-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_LOGIC_OPERATOR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_and) or else 
				(a_value = sql_or))
		end


feature {ANY} -- Setters
	default_create, set_sql_and
		do
			value := sql_and
		end

	set_sql_or
		do
			value := sql_or
		end


feature {ANY} -- Queries
	is_sql_and: BOOLEAN
		do
			Result := (value=sql_and)
		end

	is_sql_or: BOOLEAN
		do
			Result := (value=sql_or)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_and: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_and"
		end

	sql_or: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_or"
		end


end

