indexing
	description: "Enum GdaServerOperationType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_server_operation_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_SERVER_OPERATION_TYPE
       -- Enum GdaServerOperationType

insert ENUM

creation set_create_db

feature -- Setters

    set_create_db is 
       do
          value := gda_server_operation_create_db 
       ensure is_create_db 
       end

    set_drop_db is 
       do
          value := gda_server_operation_drop_db 
       ensure is_drop_db 
       end

    set_create_table is 
       do
          value := gda_server_operation_create_table 
       ensure is_create_table 
       end

    set_drop_table is 
       do
          value := gda_server_operation_drop_table 
       ensure is_drop_table 
       end

    set_rename_table is 
       do
          value := gda_server_operation_rename_table 
       ensure is_rename_table 
       end

    set_add_column is 
       do
          value := gda_server_operation_add_column 
       ensure is_add_column 
       end

    set_drop_column is 
       do
          value := gda_server_operation_drop_column 
       ensure is_drop_column 
       end

    set_create_index is 
       do
          value := gda_server_operation_create_index 
       ensure is_create_index 
       end

    set_drop_index is 
       do
          value := gda_server_operation_drop_index 
       ensure is_drop_index 
       end

    set_nb is 
       do
          value := gda_server_operation_nb 
       ensure is_nb 
       end

feature -- Queries

    is_create_db: BOOLEAN is do Result:=(value=gda_server_operation_create_db) end

    is_drop_db: BOOLEAN is do Result:=(value=gda_server_operation_drop_db) end

    is_create_table: BOOLEAN is do Result:=(value=gda_server_operation_create_table) end

    is_drop_table: BOOLEAN is do Result:=(value=gda_server_operation_drop_table) end

    is_rename_table: BOOLEAN is do Result:=(value=gda_server_operation_rename_table) end

    is_add_column: BOOLEAN is do Result:=(value=gda_server_operation_add_column) end

    is_drop_column: BOOLEAN is do Result:=(value=gda_server_operation_drop_column) end

    is_create_index: BOOLEAN is do Result:=(value=gda_server_operation_create_index) end

    is_drop_index: BOOLEAN is do Result:=(value=gda_server_operation_drop_index) end

    is_nb: BOOLEAN is do Result:=(value=gda_server_operation_nb) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_server_operation_create_db) or else
                    (a_value=gda_server_operation_drop_db) or else
                    (a_value=gda_server_operation_create_table) or else
                    (a_value=gda_server_operation_drop_table) or else
                    (a_value=gda_server_operation_rename_table) or else
                    (a_value=gda_server_operation_add_column) or else
                    (a_value=gda_server_operation_drop_column) or else
                    (a_value=gda_server_operation_create_index) or else
                    (a_value=gda_server_operation_drop_index) or else
                    (a_value=gda_server_operation_nb) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_server_operation_create_db: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_CREATE_DB"
         end

    gda_server_operation_drop_db: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_DROP_DB"
         end

    gda_server_operation_create_table: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_CREATE_TABLE"
         end

    gda_server_operation_drop_table: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_DROP_TABLE"
         end

    gda_server_operation_rename_table: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_RENAME_TABLE"
         end

    gda_server_operation_add_column: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_ADD_COLUMN"
         end

    gda_server_operation_drop_column: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_DROP_COLUMN"
         end

    gda_server_operation_create_index: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_CREATE_INDEX"
         end

    gda_server_operation_drop_index: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_DROP_INDEX"
         end

    gda_server_operation_nb: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-server-operation.h"
         alias "GDA_SERVER_OPERATION_NB"
         end

end -- class GDA_SERVER_OPERATION_TYPE
