indexing
	description: "External calls for GDA_DATA_MODEL_HASH"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_MODEL_HASH_EXTERNALS
feature {} -- External calls
	
	gda_data_model_hash_new (a_cols: INTEGER): POINTER is
			--  GdaDataModel* gda_data_model_hash_new (gint cols)
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_hash_insert_row (a_model: POINTER; a_rownum: INTEGER; a_row: POINTER) is
			--  void gda_data_model_hash_insert_row (GdaDataModelHash *model, gint
			--  rownum, GdaRow *row)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_hash_set_n_columns (a_model: POINTER; a_cols: INTEGER) is
			--  void gda_data_model_hash_set_n_columns (GdaDataModelHash *model, gint cols)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_hash_clear (a_model: POINTER) is
			--  void gda_data_model_hash_clear (GdaDataModelHash *model)
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelHash)"
		end
end
