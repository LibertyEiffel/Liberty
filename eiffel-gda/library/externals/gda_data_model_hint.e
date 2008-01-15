indexing
	description: "Enum GdaDataModelHint"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_data_model_hint.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DATA_MODEL_HINT
       -- Enum GdaDataModelHint

insert ENUM

creation set_start_batch_update

feature -- Setters

    set_start_batch_update is 
       do
          value := gda_data_model_hint_start_batch_update 
       ensure is_start_batch_update 
       end

    set_end_batch_update is 
       do
          value := gda_data_model_hint_end_batch_update 
       ensure is_end_batch_update 
       end

    set_refresh is 
       do
          value := gda_data_model_hint_refresh 
       ensure is_refresh 
       end

feature -- Queries

    is_start_batch_update: BOOLEAN is do Result:=(value=gda_data_model_hint_start_batch_update) end

    is_end_batch_update: BOOLEAN is do Result:=(value=gda_data_model_hint_end_batch_update) end

    is_refresh: BOOLEAN is do Result:=(value=gda_data_model_hint_refresh) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_data_model_hint_start_batch_update) or else
                    (a_value=gda_data_model_hint_end_batch_update) or else
                    (a_value=gda_data_model_hint_refresh) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_data_model_hint_start_batch_update: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model.h"
         alias "GDA_DATA_MODEL_HINT_START_BATCH_UPDATE"
         end

    gda_data_model_hint_end_batch_update: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model.h"
         alias "GDA_DATA_MODEL_HINT_END_BATCH_UPDATE"
         end

    gda_data_model_hint_refresh: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model.h"
         alias "GDA_DATA_MODEL_HINT_REFRESH"
         end

end -- class GDA_DATA_MODEL_HINT
