indexing
	description: "Enum GdaCommandType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_command_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_COMMAND_TYPE
       -- Enum GdaCommandType

insert ENUM

creation set_sql

feature -- Setters

    set_sql is 
       do
          value := gda_command_type_sql 
       ensure is_sql 
       end

    set_xml is 
       do
          value := gda_command_type_xml 
       ensure is_xml 
       end

    set_procedure is 
       do
          value := gda_command_type_procedure 
       ensure is_procedure 
       end

    set_table is 
       do
          value := gda_command_type_table 
       ensure is_table 
       end

    set_schema is 
       do
          value := gda_command_type_schema 
       ensure is_schema 
       end

    set_invalid is 
       do
          value := gda_command_type_invalid 
       ensure is_invalid 
       end

feature -- Queries

    is_sql: BOOLEAN is do Result:=(value=gda_command_type_sql) end

    is_xml: BOOLEAN is do Result:=(value=gda_command_type_xml) end

    is_procedure: BOOLEAN is do Result:=(value=gda_command_type_procedure) end

    is_table: BOOLEAN is do Result:=(value=gda_command_type_table) end

    is_schema: BOOLEAN is do Result:=(value=gda_command_type_schema) end

    is_invalid: BOOLEAN is do Result:=(value=gda_command_type_invalid) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_command_type_sql) or else
                    (a_value=gda_command_type_xml) or else
                    (a_value=gda_command_type_procedure) or else
                    (a_value=gda_command_type_table) or else
                    (a_value=gda_command_type_schema) or else
                    (a_value=gda_command_type_invalid) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_command_type_sql: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-command.h"
         alias "GDA_COMMAND_TYPE_SQL"
         end

    gda_command_type_xml: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-command.h"
         alias "GDA_COMMAND_TYPE_XML"
         end

    gda_command_type_procedure: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-command.h"
         alias "GDA_COMMAND_TYPE_PROCEDURE"
         end

    gda_command_type_table: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-command.h"
         alias "GDA_COMMAND_TYPE_TABLE"
         end

    gda_command_type_schema: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-command.h"
         alias "GDA_COMMAND_TYPE_SCHEMA"
         end

    gda_command_type_invalid: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-command.h"
         alias "GDA_COMMAND_TYPE_INVALID"
         end

end -- class GDA_COMMAND_TYPE
