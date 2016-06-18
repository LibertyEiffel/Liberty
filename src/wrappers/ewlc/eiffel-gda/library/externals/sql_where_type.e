-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_WHERE_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_single) or else 
				(a_value = sql_negated) or else 
				(a_value = sql_pair))
		end


feature {ANY} -- Setters
	default_create, set_sql_single
		do
			value := sql_single
		end

	set_sql_negated
		do
			value := sql_negated
		end

	set_sql_pair
		do
			value := sql_pair
		end


feature {ANY} -- Queries
	is_sql_single: BOOLEAN
		do
			Result := (value=sql_single)
		end

	is_sql_negated: BOOLEAN
		do
			Result := (value=sql_negated)
		end

	is_sql_pair: BOOLEAN
		do
			Result := (value=sql_pair)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_single: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_single"
		end

	sql_negated: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_negated"
		end

	sql_pair: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_pair"
		end


end

