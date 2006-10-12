indexing
	description: "External calls for GDA_DATA_MODEL_QUERY"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_MODEL_QUERY_EXTERNALS
feature {} -- External calls
	gda_data_model_query_new (a_query: POINTER): POINTER is
			--  GdaDataModel* gda_data_model_query_new (GdaQuery *query)
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_query_get_param_list (a_model: POINTER): POINTER is
			--  GdaParameterList* gda_data_model_query_get_param_list
			--  (GdaDataModelQuery *model)
	external "C use <libgda/libgda.h>"
	end

	gda_data_model_query_refresh (a_model, an_error_handle: POINTER): INTEGER is
			--  gboolean gda_data_model_query_refresh (GdaDataModelQuery *model,
			--  GError **error)
		external "C use <libgda/libgda.h>"
		end

 gda_data_model_query_set_modification_query (a_model, a_query, an_error_handle: POINTER): INTEGER is
			--  gboolean gda_data_model_query_set_modification_query
			--  (GdaDataModelQuery *model, const gchar *query, GError **error)
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelQuery)"
		end
end
