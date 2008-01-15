indexing
	description: "Enum GdaDictConstraintType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_dict_constraint_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DICT_CONSTRAINT_TYPE
       -- Enum GdaDictConstraintType

insert ENUM

creation set_primary_key

feature -- Setters

    set_primary_key is 
       do
          value := constraint_primary_key 
       ensure is_primary_key 
       end

    set_foreign_key is 
       do
          value := constraint_foreign_key 
       ensure is_foreign_key 
       end

    set_unique is 
       do
          value := constraint_unique 
       ensure is_unique 
       end

    set_not_null is 
       do
          value := constraint_not_null 
       ensure is_not_null 
       end

    set_check_expr is 
       do
          value := constraint_check_expr 
       ensure is_check_expr 
       end

    set_check_in_list is 
       do
          value := constraint_check_in_list 
       ensure is_check_in_list 
       end

    set_check_setof_list is 
       do
          value := constraint_check_setof_list 
       ensure is_check_setof_list 
       end

    set_unknown is 
       do
          value := constraint_unknown 
       ensure is_unknown 
       end

feature -- Queries

    is_primary_key: BOOLEAN is do Result:=(value=constraint_primary_key) end

    is_foreign_key: BOOLEAN is do Result:=(value=constraint_foreign_key) end

    is_unique: BOOLEAN is do Result:=(value=constraint_unique) end

    is_not_null: BOOLEAN is do Result:=(value=constraint_not_null) end

    is_check_expr: BOOLEAN is do Result:=(value=constraint_check_expr) end

    is_check_in_list: BOOLEAN is do Result:=(value=constraint_check_in_list) end

    is_check_setof_list: BOOLEAN is do Result:=(value=constraint_check_setof_list) end

    is_unknown: BOOLEAN is do Result:=(value=constraint_unknown) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=constraint_primary_key) or else
                    (a_value=constraint_foreign_key) or else
                    (a_value=constraint_unique) or else
                    (a_value=constraint_not_null) or else
                    (a_value=constraint_check_expr) or else
                    (a_value=constraint_check_in_list) or else
                    (a_value=constraint_check_setof_list) or else
                    (a_value=constraint_unknown) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    constraint_primary_key: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_PRIMARY_KEY"
         end

    constraint_foreign_key: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_FOREIGN_KEY"
         end

    constraint_unique: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_UNIQUE"
         end

    constraint_not_null: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_NOT_NULL"
         end

    constraint_check_expr: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_CHECK_EXPR"
         end

    constraint_check_in_list: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_CHECK_IN_LIST"
         end

    constraint_check_setof_list: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_CHECK_SETOF_LIST"
         end

    constraint_unknown: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_UNKNOWN"
         end

end -- class GDA_DICT_CONSTRAINT_TYPE
