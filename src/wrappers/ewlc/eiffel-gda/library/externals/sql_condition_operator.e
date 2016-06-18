-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_CONDITION_OPERATOR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = sql_eq) or else 
				(a_value = sql_is) or else 
				(a_value = sql_in) or else 
				(a_value = sql_like) or else 
				(a_value = sql_between) or else 
				(a_value = sql_gt) or else 
				(a_value = sql_lt) or else 
				(a_value = sql_geq) or else 
				(a_value = sql_leq) or else 
				(a_value = sql_diff) or else 
				(a_value = sql_regexp) or else 
				(a_value = sql_regexp_ci) or else 
				(a_value = sql_not_regexp) or else 
				(a_value = sql_not_regexp_ci) or else 
				(a_value = sql_similar) or else 
				(a_value = sql_not))
		end


feature {ANY} -- Setters
	default_create, set_eq
		do
			value := sql_eq
		end

	set_is
		do
			value := sql_is
		end

	set_in
		do
			value := sql_in
		end

	set_like
		do
			value := sql_like
		end

	set_between
		do
			value := sql_between
		end

	set_gt
		do
			value := sql_gt
		end

	set_lt
		do
			value := sql_lt
		end

	set_geq
		do
			value := sql_geq
		end

	set_leq
		do
			value := sql_leq
		end

	set_diff
		do
			value := sql_diff
		end

	set_regexp
		do
			value := sql_regexp
		end

	set_regexp_ci
		do
			value := sql_regexp_ci
		end

	set_not_regexp
		do
			value := sql_not_regexp
		end

	set_not_regexp_ci
		do
			value := sql_not_regexp_ci
		end

	set_similar
		do
			value := sql_similar
		end

	set_not
		do
			value := sql_not
		end


feature {ANY} -- Queries
	is_eq: BOOLEAN
		do
			Result := (value=sql_eq)
		end

	is_is: BOOLEAN
		do
			Result := (value=sql_is)
		end

	is_in: BOOLEAN
		do
			Result := (value=sql_in)
		end

	is_like: BOOLEAN
		do
			Result := (value=sql_like)
		end

	is_between: BOOLEAN
		do
			Result := (value=sql_between)
		end

	is_gt: BOOLEAN
		do
			Result := (value=sql_gt)
		end

	is_lt: BOOLEAN
		do
			Result := (value=sql_lt)
		end

	is_geq: BOOLEAN
		do
			Result := (value=sql_geq)
		end

	is_leq: BOOLEAN
		do
			Result := (value=sql_leq)
		end

	is_diff: BOOLEAN
		do
			Result := (value=sql_diff)
		end

	is_regexp: BOOLEAN
		do
			Result := (value=sql_regexp)
		end

	is_regexp_ci: BOOLEAN
		do
			Result := (value=sql_regexp_ci)
		end

	is_not_regexp: BOOLEAN
		do
			Result := (value=sql_not_regexp)
		end

	is_not_regexp_ci: BOOLEAN
		do
			Result := (value=sql_not_regexp_ci)
		end

	is_similar: BOOLEAN
		do
			Result := (value=sql_similar)
		end

	is_not: BOOLEAN
		do
			Result := (value=sql_not)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_eq: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_eq"
		end

	sql_is: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_is"
		end

	sql_in: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_in"
		end

	sql_like: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_like"
		end

	sql_between: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_between"
		end

	sql_gt: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_gt"
		end

	sql_lt: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_lt"
		end

	sql_geq: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_geq"
		end

	sql_leq: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_leq"
		end

	sql_diff: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_diff"
		end

	sql_regexp: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_regexp"
		end

	sql_regexp_ci: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_regexp_ci"
		end

	sql_not_regexp: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_not_regexp"
		end

	sql_not_regexp_ci: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_not_regexp_ci"
		end

	sql_similar: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_similar"
		end

	sql_not: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "SQL_not"
		end


end

