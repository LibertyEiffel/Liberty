-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_HANDLER_STRING_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_handler_string_new_with_provider (a_prov: POINTER; a_cnc: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_string_new: POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_handler_string_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
