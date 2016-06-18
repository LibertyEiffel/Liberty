-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_ACCESS_WRAPPER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_access_wrapper_row_exists (a_wrapper: POINTER; a_row: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_access_wrapper_new (a_model: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_access_wrapper_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
