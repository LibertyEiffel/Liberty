-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_NUMERIC_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_number (a_structure: POINTER; a_value: POINTER) is
		external "C struct GdaNumeric set number use <library/externals/all-gda-includes.h>"
		end

	low_level_set_precision (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct GdaNumeric set precision use <library/externals/all-gda-includes.h>"
		end

	low_level_set_width (a_structure: POINTER; a_value: INTEGER_32) is
		external "C struct GdaNumeric set width use <library/externals/all-gda-includes.h>"
		end

feature {} -- Low-level queries
	get_number (a_structure: POINTER): POINTER is
		external "C struct GdaNumeric get number use <library/externals/all-gda-includes.h>"
		end

	get_precision (a_structure: POINTER): INTEGER_32 is
		external "C struct GdaNumeric get precision use <library/externals/all-gda-includes.h>"
		end

	get_width (a_structure: POINTER): INTEGER_32 is
		external "C struct GdaNumeric get width use <library/externals/all-gda-includes.h>"
		end

end
