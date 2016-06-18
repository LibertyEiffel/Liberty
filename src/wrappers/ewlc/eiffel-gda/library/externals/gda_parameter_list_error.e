-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class GDA_PARAMETER_LIST_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = gda_parameter_list_no_node_error) or else 
				(a_value = gda_parameter_list_node_outdated_error) or else 
				(a_value = gda_parameter_list_value_prov_obj_type_error) or else 
				(a_value = gda_parameter_list_value_prov_data_type_error) or else 
				(a_value = gda_parameter_list_value_prov_invisible_error) or else 
				(a_value = gda_parameter_list_value_prov_query_type_error) or else 
				(a_value = gda_parameter_list_dependency_not_in_paramlist_error) or else 
				(a_value = gda_parameter_list_dependency_position_error) or else 
				(a_value = gda_parameter_list_xml_spec_error))
		end


feature {ANY} -- Setters
	default_create, set_no_node_error
		do
			value := gda_parameter_list_no_node_error
		end

	set_node_outdated_error
		do
			value := gda_parameter_list_node_outdated_error
		end

	set_value_prov_obj_type_error
		do
			value := gda_parameter_list_value_prov_obj_type_error
		end

	set_value_prov_data_type_error
		do
			value := gda_parameter_list_value_prov_data_type_error
		end

	set_value_prov_invisible_error
		do
			value := gda_parameter_list_value_prov_invisible_error
		end

	set_value_prov_query_type_error
		do
			value := gda_parameter_list_value_prov_query_type_error
		end

	set_dependency_not_in_paramlist_error
		do
			value := gda_parameter_list_dependency_not_in_paramlist_error
		end

	set_dependency_position_error
		do
			value := gda_parameter_list_dependency_position_error
		end

	set_xml_spec_error
		do
			value := gda_parameter_list_xml_spec_error
		end


feature {ANY} -- Queries
	is_no_node_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_no_node_error)
		end

	is_node_outdated_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_node_outdated_error)
		end

	is_value_prov_obj_type_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_value_prov_obj_type_error)
		end

	is_value_prov_data_type_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_value_prov_data_type_error)
		end

	is_value_prov_invisible_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_value_prov_invisible_error)
		end

	is_value_prov_query_type_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_value_prov_query_type_error)
		end

	is_dependency_not_in_paramlist_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_dependency_not_in_paramlist_error)
		end

	is_dependency_position_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_dependency_position_error)
		end

	is_xml_spec_error: BOOLEAN
		do
			Result := (value=gda_parameter_list_xml_spec_error)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gda_parameter_list_no_node_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_NO_NODE_ERROR"
		end

	gda_parameter_list_node_outdated_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_NODE_OUTDATED_ERROR"
		end

	gda_parameter_list_value_prov_obj_type_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_VALUE_PROV_OBJ_TYPE_ERROR"
		end

	gda_parameter_list_value_prov_data_type_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_VALUE_PROV_DATA_TYPE_ERROR"
		end

	gda_parameter_list_value_prov_invisible_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_VALUE_PROV_INVISIBLE_ERROR"
		end

	gda_parameter_list_value_prov_query_type_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_VALUE_PROV_QUERY_TYPE_ERROR"
		end

	gda_parameter_list_dependency_not_in_paramlist_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_DEPENDENCY_NOT_IN_PARAMLIST_ERROR"
		end

	gda_parameter_list_dependency_position_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_DEPENDENCY_POSITION_ERROR"
		end

	gda_parameter_list_xml_spec_error: INTEGER
		external "C macro use <libgda/libgda.h>"
		alias "GDA_PARAMETER_LIST_XML_SPEC_ERROR"
		end


end

