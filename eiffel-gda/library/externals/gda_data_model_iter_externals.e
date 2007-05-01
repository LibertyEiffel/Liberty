indexing
	description: "External calls for GdaDataModelIter"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_MODEL_ITER_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	
	gda_data_model_iter_new (a_model: POINTER): POINTER is
			-- GdaDataModelIter* gda_data_model_iter_new (GdaDataModel *model);
		external "C use <libgda/libgda.h>"
		end
	

	gda_data_model_iter_is_valid (an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_iter_is_valid (GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_set_at_row (an_iter: POINTER; a_row: INTEGER): INTEGER is
			-- gboolean gda_data_model_iter_set_at_row (GdaDataModelIter *iter, gint row);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_move_next (an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_iter_move_next (GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_move_prev (an_iter: POINTER): INTEGER is
			-- gboolean gda_data_model_iter_move_prev (GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end

	 gda_data_model_iter_get_row (an_iter: POINTER): INTEGER is
			-- gint gda_data_model_iter_get_row (GdaDataModelIter *iter);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_iter_invalidate_contents (an_iter: POINTER) is
			-- void gda_data_model_iter_invalidate_contents (GdaDataModelIter
			-- *iter);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_iter_get_column_for_param (an_iter, a_parameter: POINTER): INTEGER is
			-- gint gda_data_model_iter_get_column_for_param (GdaDataModelIter
			-- *iter, GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_iter_get_param_for_column (an_iter: POINTER; a_col: INTEGER): POINTER is
			-- GdaParameter* gda_data_model_iter_get_param_for_column
			-- (GdaDataModelIter *iter, gint col);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelIter)"
		end
end
