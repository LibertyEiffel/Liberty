-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_JOIN_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_query_join_type_inner) or else 
				(a_value = gda_query_join_type_left_outer) or else 
				(a_value = gda_query_join_type_right_outer) or else 
				(a_value = gda_query_join_type_full_outer) or else 
				(a_value = gda_query_join_type_cross) or else 
				(a_value = gda_query_join_type_last))
		end


feature {ANY} -- Setters
	default_create, set_inner
		do
			value := gda_query_join_type_inner
		end

	set_left_outer
		do
			value := gda_query_join_type_left_outer
		end

	set_right_outer
		do
			value := gda_query_join_type_right_outer
		end

	set_full_outer
		do
			value := gda_query_join_type_full_outer
		end

	set_cross
		do
			value := gda_query_join_type_cross
		end

	set_last
		do
			value := gda_query_join_type_last
		end


feature {ANY} -- Queries
	is_inner: BOOLEAN
		do
			Result := (value=gda_query_join_type_inner)
		end

	is_left_outer: BOOLEAN
		do
			Result := (value=gda_query_join_type_left_outer)
		end

	is_right_outer: BOOLEAN
		do
			Result := (value=gda_query_join_type_right_outer)
		end

	is_full_outer: BOOLEAN
		do
			Result := (value=gda_query_join_type_full_outer)
		end

	is_cross: BOOLEAN
		do
			Result := (value=gda_query_join_type_cross)
		end

	is_last: BOOLEAN
		do
			Result := (value=gda_query_join_type_last)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_join_type_inner: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_TYPE_INNER"
		end

	gda_query_join_type_left_outer: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_TYPE_LEFT_OUTER"
		end

	gda_query_join_type_right_outer: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_TYPE_RIGHT_OUTER"
		end

	gda_query_join_type_full_outer: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_TYPE_FULL_OUTER"
		end

	gda_query_join_type_cross: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_TYPE_CROSS"
		end

	gda_query_join_type_last: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_JOIN_TYPE_LAST"
		end


end

