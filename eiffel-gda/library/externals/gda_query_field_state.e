indexing
	description: "Enum GdaQueryFieldState"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_query_field_state.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_QUERY_FIELD_STATE
       -- Enum GdaQueryFieldState

insert ENUM

creation set_gda_entity_field_visible

feature -- Setters

    set_gda_entity_field_visible is 
       do
          value := gda_entity_field_visible 
       ensure is_gda_entity_field_visible 
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

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_0 is 
       do
          value := 0 
       ensure is_0 
       end

    set_gda_entity_field_invisible is 
       do
          value := gda_entity_field_invisible 
       ensure is_gda_entity_field_invisible 
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

    set_<< is 
       do
          value := << 
       ensure is_<< 
       end

    set_1 is 
       do
          value := 1 
       ensure is_1 
       end

    set_gda_entity_field_any is 
       do
          value := gda_entity_field_any 
       ensure is_gda_entity_field_any 
       end

    set_= is 
       do
          value := = 
       ensure is_= 
       end

    set_gda_entity_field_visible is 
       do
          value := gda_entity_field_visible 
       ensure is_gda_entity_field_visible 
       end

    set_| is 
       do
          value := | 
       ensure is_| 
       end

    set_gda_entity_field_invisible is 
       do
          value := gda_entity_field_invisible 
       ensure is_gda_entity_field_invisible 
       end

feature -- Queries

    is_gda_entity_field_visible: BOOLEAN is do Result:=(value=gda_entity_field_visible) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_0: BOOLEAN is do Result:=(value=0) end

    is_gda_entity_field_invisible: BOOLEAN is do Result:=(value=gda_entity_field_invisible) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_<<: BOOLEAN is do Result:=(value=<<) end

    is_1: BOOLEAN is do Result:=(value=1) end

    is_gda_entity_field_any: BOOLEAN is do Result:=(value=gda_entity_field_any) end

    is_=: BOOLEAN is do Result:=(value==) end

    is_gda_entity_field_visible: BOOLEAN is do Result:=(value=gda_entity_field_visible) end

    is_|: BOOLEAN is do Result:=(value=|) end

    is_gda_entity_field_invisible: BOOLEAN is do Result:=(value=gda_entity_field_invisible) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_entity_field_visible) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=0) or else
                    (a_value=gda_entity_field_invisible) or else
                    (a_value==) or else
                    (a_value=1) or else
                    (a_value=<<) or else
                    (a_value=1) or else
                    (a_value=gda_entity_field_any) or else
                    (a_value==) or else
                    (a_value=gda_entity_field_visible) or else
                    (a_value=|) or else
                    (a_value=gda_entity_field_invisible) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_entity_field_visible: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_ENTITY_FIELD_VISIBLE"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "<<"
         end

    0: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "0"
         end

    gda_entity_field_invisible: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_ENTITY_FIELD_INVISIBLE"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "="
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "1"
         end

    <<: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "<<"
         end

    1: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "1"
         end

    gda_entity_field_any: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_ENTITY_FIELD_ANY"
         end

    =: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "="
         end

    gda_entity_field_visible: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_ENTITY_FIELD_VISIBLE"
         end

    |: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "|"
         end

    gda_entity_field_invisible: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-enums.h"
         alias "GDA_ENTITY_FIELD_INVISIBLE"
         end

end -- class GDA_QUERY_FIELD_STATE
