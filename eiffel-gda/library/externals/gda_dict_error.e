indexing
	description: "Enum GdaDictError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_dict_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DICT_ERROR
       -- Enum GdaDictError

insert ENUM

creation set_meta_data_update_error

feature -- Setters

    set_meta_data_update_error is 
       do
          value := gda_dict_meta_data_update_error 
       ensure is_meta_data_update_error 
       end

    set_meta_data_update_user_stopped is 
       do
          value := gda_dict_meta_data_update_user_stopped 
       ensure is_meta_data_update_user_stopped 
       end

    set_load_file_not_exist_error is 
       do
          value := gda_dict_load_file_not_exist_error 
       ensure is_load_file_not_exist_error 
       end

    set_file_load_error is 
       do
          value := gda_dict_file_load_error 
       ensure is_file_load_error 
       end

    set_file_save_error is 
       do
          value := gda_dict_file_save_error 
       ensure is_file_save_error 
       end

    set_datatype_error is 
       do
          value := gda_dict_datatype_error 
       ensure is_datatype_error 
       end

    set_functions_error is 
       do
          value := gda_dict_functions_error 
       ensure is_functions_error 
       end

    set_aggregates_error is 
       do
          value := gda_dict_aggregates_error 
       ensure is_aggregates_error 
       end

feature -- Queries

    is_meta_data_update_error: BOOLEAN is do Result:=(value=gda_dict_meta_data_update_error) end

    is_meta_data_update_user_stopped: BOOLEAN is do Result:=(value=gda_dict_meta_data_update_user_stopped) end

    is_load_file_not_exist_error: BOOLEAN is do Result:=(value=gda_dict_load_file_not_exist_error) end

    is_file_load_error: BOOLEAN is do Result:=(value=gda_dict_file_load_error) end

    is_file_save_error: BOOLEAN is do Result:=(value=gda_dict_file_save_error) end

    is_datatype_error: BOOLEAN is do Result:=(value=gda_dict_datatype_error) end

    is_functions_error: BOOLEAN is do Result:=(value=gda_dict_functions_error) end

    is_aggregates_error: BOOLEAN is do Result:=(value=gda_dict_aggregates_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_dict_meta_data_update_error) or else
                    (a_value=gda_dict_meta_data_update_user_stopped) or else
                    (a_value=gda_dict_load_file_not_exist_error) or else
                    (a_value=gda_dict_file_load_error) or else
                    (a_value=gda_dict_file_save_error) or else
                    (a_value=gda_dict_datatype_error) or else
                    (a_value=gda_dict_functions_error) or else
                    (a_value=gda_dict_aggregates_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_dict_meta_data_update_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_META_DATA_UPDATE_ERROR"
         end

    gda_dict_meta_data_update_user_stopped: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_META_DATA_UPDATE_USER_STOPPED"
         end

    gda_dict_load_file_not_exist_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_LOAD_FILE_NOT_EXIST_ERROR"
         end

    gda_dict_file_load_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_FILE_LOAD_ERROR"
         end

    gda_dict_file_save_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_FILE_SAVE_ERROR"
         end

    gda_dict_datatype_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_DATATYPE_ERROR"
         end

    gda_dict_functions_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_FUNCTIONS_ERROR"
         end

    gda_dict_aggregates_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict.h"
         alias "GDA_DICT_AGGREGATES_ERROR"
         end

end -- class GDA_DICT_ERROR
