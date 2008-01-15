indexing
	description: "Enum GdaQueryConditionOperator"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_query_condition_operator.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_QUERY_CONDITION_OPERATOR
       -- Enum GdaQueryConditionOperator

insert ENUM

creation set_gda_query_condition_op_left

feature -- Setters

    set_gda_query_condition_op_left is 
       do
          value := gda_query_condition_op_left 
       ensure is_gda_query_condition_op_left 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_0 is 
       do
          value := 0 
       ensure is_0 
       end

    set_gda_query_condition_op_right is 
       do
          value := gda_query_condition_op_right 
       ensure is_gda_query_condition_op_right 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_gda_query_condition_op_right2 is 
       do
          value := gda_query_condition_op_right2 
       ensure is_gda_query_condition_op_right2 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_2 is 
       do
          value := 2 
       ensure is_2 
       end

feature -- Queries

    is_gda_query_condition_op_left: BOOLEAN is do Result:=(value=gda_query_condition_op_left) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_0: BOOLEAN is do Result:=(value=0) end

    is_gda_query_condition_op_right: BOOLEAN is do Result:=(value=gda_query_condition_op_right) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_gda_query_condition_op_right2: BOOLEAN is do Result:=(value=gda_query_condition_op_right2) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_2: BOOLEAN is do Result:=(value=2) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_query_condition_op_left) or else
                    (a_value==) or else
                    (a_value=0) or else
                    (a_value=gda_query_condition_op_right) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=gda_query_condition_op_right2) or else
                    (a_value==) or else
                    (a_value=2) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_query_condition_op_left: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "GDA_QUERY_CONDITION_OP_LEFT"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "="
         end

    0: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "0"
         end

    gda_query_condition_op_right: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "GDA_QUERY_CONDITION_OP_RIGHT"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "1"
         end

    gda_query_condition_op_right2: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "GDA_QUERY_CONDITION_OP_RIGHT2"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "="
         end

    2: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-condition.h"
         alias "2"
         end

end -- class GDA_QUERY_CONDITION_OPERATOR
