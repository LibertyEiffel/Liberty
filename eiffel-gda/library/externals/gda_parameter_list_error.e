indexing
	description: "Enum GdaParameterListError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_parameter_list_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_PARAMETER_LIST_ERROR
       -- Enum GdaParameterListError

insert ENUM

creation set_no_node_error

feature -- Setters

    set_no_node_error is 
       do
          value := gda_parameter_list_no_node_error 
       ensure is_no_node_error 
       end

    set_node_outdated_error is 
       do
          value := gda_parameter_list_node_outdated_error 
       ensure is_node_outdated_error 
       end

    set_value_prov_obj_type_error is 
       do
          value := gda_parameter_list_value_prov_obj_type_error 
       ensure is_value_prov_obj_type_error 
       end

    set_value_prov_data_type_error is 
       do
          value := gda_parameter_list_value_prov_data_type_error 
       ensure is_value_prov_data_type_error 
       end

    set_value_prov_invisible_error is 
       do
          value := gda_parameter_list_value_prov_invisible_error 
       ensure is_value_prov_invisible_error 
       end

    set_value_prov_query_type_error is 
       do
          value := gda_parameter_list_value_prov_query_type_error 
       ensure is_value_prov_query_type_error 
       end

    set_dependency_not_in_paramlist_error is 
       do
          value := gda_parameter_list_dependency_not_in_paramlist_error 
       ensure is_dependency_not_in_paramlist_error 
       end

    set_dependency_position_error is 
       do
          value := gda_parameter_list_dependency_position_error 
       ensure is_dependency_position_error 
       end

    set_xml_spec_error is 
       do
          value := gda_parameter_list_xml_spec_error 
       ensure is_xml_spec_error 
       end

feature -- Queries

    is_no_node_error: BOOLEAN is do Result:=(value=gda_parameter_list_no_node_error) end

    is_node_outdated_error: BOOLEAN is do Result:=(value=gda_parameter_list_node_outdated_error) end

    is_value_prov_obj_type_error: BOOLEAN is do Result:=(value=gda_parameter_list_value_prov_obj_type_error) end

    is_value_prov_data_type_error: BOOLEAN is do Result:=(value=gda_parameter_list_value_prov_data_type_error) end

    is_value_prov_invisible_error: BOOLEAN is do Result:=(value=gda_parameter_list_value_prov_invisible_error) end

    is_value_prov_query_type_error: BOOLEAN is do Result:=(value=gda_parameter_list_value_prov_query_type_error) end

    is_dependency_not_in_paramlist_error: BOOLEAN is do Result:=(value=gda_parameter_list_dependency_not_in_paramlist_error) end

    is_dependency_position_error: BOOLEAN is do Result:=(value=gda_parameter_list_dependency_position_error) end

    is_xml_spec_error: BOOLEAN is do Result:=(value=gda_parameter_list_xml_spec_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_parameter_list_no_node_error) or else
                    (a_value=gda_parameter_list_node_outdated_error) or else
                    (a_value=gda_parameter_list_value_prov_obj_type_error) or else
                    (a_value=gda_parameter_list_value_prov_data_type_error) or else
                    (a_value=gda_parameter_list_value_prov_invisible_error) or else
                    (a_value=gda_parameter_list_value_prov_query_type_error) or else
                    (a_value=gda_parameter_list_dependency_not_in_paramlist_error) or else
                    (a_value=gda_parameter_list_dependency_position_error) or else
                    (a_value=gda_parameter_list_xml_spec_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_parameter_list_no_node_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_NO_NODE_ERROR"
         end

    gda_parameter_list_node_outdated_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_NODE_OUTDATED_ERROR"
         end

    gda_parameter_list_value_prov_obj_type_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_VALUE_PROV_OBJ_TYPE_ERROR"
         end

    gda_parameter_list_value_prov_data_type_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_VALUE_PROV_DATA_TYPE_ERROR"
         end

    gda_parameter_list_value_prov_invisible_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_VALUE_PROV_INVISIBLE_ERROR"
         end

    gda_parameter_list_value_prov_query_type_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_VALUE_PROV_QUERY_TYPE_ERROR"
         end

    gda_parameter_list_dependency_not_in_paramlist_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_DEPENDENCY_NOT_IN_PARAMLIST_ERROR"
         end

    gda_parameter_list_dependency_position_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_DEPENDENCY_POSITION_ERROR"
         end

    gda_parameter_list_xml_spec_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-parameter-list.h"
         alias "GDA_PARAMETER_LIST_XML_SPEC_ERROR"
         end

end -- class GDA_PARAMETER_LIST_ERROR
