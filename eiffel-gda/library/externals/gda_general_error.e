indexing
	description: "Enum GdaGeneralError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_general_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_GENERAL_ERROR
       -- Enum GdaGeneralError

insert ENUM

creation set_object_name_error

feature -- Setters

    set_object_name_error is 
       do
          value := gda_general_object_name_error 
       ensure is_object_name_error 
       end

    set_incorrect_value_error is 
       do
          value := gda_general_incorrect_value_error 
       ensure is_incorrect_value_error 
       end

    set_operation_error is 
       do
          value := gda_general_operation_error 
       ensure is_operation_error 
       end

feature -- Queries

    is_object_name_error: BOOLEAN is do Result:=(value=gda_general_object_name_error) end

    is_incorrect_value_error: BOOLEAN is do Result:=(value=gda_general_incorrect_value_error) end

    is_operation_error: BOOLEAN is do Result:=(value=gda_general_operation_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_general_object_name_error) or else
                    (a_value=gda_general_incorrect_value_error) or else
                    (a_value=gda_general_operation_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_general_object_name_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/libgda.h"
         alias "GDA_GENERAL_OBJECT_NAME_ERROR"
         end

    gda_general_incorrect_value_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/libgda.h"
         alias "GDA_GENERAL_INCORRECT_VALUE_ERROR"
         end

    gda_general_operation_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/libgda.h"
         alias "GDA_GENERAL_OPERATION_ERROR"
         end

end -- class GDA_GENERAL_ERROR
