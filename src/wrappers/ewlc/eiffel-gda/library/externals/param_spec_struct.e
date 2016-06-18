-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class PARAM_SPEC_STRUCT

inherit ANY undefine is_equal, copy end

feature {} -- Low-level setters
	low_level_set_type (a_structure: POINTER; a_value: INTEGER_32)
		external "C struct param_spec set type use <libgda/libgda.h>"
		end

	low_level_set_content (a_structure: POINTER; a_value: POINTER)
		external "C struct param_spec set content use <libgda/libgda.h>"
		end

feature {} -- Low-level queries
	get_type (a_structure: POINTER): INTEGER_32
		external "C struct param_spec get type use <libgda/libgda.h>"
		end

	get_content (a_structure: POINTER): POINTER
		external "C struct param_spec get content use <libgda/libgda.h>"
		end

end
