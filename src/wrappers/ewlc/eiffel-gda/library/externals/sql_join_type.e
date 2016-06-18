-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_JOIN_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_cross_join) or else 
				(a_value = sql_inner_join) or else 
				(a_value = sql_left_join) or else 
				(a_value = sql_right_join) or else 
				(a_value = sql_full_join))
		end


feature {ANY} -- Setters
	default_create, set_cross_join
		do
			value := sql_cross_join
		end

	set_inner_join
		do
			value := sql_inner_join
		end

	set_left_join
		do
			value := sql_left_join
		end

	set_right_join
		do
			value := sql_right_join
		end

	set_full_join
		do
			value := sql_full_join
		end


feature {ANY} -- Queries
	is_cross_join: BOOLEAN
		do
			Result := (value=sql_cross_join)
		end

	is_inner_join: BOOLEAN
		do
			Result := (value=sql_inner_join)
		end

	is_left_join: BOOLEAN
		do
			Result := (value=sql_left_join)
		end

	is_right_join: BOOLEAN
		do
			Result := (value=sql_right_join)
		end

	is_full_join: BOOLEAN
		do
			Result := (value=sql_full_join)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_cross_join: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_cross_join"
		end

	sql_inner_join: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_inner_join"
		end

	sql_left_join: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_left_join"
		end

	sql_right_join: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_right_join"
		end

	sql_full_join: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_full_join"
		end


end

