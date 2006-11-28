indexing
	description: "External calls for GDA_DATA_MODEL_FILTER_SQL"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_MODEL_FILTER_SQL_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_data_model_filter_sql_new: POINTER is
			-- GdaDataModel* gda_data_model_filter_sql_new (void);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_filter_sql_add_source (a_sel, a_name, a_source: POINTER) is
			-- void gda_data_model_filter_sql_add_source
			-- (GdaDataModelFilterSQL *sel, const gchar *name,
			-- GdaDataModel *source);
		external "C use <libgda/libgda.h>"
		end

	gda_data_model_filter_sql_set_sql (a_sel, some_sql: POINTER) is
			-- void gda_data_model_filter_sql_set_sql
			-- (GdaDataModelFilterSQL *sel, const gchar *sql);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_model_filter_sql_run (a_sel: POINTER): INTEGER is
			-- gboolean gda_data_model_filter_sql_run
			-- (GdaDataModelFilterSQL *sel);
		external "C use <libgda/libgda.h>"
		end
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDataModelFilterSQL)"
		end
end
