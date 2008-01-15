indexing
	description: "Enum GdaDataModelQueryError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_data_model_query_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DATA_MODEL_QUERY_ERROR
       -- Enum GdaDataModelQueryError

insert ENUM

creation set_xml_load_error

feature -- Setters

    set_xml_load_error is 
       do
          value := gda_data_model_query_xml_load_error 
       ensure is_xml_load_error 
       end

    set_compute_modif_queries_error is 
       do
          value := gda_data_model_query_compute_modif_queries_error 
       ensure is_compute_modif_queries_error 
       end

feature -- Queries

    is_xml_load_error: BOOLEAN is do Result:=(value=gda_data_model_query_xml_load_error) end

    is_compute_modif_queries_error: BOOLEAN is do Result:=(value=gda_data_model_query_compute_modif_queries_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_data_model_query_xml_load_error) or else
                    (a_value=gda_data_model_query_compute_modif_queries_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_data_model_query_xml_load_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model-query.h"
         alias "GDA_DATA_MODEL_QUERY_XML_LOAD_ERROR"
         end

    gda_data_model_query_compute_modif_queries_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model-query.h"
         alias "GDA_DATA_MODEL_QUERY_COMPUTE_MODIF_QUERIES_ERROR"
         end

end -- class GDA_DATA_MODEL_QUERY_ERROR
