-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_HASH_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_hash_insert_row (a_model: POINTER; a_rownum: INTEGER_32; a_row: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_hash_set_n_columns (a_model: POINTER; a_cols: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_hash_clear (a_model: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_hash_new (a_cols: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_hash_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
