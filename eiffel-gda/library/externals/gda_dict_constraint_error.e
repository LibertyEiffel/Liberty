indexing
	description: "Enum GdaDictConstraintError"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_dict_constraint_error.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DICT_CONSTRAINT_ERROR
       -- Enum GdaDictConstraintError

insert ENUM

creation set_save_error

feature -- Setters

    set_save_error is 
       do
          value := gda_dict_constraint_xml_save_error 
       ensure is_save_error 
       end

    set_load_error is 
       do
          value := gda_dict_constraint_xml_load_error 
       ensure is_load_error 
       end

feature -- Queries

    is_save_error: BOOLEAN is do Result:=(value=gda_dict_constraint_xml_save_error) end

    is_load_error: BOOLEAN is do Result:=(value=gda_dict_constraint_xml_load_error) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_dict_constraint_xml_save_error) or else
                    (a_value=gda_dict_constraint_xml_load_error) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_dict_constraint_xml_save_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "GDA_DICT_CONSTRAINT_XML_SAVE_ERROR"
         end

    gda_dict_constraint_xml_load_error: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-dict-constraint.h"
         alias "GDA_DICT_CONSTRAINT_XML_LOAD_ERROR"
         end

end -- class GDA_DICT_CONSTRAINT_ERROR
