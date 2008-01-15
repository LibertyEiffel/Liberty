indexing
	description: "Enum GdaDictDatabaseError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_dict_database_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DICT_DATABASE_ERROR
       -- Enum GdaDictDatabaseError

insert ENUM

creation set_xml_save_error

feature -- Setters

    set_xml_save_error is 
       do
          value := gda_dict_database_xml_save_error 
       ensure is_xml_save_error 
       end

    set_xml_load_error is 
       do
          value := gda_dict_database_xml_load_error 
       ensure is_xml_load_error 
       end

    set_meta_data_update is 
       do
          value := gda_dict_database_meta_data_update 
       ensure is_meta_data_update 
       end

    set_meta_data_update_user_stopped is 
       do
          value := gda_dict_database_meta_data_update_user_stopped 
       ensure is_meta_data_update_user_stopped 
       end

    set_tables_error is 
       do
          value := gda_dict_database_tables_error 
       ensure is_tables_error 
       end

    set_sequences_error is 
       do
          value := gda_dict_database_sequences_error 
       ensure is_sequences_error 
       end

feature -- Queries

    is_xml_save_error: BOOLEAN is do Result:=(value=gda_dict_database_xml_save_error) end

    is_xml_load_error: BOOLEAN is do Result:=(value=gda_dict_database_xml_load_error) end

    is_meta_data_update: BOOLEAN is do Result:=(value=gda_dict_database_meta_data_update) end

    is_meta_data_update_user_stopped: BOOLEAN is do Result:=(value=gda_dict_database_meta_data_update_user_stopped) end

    is_tables_error: BOOLEAN is do Result:=(value=gda_dict_database_tables_error) end

    is_sequences_error: BOOLEAN is do Result:=(value=gda_dict_database_sequences_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_dict_database_xml_save_error) or else
                    (a_value=gda_dict_database_xml_load_error) or else
                    (a_value=gda_dict_database_meta_data_update) or else
                    (a_value=gda_dict_database_meta_data_update_user_stopped) or else
                    (a_value=gda_dict_database_tables_error) or else
                    (a_value=gda_dict_database_sequences_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_dict_database_xml_save_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-database.h"
         alias "GDA_DICT_DATABASE_XML_SAVE_ERROR"
         end

    gda_dict_database_xml_load_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-database.h"
         alias "GDA_DICT_DATABASE_XML_LOAD_ERROR"
         end

    gda_dict_database_meta_data_update: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-database.h"
         alias "GDA_DICT_DATABASE_META_DATA_UPDATE"
         end

    gda_dict_database_meta_data_update_user_stopped: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-database.h"
         alias "GDA_DICT_DATABASE_META_DATA_UPDATE_USER_STOPPED"
         end

    gda_dict_database_tables_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-database.h"
         alias "GDA_DICT_DATABASE_TABLES_ERROR"
         end

    gda_dict_database_sequences_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-database.h"
         alias "GDA_DICT_DATABASE_SEQUENCES_ERROR"
         end

end -- class GDA_DICT_DATABASE_ERROR
