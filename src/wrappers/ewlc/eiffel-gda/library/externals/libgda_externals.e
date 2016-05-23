-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class LIBGDA_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_init is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
