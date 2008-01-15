indexing
	description: "Enum GdaDictConstraintFkAction"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_dict_constraint_fk_action.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DICT_CONSTRAINT_FK_ACTION
       -- Enum GdaDictConstraintFkAction

insert ENUM

creation set_cascade

feature -- Setters

    set_cascade is 
       do
          value := constraint_fk_action_cascade 
       ensure is_cascade 
       end

    set_set_null is 
       do
          value := constraint_fk_action_set_null 
       ensure is_set_null 
       end

    set_set_default is 
       do
          value := constraint_fk_action_set_default 
       ensure is_set_default 
       end

    set_set_value is 
       do
          value := constraint_fk_action_set_value 
       ensure is_set_value 
       end

    set_no_action is 
       do
          value := constraint_fk_action_no_action 
       ensure is_no_action 
       end

feature -- Queries

    is_cascade: BOOLEAN is do Result:=(value=constraint_fk_action_cascade) end

    is_set_null: BOOLEAN is do Result:=(value=constraint_fk_action_set_null) end

    is_set_default: BOOLEAN is do Result:=(value=constraint_fk_action_set_default) end

    is_set_value: BOOLEAN is do Result:=(value=constraint_fk_action_set_value) end

    is_no_action: BOOLEAN is do Result:=(value=constraint_fk_action_no_action) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=constraint_fk_action_cascade) or else
                    (a_value=constraint_fk_action_set_null) or else
                    (a_value=constraint_fk_action_set_default) or else
                    (a_value=constraint_fk_action_set_value) or else
                    (a_value=constraint_fk_action_no_action) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    constraint_fk_action_cascade: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_FK_ACTION_CASCADE"
         end

    constraint_fk_action_set_null: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_FK_ACTION_SET_NULL"
         end

    constraint_fk_action_set_default: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_FK_ACTION_SET_DEFAULT"
         end

    constraint_fk_action_set_value: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_FK_ACTION_SET_VALUE"
         end

    constraint_fk_action_no_action: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "CONSTRAINT_FK_ACTION_NO_ACTION"
         end

end -- class GDA_DICT_CONSTRAINT_FK_ACTION
