-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_LOGIC_OPERATOR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = sql_and) or else 
				(a_value = sql_or))
		end


feature {ANY} -- Setters
	default_create, set_sql_and is
		do
			value := sql_and
		end

	set_sql_or is
		do
			value := sql_or
		end


feature {ANY} -- Queries
	is_sql_and: BOOLEAN is
		do
			Result := (value=sql_and)
		end

	is_sql_or: BOOLEAN is
		do
			Result := (value=sql_or)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_and: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_and"
		end

	sql_or: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_or"
		end


end

