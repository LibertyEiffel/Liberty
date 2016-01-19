-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class SQL_CONDITION_OPERATOR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
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
	default_create, set_eq is
		do
			value := sql_eq
		end

	set_is is
		do
			value := sql_is
		end

	set_in is
		do
			value := sql_in
		end

	set_like is
		do
			value := sql_like
		end

	set_between is
		do
			value := sql_between
		end

	set_gt is
		do
			value := sql_gt
		end

	set_lt is
		do
			value := sql_lt
		end

	set_geq is
		do
			value := sql_geq
		end

	set_leq is
		do
			value := sql_leq
		end

	set_diff is
		do
			value := sql_diff
		end

	set_regexp is
		do
			value := sql_regexp
		end

	set_regexp_ci is
		do
			value := sql_regexp_ci
		end

	set_not_regexp is
		do
			value := sql_not_regexp
		end

	set_not_regexp_ci is
		do
			value := sql_not_regexp_ci
		end

	set_similar is
		do
			value := sql_similar
		end

	set_not is
		do
			value := sql_not
		end


feature {ANY} -- Queries
	is_eq: BOOLEAN is
		do
			Result := (value=sql_eq)
		end

	is_is: BOOLEAN is
		do
			Result := (value=sql_is)
		end

	is_in: BOOLEAN is
		do
			Result := (value=sql_in)
		end

	is_like: BOOLEAN is
		do
			Result := (value=sql_like)
		end

	is_between: BOOLEAN is
		do
			Result := (value=sql_between)
		end

	is_gt: BOOLEAN is
		do
			Result := (value=sql_gt)
		end

	is_lt: BOOLEAN is
		do
			Result := (value=sql_lt)
		end

	is_geq: BOOLEAN is
		do
			Result := (value=sql_geq)
		end

	is_leq: BOOLEAN is
		do
			Result := (value=sql_leq)
		end

	is_diff: BOOLEAN is
		do
			Result := (value=sql_diff)
		end

	is_regexp: BOOLEAN is
		do
			Result := (value=sql_regexp)
		end

	is_regexp_ci: BOOLEAN is
		do
			Result := (value=sql_regexp_ci)
		end

	is_not_regexp: BOOLEAN is
		do
			Result := (value=sql_not_regexp)
		end

	is_not_regexp_ci: BOOLEAN is
		do
			Result := (value=sql_not_regexp_ci)
		end

	is_similar: BOOLEAN is
		do
			Result := (value=sql_similar)
		end

	is_not: BOOLEAN is
		do
			Result := (value=sql_not)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	sql_eq: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_eq"
		end

	sql_is: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_is"
		end

	sql_in: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_in"
		end

	sql_like: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_like"
		end

	sql_between: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_between"
		end

	sql_gt: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_gt"
		end

	sql_lt: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_lt"
		end

	sql_geq: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_geq"
		end

	sql_leq: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_leq"
		end

	sql_diff: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_diff"
		end

	sql_regexp: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_regexp"
		end

	sql_regexp_ci: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_regexp_ci"
		end

	sql_not_regexp: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_not_regexp"
		end

	sql_not_regexp_ci: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_not_regexp_ci"
		end

	sql_similar: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_similar"
		end

	sql_not: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "SQL_not"
		end


end

