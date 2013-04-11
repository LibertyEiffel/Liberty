-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_QUERY_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_query_type_select) or else 
				(a_value = gda_query_type_insert) or else 
				(a_value = gda_query_type_update) or else 
				(a_value = gda_query_type_delete) or else 
				(a_value = gda_query_type_union) or else 
				(a_value = gda_query_type_intersect) or else 
				(a_value = gda_query_type_except) or else 
				(a_value = gda_query_type_non_parsed_sql))
		end


feature {ANY} -- Setters
	default_create, set_select_external is
		do
			value := gda_query_type_select
		end

	set_insert_external is
		do
			value := gda_query_type_insert
		end

	set_update is
		do
			value := gda_query_type_update
		end

	set_delete is
		do
			value := gda_query_type_delete
		end

	set_union is
		do
			value := gda_query_type_union
		end

	set_intersect is
		do
			value := gda_query_type_intersect
		end

	set_except is
		do
			value := gda_query_type_except
		end

	set_non_parsed_sql is
		do
			value := gda_query_type_non_parsed_sql
		end


feature {ANY} -- Queries
	is_select_external: BOOLEAN is
		do
			Result := (value=gda_query_type_select)
		end

	is_insert_external: BOOLEAN is
		do
			Result := (value=gda_query_type_insert)
		end

	is_update: BOOLEAN is
		do
			Result := (value=gda_query_type_update)
		end

	is_delete: BOOLEAN is
		do
			Result := (value=gda_query_type_delete)
		end

	is_union: BOOLEAN is
		do
			Result := (value=gda_query_type_union)
		end

	is_intersect: BOOLEAN is
		do
			Result := (value=gda_query_type_intersect)
		end

	is_except: BOOLEAN is
		do
			Result := (value=gda_query_type_except)
		end

	is_non_parsed_sql: BOOLEAN is
		do
			Result := (value=gda_query_type_non_parsed_sql)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_query_type_select: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_SELECT"
		end

	gda_query_type_insert: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_INSERT"
		end

	gda_query_type_update: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_UPDATE"
		end

	gda_query_type_delete: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_DELETE"
		end

	gda_query_type_union: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_UNION"
		end

	gda_query_type_intersect: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_INTERSECT"
		end

	gda_query_type_except: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_EXCEPT"
		end

	gda_query_type_non_parsed_sql: INTEGER is
		external "C macro use <libgda/libgda.h>"
		alias "GDA_QUERY_TYPE_NON_PARSED_SQL"
		end


end

