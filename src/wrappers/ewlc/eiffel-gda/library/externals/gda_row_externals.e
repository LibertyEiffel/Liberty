-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_ROW_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_row_get_is_default (a_row: POINTER; a_num: INTEGER_32): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_set_is_default (a_row: POINTER; a_num: INTEGER_32; an_is_default: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_set_value (a_row: POINTER; a_num: INTEGER_32; a_value: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_get_value (a_row: POINTER; a_num: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_set_id (a_row: POINTER; an_id: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_get_id (a_row: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_set_number (a_row: POINTER; a_number: INTEGER_32)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_get_number (a_row: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_get_length (a_row: POINTER): INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_get_model (a_row: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_set_model (a_row: POINTER; a_model: POINTER)
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_copy (a_row: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_new_from_list (a_model: POINTER; a_values: POINTER): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_new (a_model: POINTER; a_count: INTEGER_32): POINTER
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_row_get_type: INTEGER_32
		external "C use <library/externals/all-gda-includes.h>"
		end

end
