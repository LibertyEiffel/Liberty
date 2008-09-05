-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_ITER_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_iter_get_holder_for_field (an_iter: POINTER; a_col: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_is_valid (an_iter: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_invalidate_contents (an_iter: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_can_be_moved (an_iter: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_get_row (an_iter: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_move_prev (an_iter: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_move_next (an_iter: POINTER): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_set_at_row (an_iter: POINTER; a_row: INTEGER_32): INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_get_value_for_field (an_iter: POINTER; a_field_name: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_get_value_at (an_iter: POINTER; a_col: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_get_type: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_iter_error_quark: INTEGER_32 is
		external "C use <library/externals/all-gda-includes.h>"
		end

end
