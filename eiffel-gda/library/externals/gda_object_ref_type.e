indexing
	description: "Enum GdaObjectRefType"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_object_ref_type.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_OBJECT_REF_TYPE
       -- Enum GdaObjectRefType

insert ENUM

creation set_xml_id

feature -- Setters

    set_xml_id is 
       do
          value := reference_by_xml_id 
       ensure is_xml_id 
       end

    set_name is 
       do
          value := reference_by_name 
       ensure is_name 
       end

feature -- Queries

    is_xml_id: BOOLEAN is do Result:=(value=reference_by_xml_id) end

    is_name: BOOLEAN is do Result:=(value=reference_by_name) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=reference_by_xml_id) or else
                    (a_value=reference_by_name) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    reference_by_xml_id: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-object-ref.h"
         alias "REFERENCE_BY_XML_ID"
         end

    reference_by_name: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-object-ref.h"
         alias "REFERENCE_BY_NAME"
         end

end -- class GDA_OBJECT_REF_TYPE
