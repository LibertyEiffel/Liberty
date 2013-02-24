-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_TRANSACTION_STATUS_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_transaction_status_new (a_name: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_transaction_status_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
