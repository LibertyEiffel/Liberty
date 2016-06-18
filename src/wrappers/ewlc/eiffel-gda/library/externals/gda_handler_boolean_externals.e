-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_HANDLER_BOOLEAN_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_handler_boolean_new: POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_boolean_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
