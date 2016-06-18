-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_ROW_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_row_get_row (a_model: POINTER; a_row: INTEGER_32; an_error: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_row_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
