indexing
	description: "External calls for GDA_DICT_TABLE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DICT_TABLE_EXTERNALS
feature {} -- External calls
	 gda_dict_table_new (a_dict: POINTER): POINTER is
			--  GObject* gda_dict_table_new (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_table_get_database (a_table: POINTER): POINTER is
			--  GdaDictDatabase* gda_dict_table_get_database (GdaDictTable *table);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_is_view (a_table: POINTER): INTEGER is
			--  gboolean gda_dict_table_is_view (GdaDictTable *table);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_get_parents (a_table: POINTER): POINTER is
			--  const GSList* gda_dict_table_get_parents (GdaDictTable *table);
		external "C use <libgda/libgda.h>"
		end

	 gda_dict_table_get_constraints (a_table: POINTER): POINTER is
			--  GSList* gda_dict_table_get_constraints (GdaDictTable *table);
		external "C use <libgda/libgda.h>"
		end

	 gda_dict_table_get_pk_constraint (a_table: POINTER): POINTER is
			--  GdaDictConstraint* gda_dict_table_get_pk_constraint (GdaDictTable *table);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_table_update_dbms_data (a_table, an_error_handle: POINTER): INTEGER is
			--  gboolean gda_dict_table_update_dbms_data (GdaDictTable *table, GError **error);
		external "C use <libgda/libgda.h>"
		end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictTable)"
		end
end
