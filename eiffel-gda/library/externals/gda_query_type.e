indexing
	description: "Enum GdaQueryType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_query_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_QUERY_TYPE
       -- Enum GdaQueryType

insert ENUM

creation set_select

feature -- Setters

    set_select is 
       do
          value := gda_query_type_select 
       ensure is_select 
       end

    set_insert is 
       do
          value := gda_query_type_insert 
       ensure is_insert 
       end

    set_update is 
       do
          value := gda_query_type_update 
       ensure is_update 
       end

    set_delete is 
       do
          value := gda_query_type_delete 
       ensure is_delete 
       end

    set_union is 
       do
          value := gda_query_type_union 
       ensure is_union 
       end

    set_intersect is 
       do
          value := gda_query_type_intersect 
       ensure is_intersect 
       end

    set_except is 
       do
          value := gda_query_type_except 
       ensure is_except 
       end

    set_non_parsed_sql is 
       do
          value := gda_query_type_non_parsed_sql 
       ensure is_non_parsed_sql 
       end

feature -- Queries

    is_select: BOOLEAN is do Result:=(value=gda_query_type_select) end

    is_insert: BOOLEAN is do Result:=(value=gda_query_type_insert) end

    is_update: BOOLEAN is do Result:=(value=gda_query_type_update) end

    is_delete: BOOLEAN is do Result:=(value=gda_query_type_delete) end

    is_union: BOOLEAN is do Result:=(value=gda_query_type_union) end

    is_intersect: BOOLEAN is do Result:=(value=gda_query_type_intersect) end

    is_except: BOOLEAN is do Result:=(value=gda_query_type_except) end

    is_non_parsed_sql: BOOLEAN is do Result:=(value=gda_query_type_non_parsed_sql) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_query_type_select) or else
                    (a_value=gda_query_type_insert) or else
                    (a_value=gda_query_type_update) or else
                    (a_value=gda_query_type_delete) or else
                    (a_value=gda_query_type_union) or else
                    (a_value=gda_query_type_intersect) or else
                    (a_value=gda_query_type_except) or else
                    (a_value=gda_query_type_non_parsed_sql) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_query_type_select: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_SELECT"
         end

    gda_query_type_insert: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_INSERT"
         end

    gda_query_type_update: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_UPDATE"
         end

    gda_query_type_delete: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_DELETE"
         end

    gda_query_type_union: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_UNION"
         end

    gda_query_type_intersect: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_INTERSECT"
         end

    gda_query_type_except: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_EXCEPT"
         end

    gda_query_type_non_parsed_sql: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-query.h"
         alias "GDA_QUERY_TYPE_NON_PARSED_SQL"
         end

end -- class GDA_QUERY_TYPE
