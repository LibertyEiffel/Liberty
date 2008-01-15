indexing
	description: "Enum GdaQueryFieldFuncError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_query_field_func_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_QUERY_FIELD_FUNC_ERROR
       -- Enum GdaQueryFieldFuncError

insert ENUM

creation set_xml_load_error

feature -- Setters

    set_xml_load_error is 
       do
          value := gda_query_field_func_xml_load_error 
       ensure is_xml_load_error 
       end

    set_render_error is 
       do
          value := gda_query_field_func_render_error 
       ensure is_render_error 
       end

feature -- Queries

    is_xml_load_error: BOOLEAN is do Result:=(value=gda_query_field_func_xml_load_error) end

    is_render_error: BOOLEAN is do Result:=(value=gda_query_field_func_render_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_query_field_func_xml_load_error) or else
                    (a_value=gda_query_field_func_render_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_query_field_func_xml_load_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-field-func.h"
         alias "GDA_QUERY_FIELD_FUNC_XML_LOAD_ERROR"
         end

    gda_query_field_func_render_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-field-func.h"
         alias "GDA_QUERY_FIELD_FUNC_RENDER_ERROR"
         end

end -- class GDA_QUERY_FIELD_FUNC_ERROR
