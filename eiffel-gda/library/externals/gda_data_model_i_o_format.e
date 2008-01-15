indexing
	description: "Enum GdaDataModelIOFormat"
	status: "[
                  AUTOMATICALLY GENERATED FILE. 

                  ANY CHANGE TO THIS WILL BE OVERWRITTEN BY NEXT
                  EXECUTION OF GENERATING SCRIPT!  You can put your
                  changes in the patch file gda_data_model_i_o_format.e.patch;
                  those changes will be applied to the newly generated
                  file.
                  ]"

expanded class GDA_DATA_MODEL_I_O_FORMAT
       -- Enum GdaDataModelIOFormat

insert ENUM

creation set_data_array_xml

feature -- Setters

    set_data_array_xml is 
       do
          value := gda_data_model_io_data_array_xml 
       ensure is_data_array_xml 
       end

    set_text_separated is 
       do
          value := gda_data_model_io_text_separated 
       ensure is_text_separated 
       end

feature -- Queries

    is_data_array_xml: BOOLEAN is do Result:=(value=gda_data_model_io_data_array_xml) end

    is_text_separated: BOOLEAN is do Result:=(value=gda_data_model_io_text_separated) end


    is_valid_value (a_value: INTEGER): BOOLEAN is 
        do 
           Result:=(
                    (a_value=gda_data_model_io_data_array_xml) or else
                    (a_value=gda_data_model_io_text_separated) or else
                    False -- A little hack to simplifies the generating script.
                    )
        end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values

    gda_data_model_io_data_array_xml: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model.h"
         alias "GDA_DATA_MODEL_IO_DATA_ARRAY_XML"
         end

    gda_data_model_io_text_separated: INTEGER is
         external "C macro use /usr/include/libgda-3.0/libgda/gda-data-model.h"
         alias "GDA_DATA_MODEL_IO_TEXT_SEPARATED"
         end

end -- class GDA_DATA_MODEL_I_O_FORMAT
