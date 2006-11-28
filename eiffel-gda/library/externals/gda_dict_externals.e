indexing
	description: "External calls for GDA_DICT"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DICT_EXTERNALS

inherit ANY undefine is_equal, copy end


feature {} -- External calls
	gda_dict_new: POINTER is
			-- 	GObject* gda_dict_new (void);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_extend_with_functions (a_dict: POINTER) is
			-- 	void gda_dict_extend_with_functions (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_set_connection (a_dict, a_connection: POINTER) is
			-- 	void gda_dict_set_connection (GdaDict *dict, GdaConnection *cnc);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_connection (a_dict: POINTER): POINTER is
			-- 	GdaConnection* gda_dict_get_connection (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_database (a_dict: POINTER): POINTER is
			-- 	GdaDictDatabase* gda_dict_get_database (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_declare_object_string_id_change (a_dict, an_object, an_old_id: POINTER) is
			-- void gda_dict_declare_object_string_id_change (GdaDict *dict,
			-- GdaObject *obj, const gchar *oldid);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_object_by_string_id (a_dict, a_str_id: POINTER): POINTER is
			-- 	GdaObject* gda_dict_get_object_by_string_id (GdaDict *dict, const gchar *strid);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_update_dbms_data (a_dict: POINTER; a_limit_to_type: INTEGER; a_limit_obj_name, an_error_handle: POINTER): INTEGER is
			-- gboolean gda_dict_update_dbms_data (GdaDict *dict, GType
			-- limit_to_type, const gchar *limit_obj_name, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_stop_update_dbms_data (a_dict: POINTER) is
			-- 	void gda_dict_stop_update_dbms_data (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_compute_xml_filename (a_dict, a_datasource, an_app_id, an_error_handle: POINTER): POINTER is
			-- gchar* gda_dict_compute_xml_filename (GdaDict *dict, const gchar
			-- *datasource, const gchar *app_id, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_set_xml_filename (a_dict, an_xml_file: POINTER) is
			-- 	void gda_dict_set_xml_filename (GdaDict *dict, const gchar *xmlfile);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_xml_filename (a_dict: POINTER): POINTER is
			-- 	const gchar* gda_dict_get_xml_filename (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end

	 gda_dict_load (a_dict, an_error_handle: POINTER): INTEGER is
			-- 	gboolean gda_dict_load (GdaDict *dict, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_save (a_dict, an_error_handle: POINTER): INTEGER is
			-- 	gboolean gda_dict_save (GdaDict *dict, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_load_xml_file (a_dict, an_xmlfile, an_error_handle: POINTER): INTEGER is
			-- 	gboolean gda_dict_load_xml_file (GdaDict *dict, const gchar *xmlfile, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_save_xml_file (a_dict, an_xmlfile, an_error_handle: POINTER): INTEGER is
			-- 	gboolean gda_dict_save_xml_file (GdaDict *dict, const gchar *xmlfile, GError **error);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_handler (a_dict: POINTER; a_for_type: INTEGER): POINTER is
			-- 	GdaDataHandler* gda_dict_get_handler (GdaDict *dict, GType for_type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_get_default_handler (a_dict: POINTER; a_for_type: INTEGER): POINTER is
			-- 	GdaDataHandler* gda_dict_get_default_handler (GdaDict *dict, GType for_type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_queries  (dict: POINTER): POINTER is
			-- #define gda_dict_get_queries  (dict)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_query_by_xml_id  (dict,xml_id: POINTER): POINTER is
			-- #define gda_dict_get_query_by_xml_id  (dict,xml_id)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_dict_types  (dict: POINTER): POINTER is
			-- #define gda_dict_get_dict_types  (dict)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_dict_type_by_name  (dict,type_name: POINTER): POINTER is
			-- #define gda_dict_get_dict_type_by_name  (dict,type_name)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_dict_type_by_xml_id (dict,xml_id: POINTER): POINTER is
			-- #define gda_dict_get_dict_type_by_xml_id (dict,xml_id)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_functions  (dict: POINTER): POINTER is
			-- #define gda_dict_get_functions  (dict)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_functions_by_name  (dict,funcname: POINTER): POINTER is
			-- #define gda_dict_get_functions_by_name  (dict,funcname)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_function_by_name_arg (dict,funcname,argtypes: POINTER): POINTER is
			-- #define gda_dict_get_function_by_name_arg (dict,funcname,argtypes)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_function_by_xml_id  (dict,xml_id: POINTER): POINTER is
			-- #define gda_dict_get_function_by_xml_id  (dict,xml_id)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_function_by_dbms_id (dict,dbms_id: POINTER): POINTER is
			-- #define gda_dict_get_function_by_dbms_id (dict,dbms_id)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_aggregates  (dict: POINTER): POINTER is
			-- #define gda_dict_get_aggregates  (dict)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_aggregates_by_name  (dict,aggname: POINTER): POINTER is
			-- #define gda_dict_get_aggregates_by_name  (dict,aggname)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_aggregate_by_name_arg (dict,argname,argtype: POINTER): POINTER is
			-- #define gda_dict_get_aggregate_by_name_arg (dict,argname,argtype)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_aggregate_by_xml_id (dict,xml_id: POINTER): POINTER is
			-- #define gda_dict_get_aggregate_by_xml_id (dict,xml_id)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_get_aggregate_by_dbms_id (dict,dbmsid: POINTER): POINTER is
			-- #define gda_dict_get_aggregate_by_dbms_id (dict,dbmsid)
		external "C macro use <libgda/libgda.h>"
		end

	gda_dict_declare_object (a_dict: POINTER; an_object: POINTER) is
			-- 	void gda_dict_declare_object (GdaDict *dict, GdaObject *object);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_declare_object_as (a_dict, an_object: POINTER; an_as_type: INTEGER) is
			-- 	void gda_dict_declare_object_as (GdaDict *dict, GdaObject *object, GType as_type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_assume_object (a_dict, an_object: POINTER) is
			-- 	void gda_dict_assume_object (GdaDict *dict, GdaObject *object);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_assume_object_as (a_dict, an_object: POINTER; an_as_type: INTEGER) is
			-- 	void gda_dict_assume_object_as (GdaDict *dict, GdaObject *object, GType as_type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_unassume_object (a_dict, an_object: POINTER) is
			-- 	void gda_dict_unassume_object (GdaDict *dict, GdaObject *object);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_objects (a_dict: POINTER; a_type: INTEGER): POINTER is
			-- 	GSList* gda_dict_get_objects (GdaDict *dict, GType type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_object_by_name (a_dict: POINTER; a_type: INTEGER; a_name: POINTER): POINTER is
			-- GdaObject* gda_dict_get_object_by_name (GdaDict *dict, GType type,
			-- const gchar *name);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_get_object_by_xml_id (a_dict: POINTER; a_type: INTEGER; an_xml_id: POINTER): POINTER is
			-- GdaObject* gda_dict_get_object_by_xml_id (GdaDict *dict, GType type,
			-- const gchar *xml_id);
		external "C use <libgda/libgda.h>"
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDict)"
		end
end
