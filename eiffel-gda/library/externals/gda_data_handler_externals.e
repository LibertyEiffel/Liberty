indexing
	description: "External calls for GDA_DATA_HANDLER"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DATA_HANDLER_EXTERNALS
feature {} -- External calls
	gda_data_handler_get_sql_from_value (an_handler, a_value: POINTER): POINTER is
			-- gchar* gda_data_handler_get_sql_from_value (GdaDataHandler
			-- *dh, const GValue *value);
		external "C use <libgda/libgda.h>"
		end

  gda_data_handler_get_str_from_value (an_handler, a_value: POINTER): POINTER is
			-- gchar* gda_data_handler_get_str_from_value (GdaDataHandler
			-- *dh, const GValue *value);
		external "C use <libgda/libgda.h>"
		end
	
  gda_data_handler_get_value_from_sql (an_handler, some_sql: POINTER; a_type: INTEGER): POINTER is
			-- GValue* gda_data_handler_get_value_from_sql
			-- (GdaDataHandler *dh, const gchar *sql, GType type);
	external "C use <libgda/libgda.h>"
	end

	gda_data_handler_get_value_from_str (an_handler, a_string: POINTER; a_type: INTEGER): POINTER is
			-- GValue* gda_data_handler_get_value_from_str
			-- (GdaDataHandler *dh, const gchar *str, GType type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_handler_get_sane_init_value (an_handler: POINTER; a_type: INTEGER): POINTER is
			--  GValue* gda_data_handler_get_sane_init_value
			--  (GdaDataHandler *dh, GType type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_handler_get_nb_gda_types (an_handler: POINTER): INTEGER is
			-- guint gda_data_handler_get_nb_gda_types (GdaDataHandler
			-- *dh);
		obsolete "should be NATURAL, since it's a guint"
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_accepts_gda_type (an_handler: POINTER; a_type: INTEGER): INTEGER is
			--  gboolean gda_data_handler_accepts_gda_type (GdaDataHandler *dh, GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_data_handler_get_gda_type_index (an_handler: POINTER; an_index: INTEGER): INTEGER is
			--  GType gda_data_handler_get_gda_type_index (GdaDataHandler *dh, guint 
			--  index);
		obsolete "an_index should be NATURAL, since it is a guint"
		external "C use <libgda/libgda.h>"
		end
	
	gda_data_handler_get_descr (an_handler: POINTER): POINTER is
			--  const gchar* gda_data_handler_get_descr (GdaDataHandler *dh);
		external "C use <libgda/libgda.h>"
		end
end
