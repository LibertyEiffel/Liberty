-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_ARRAY_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_array_clear (a_model: POINTER) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_array_set_n_columns (a_model: POINTER; a_cols: INTEGER_32) is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_array_copy_model (a_src: POINTER; an_error: POINTER): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_array_new (a_cols: INTEGER_32): POINTER is
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_array_new_with_g_types (a_cols: INTEGER_32; ): POINTER is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

	gda_data_model_array_get_type: INTEGER_32 is
			-- Variadic call
		external "C use <library/externals/all-gda-includes.h>"
		end

end
