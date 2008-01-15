indexing
	description: "Enum GdaQueryError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_query_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_QUERY_ERROR
       -- Enum GdaQueryError

insert ENUM

creation set_xml_load_error

feature -- Setters

    set_xml_load_error is 
       do
          value := gda_query_xml_load_error 
       ensure is_xml_load_error 
       end

    set_meta_data_update is 
       do
          value := gda_query_meta_data_update 
       ensure is_meta_data_update 
       end

    set_fields_error is 
       do
          value := gda_query_fields_error 
       ensure is_fields_error 
       end

    set_targets_error is 
       do
          value := gda_query_targets_error 
       ensure is_targets_error 
       end

    set_render_error is 
       do
          value := gda_query_render_error 
       ensure is_render_error 
       end

    set_parse_error is 
       do
          value := gda_query_parse_error 
       ensure is_parse_error 
       end

    set_syntax_error is 
       do
          value := gda_query_syntax_error 
       ensure is_syntax_error 
       end

    set_structure_error is 
       do
          value := gda_query_structure_error 
       ensure is_structure_error 
       end

    set_sql_analyse_error is 
       do
          value := gda_query_sql_analyse_error 
       ensure is_sql_analyse_error 
       end

    set_no_cnc_error is 
       do
          value := gda_query_no_cnc_error 
       ensure is_no_cnc_error 
       end

    set_cnc_closed_error is 
       do
          value := gda_query_cnc_closed_error 
       ensure is_cnc_closed_error 
       end

    set_exec_error is 
       do
          value := gda_query_exec_error 
       ensure is_exec_error 
       end

    set_param_type_error is 
       do
          value := gda_query_param_type_error 
       ensure is_param_type_error 
       end

feature -- Queries

    is_xml_load_error: BOOLEAN is do Result:=(value=gda_query_xml_load_error) end

    is_meta_data_update: BOOLEAN is do Result:=(value=gda_query_meta_data_update) end

    is_fields_error: BOOLEAN is do Result:=(value=gda_query_fields_error) end

    is_targets_error: BOOLEAN is do Result:=(value=gda_query_targets_error) end

    is_render_error: BOOLEAN is do Result:=(value=gda_query_render_error) end

    is_parse_error: BOOLEAN is do Result:=(value=gda_query_parse_error) end

    is_syntax_error: BOOLEAN is do Result:=(value=gda_query_syntax_error) end

    is_structure_error: BOOLEAN is do Result:=(value=gda_query_structure_error) end

    is_sql_analyse_error: BOOLEAN is do Result:=(value=gda_query_sql_analyse_error) end

    is_no_cnc_error: BOOLEAN is do Result:=(value=gda_query_no_cnc_error) end

    is_cnc_closed_error: BOOLEAN is do Result:=(value=gda_query_cnc_closed_error) end

    is_exec_error: BOOLEAN is do Result:=(value=gda_query_exec_error) end

    is_param_type_error: BOOLEAN is do Result:=(value=gda_query_param_type_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_query_xml_load_error) or else
                    (a_value=gda_query_meta_data_update) or else
                    (a_value=gda_query_fields_error) or else
                    (a_value=gda_query_targets_error) or else
                    (a_value=gda_query_render_error) or else
                    (a_value=gda_query_parse_error) or else
                    (a_value=gda_query_syntax_error) or else
                    (a_value=gda_query_structure_error) or else
                    (a_value=gda_query_sql_analyse_error) or else
                    (a_value=gda_query_no_cnc_error) or else
                    (a_value=gda_query_cnc_closed_error) or else
                    (a_value=gda_query_exec_error) or else
                    (a_value=gda_query_param_type_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_query_xml_load_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_XML_LOAD_ERROR"
         end

    gda_query_meta_data_update: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_META_DATA_UPDATE"
         end

    gda_query_fields_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_FIELDS_ERROR"
         end

    gda_query_targets_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TARGETS_ERROR"
         end

    gda_query_render_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_RENDER_ERROR"
         end

    gda_query_parse_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_PARSE_ERROR"
         end

    gda_query_syntax_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_SYNTAX_ERROR"
         end

    gda_query_structure_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_STRUCTURE_ERROR"
         end

    gda_query_sql_analyse_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_SQL_ANALYSE_ERROR"
         end

    gda_query_no_cnc_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_NO_CNC_ERROR"
         end

    gda_query_cnc_closed_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_CNC_CLOSED_ERROR"
         end

    gda_query_exec_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_EXEC_ERROR"
         end

    gda_query_param_type_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_PARAM_TYPE_ERROR"
         end

end -- class GDA_QUERY_ERROR
