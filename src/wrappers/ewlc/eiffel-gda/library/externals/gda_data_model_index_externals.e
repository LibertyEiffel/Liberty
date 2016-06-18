-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DATA_MODEL_INDEX_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_index_set_column_index_list (a_dmi: POINTER; a_col_idx_list: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_column_index_list (a_dmi: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_set_references (a_dmi: POINTER; a_ref: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_references (a_dmi: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_set_unique_key (a_dmi: POINTER; an_uk: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_unique_key (a_dmi: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_set_primary_key (a_dmi: POINTER; a_pk: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_primary_key (a_dmi: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_set_table_name (a_dmi: POINTER; a_name: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_table_name (a_dmi: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_set_name (a_dmi: POINTER; a_name: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_name (a_dmi: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_equal (a_lhs: POINTER; a_rhs: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_free (a_dmi: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_copy (a_dmi: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_new: POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_index_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
