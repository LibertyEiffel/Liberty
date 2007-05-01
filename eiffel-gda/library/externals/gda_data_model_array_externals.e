indexing
	description: "External calls for GDA_DATA_MODEL_ARRAY"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_MODEL_ARRAY_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	gda_data_model_array_new (a_col_n: INTEGER): POINTER is
			--  GdaDataModel* gda_data_model_array_new (gint cols);
		external "C use <libgda/libgda.h>"
		end
	
	-- TODO: GdaDataModel* gda_data_model_array_new_with_types (gint cols, ...);
	
	gda_data_model_array_copy_model (a_src, an_error_handle: POINTER): POINTER is
			-- GdaDataModel* gda_data_model_array_copy_model
			-- (GdaDataModel *src, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_array_set_n_columns (a_model: POINTER; a_col_n: INTEGER) is
			--  void gda_data_model_array_set_n_columns (GdaDataModelArray *model, gint cols);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_array_clear (a_model: POINTER) is
			--  void gda_data_model_array_clear (GdaDataModelArray *model);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(Foo)"
		end
end
