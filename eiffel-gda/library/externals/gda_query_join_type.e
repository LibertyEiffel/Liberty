indexing
	description: "Enum GdaQueryJoinType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_query_join_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_QUERY_JOIN_TYPE
       -- Enum GdaQueryJoinType

insert ENUM

creation set_inner

feature -- Setters

    set_inner is 
       do
          value := gda_query_join_type_inner 
       ensure is_inner 
       end

    set_left_outer is 
       do
          value := gda_query_join_type_left_outer 
       ensure is_left_outer 
       end

    set_right_outer is 
       do
          value := gda_query_join_type_right_outer 
       ensure is_right_outer 
       end

    set_full_outer is 
       do
          value := gda_query_join_type_full_outer 
       ensure is_full_outer 
       end

    set_cross is 
       do
          value := gda_query_join_type_cross 
       ensure is_cross 
       end

    set_last is 
       do
          value := gda_query_join_type_last 
       ensure is_last 
       end

feature -- Queries

    is_inner: BOOLEAN is do Result:=(value=gda_query_join_type_inner) end

    is_left_outer: BOOLEAN is do Result:=(value=gda_query_join_type_left_outer) end

    is_right_outer: BOOLEAN is do Result:=(value=gda_query_join_type_right_outer) end

    is_full_outer: BOOLEAN is do Result:=(value=gda_query_join_type_full_outer) end

    is_cross: BOOLEAN is do Result:=(value=gda_query_join_type_cross) end

    is_last: BOOLEAN is do Result:=(value=gda_query_join_type_last) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_query_join_type_inner) or else
                    (a_value=gda_query_join_type_left_outer) or else
                    (a_value=gda_query_join_type_right_outer) or else
                    (a_value=gda_query_join_type_full_outer) or else
                    (a_value=gda_query_join_type_cross) or else
                    (a_value=gda_query_join_type_last) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_query_join_type_inner: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-join.h"
         alias "GDA_QUERY_JOIN_TYPE_INNER"
         end

    gda_query_join_type_left_outer: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-join.h"
         alias "GDA_QUERY_JOIN_TYPE_LEFT_OUTER"
         end

    gda_query_join_type_right_outer: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-join.h"
         alias "GDA_QUERY_JOIN_TYPE_RIGHT_OUTER"
         end

    gda_query_join_type_full_outer: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-join.h"
         alias "GDA_QUERY_JOIN_TYPE_FULL_OUTER"
         end

    gda_query_join_type_cross: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-join.h"
         alias "GDA_QUERY_JOIN_TYPE_CROSS"
         end

    gda_query_join_type_last: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query-join.h"
         alias "GDA_QUERY_JOIN_TYPE_LAST"
         end

end -- class GDA_QUERY_JOIN_TYPE
