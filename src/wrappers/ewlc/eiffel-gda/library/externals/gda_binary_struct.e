-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_BINARY_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_data (a_structure: POINTER; a_value: POINTER)
		external "C struct GdaBinary set data use <library/externals/all-gda-includes.h>"
		end

	low_level_set_binary_length (a_structure: POINTER; a_value: INTEGER_32)
		external "C struct GdaBinary set binary_length use <library/externals/all-gda-includes.h>"
		end

feature {} -- Low-level queries
	get_data (a_structure: POINTER): POINTER
		external "C struct GdaBinary get data use <library/externals/all-gda-includes.h>"
		end

	get_binary_length (a_structure: POINTER): INTEGER_32
		external "C struct GdaBinary get binary_length use <library/externals/all-gda-includes.h>"
		end

end
