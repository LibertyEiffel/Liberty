-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_HANDLER_NUMERICAL_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_handler_numerical_new: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_numerical_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
