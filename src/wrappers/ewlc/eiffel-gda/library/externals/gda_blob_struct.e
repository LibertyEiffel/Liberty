-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_BLOB_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_op (a_structure: POINTER; a_value: POINTER)
		external "C struct GdaBlob set op use <library/externals/all-gda-includes.h>"
		end

feature {} -- Low-level queries
	-- Unwrappable data: C structure passed by value and not by reference does not have a valid Eiffel wrapper type; they are mostly akin to an eventual expanded external type
	get_op (a_structure: POINTER): POINTER
		external "C struct GdaBlob get op use <library/externals/all-gda-includes.h>"
		end

end
