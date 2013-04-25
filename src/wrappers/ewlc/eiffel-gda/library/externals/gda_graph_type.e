-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_GRAPH_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = gda_graph_db_relations) or else 
				(a_value = gda_graph_query_joins) or else 
				(a_value = gda_graph_modelling))
		end


feature {ANY} -- Setters
	default_create, set_gda_graph_db_relations is
		do
			value := gda_graph_db_relations
		end

	set_gda_graph_query_joins is
		do
			value := gda_graph_query_joins
		end

	set_gda_graph_modelling is
		do
			value := gda_graph_modelling
		end


feature {ANY} -- Queries
	is_gda_graph_db_relations: BOOLEAN is
		do
			Result := (value=gda_graph_db_relations)
		end

	is_gda_graph_query_joins: BOOLEAN is
		do
			Result := (value=gda_graph_query_joins)
		end

	is_gda_graph_modelling: BOOLEAN is
		do
			Result := (value=gda_graph_modelling)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_graph_db_relations: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_GRAPH_DB_RELATIONS"
		end

	gda_graph_query_joins: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_GRAPH_QUERY_JOINS"
		end

	gda_graph_modelling: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "GDA_GRAPH_MODELLING"
		end


end

