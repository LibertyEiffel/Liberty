-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_FIELD_OPERATOR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_plus) or else 
				(a_value = sql_minus) or else 
				(a_value = sql_times) or else 
				(a_value = sql_div))
		end


feature {ANY} -- Setters
	default_create, set_plus
		do
			value := sql_plus
		end

	set_minus
		do
			value := sql_minus
		end

	set_times
		do
			value := sql_times
		end

	set_div
		do
			value := sql_div
		end


feature {ANY} -- Queries
	is_plus: BOOLEAN
		do
			Result := (value=sql_plus)
		end

	is_minus: BOOLEAN
		do
			Result := (value=sql_minus)
		end

	is_times: BOOLEAN
		do
			Result := (value=sql_times)
		end

	is_div: BOOLEAN
		do
			Result := (value=sql_div)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_plus: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_plus"
		end

	sql_minus: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_minus"
		end

	sql_times: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_times"
		end

	sql_div: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_div"
		end


end

