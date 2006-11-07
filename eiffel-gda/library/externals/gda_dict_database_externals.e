indexing
	description: "External calls for GDA_DICT_DATABASE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DICT_DATABASE_EXTERNALS
feature {} -- External calls
	gda_dict_database_new (a_dict: POINTER): POINTER is
			-- GObject* gda_dict_database_new (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_add_constraint (a_db, a_cstr: POINTER) is
			-- void gda_dict_database_add_constraint (GdaDictDatabase *db, GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_dict (a_db: POINTER): POINTER is
			-- GdaDict* gda_dict_database_get_dict (GdaDictDatabase *db);
		external "C use <libgda/libgda.h>"
		end
	
	 gda_dict_database_update_dbms_data (a_db: POINTER; a_limiting_type: INTEGER; a_limiting_obj_name, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_dict_database_update_dbms_data
			-- (GdaDictDatabase *db, GType limit_to_type, const gchar
			-- *limit_obj_name, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_stop_update_dbms_data (a_db: POINTER) is
			-- void gda_dict_database_stop_update_dbms_data (GdaDictDatabase *db);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_tables (a_db: POINTER): POINTER is
			-- GSList* gda_dict_database_get_tables (GdaDictDatabase
			-- *db);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_table_by_name (a_db, a_name: POINTER): POINTER is
			-- GdaDictTable* gda_dict_database_get_table_by_name
			-- (GdaDictDatabase *db, const gchar *name);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_table_by_xml_id (a_db, an_xml_id: POINTER): POINTER is
			-- GdaDictTable* gda_dict_database_get_table_by_xml_id
			-- (GdaDictDatabase *db, const gchar *xml_id);
		external "C use <libgda/libgda.h>"
		end
	
	 gda_dict_database_get_field_by_name (a_db, a_fullname: POINTER): POINTER is
			-- GdaDictField* gda_dict_database_get_field_by_name
			-- (GdaDictDatabase *db, const gchar *fullname);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_field_by_xml_id (a_db, an_xml_id: POINTER): POINTER is
			-- GdaDictField* gda_dict_database_get_field_by_xml_id
			-- (GdaDictDatabase *db, const gchar *xml_id);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_all_constraints (a_db: POINTER): POINTER is
			-- GSList* gda_dict_database_get_all_constraints (GdaDictDatabase *db);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_table_constraints (a_db, a_table: POINTER): POINTER is
			-- GSList* gda_dict_database_get_table_constraints (GdaDictDatabase *db, GdaDictTable *table);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_database_get_all_fk_constraints (a_db: POINTER): POINTER is
			-- GSList* gda_dict_database_get_all_fk_constraints (GdaDictDatabase *db);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_database_get_tables_fk_constraints (a_db, a_table_1, a_table_2: POINTER; a_table1_has_fk: INTEGER): POINTER is
			-- GSList* gda_dict_database_get_tables_fk_constraints
			-- (GdaDictDatabase *db, GdaDictTable *table1, GdaDictTable
			-- *table2, gboolean table1_has_fk);
		external "C use <libgda/libgda.h>"
		end
 
feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictDatabase)"
		end
end
