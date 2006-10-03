indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class _EXTERNALS
feature {} -- External calls

	-- void (*GdaConfigListenerFunc) (const gchar *path, gpointer
	-- user_data);

	gda_config_get_string (a_path: POINTER): POINTER is
			-- gchar* gda_config_get_string (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_get_int (a_path: POINTER): INTEGER is
			-- gint gda_config_get_int (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_get_float (a_path: POINTER): REAL is
			-- gdouble gda_config_get_float (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_get_boolean (a_path: POINTER): INTEGER is
			-- gboolean gda_config_get_boolean (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_set_string (a_path, a_new_value: POINTER): INTEGER is
			-- gboolean gda_config_set_string (const gchar *path, const gchar *new_value);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_set_int (a_path: POINTER; a_new_value: INTEGER): INTEGER is
      	      -- gboolean gda_config_set_int (const gchar *path, gint new_value);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_set_float (a_path: POINTER; a_new_value: REAL): INTEGER is
			-- gboolean gda_config_set_float (const gchar *path, gdouble new_value);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_set_boolean (a_path: POINTER; a_new_value: INTEGER): INTEGER is
      	      -- gboolean gda_config_set_boolean (const gchar *path, gboolean new_value);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_remove_section (a_path: POINTER) is
			-- void gda_config_remove_section (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_remove_key (a_path: POINTER) is
			-- void gda_config_remove_key (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_has_section (a_path: POINTER): INTEGER is
			-- gboolean gda_config_has_section (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_has_key (a_path: POINTER): INTEGER is
			-- gboolean gda_config_has_key (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_list_sections (a_path: POINTER): POINTER is
      	      -- GList* gda_config_list_sections (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_list_keys (a_path: POINTER): POINTER is
			-- GList* gda_config_list_keys (const gchar *path);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_free_list (GList *list) is
			-- void gda_config_free_list (GList *list);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_get_provider_list: POINTER is
			-- GList* gda_config_get_provider_list (void);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_free_provider_list (a_list: POINTER) is
			-- void gda_config_free_provider_list (GList *list);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_get_provider_by_name (a_name: POINTER): POINTER is
			-- GdaProviderInfo* gda_config_get_provider_by_name (const gchar *name);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_get_provider_model: POINTER is
			-- GdaDataModel* gda_config_get_provider_model (void);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_provider_info_copy (a_source: POINTER): POINTER is
			-- GdaProviderInfo* gda_provider_info_copy (GdaProviderInfo *src);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_provider_info_free (a_provider_info: POINTER) is
			-- void gda_provider_info_free (GdaProviderInfo *provider_info);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_get_data_source_list: POINTER is
			-- GList* gda_config_get_data_source_list (void);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_find_data_source (a_name: POINTER): POINTER is
			-- GdaDataSourceInfo* gda_config_find_data_source (const gchar *name);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_data_source_info_copy (a_source: POINTER): POINTER is
			-- GdaDataSourceInfo* gda_data_source_info_copy (GdaDataSourceInfo *src);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_data_source_info_equal (info_1, info_2: POINTER): INTEGER is
			-- gboolean gda_data_source_info_equal (GdaDataSourceInfo *info1, GdaDataSourceInfo *info2);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_data_source_info_free (an_info: POINTER) is
			-- void gda_data_source_info_free (GdaDataSourceInfo *info);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_free_data_source_list (a_list: POINTER) is
			-- void gda_config_free_data_source_list (GList *list);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_get_data_source_model: POINTER is
			-- GdaDataModel* gda_config_get_data_source_model (void);
	   external "C use <ligda/libgda.h>"
	   end
	
	gda_config_can_modify_global_config: INTEGER is
			-- gboolean gda_config_can_modify_global_config (void);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_save_data_source (a_name, a_provider, a_cnc_string, a_description, a_username, a_password: POINTER; is_global_bool: INTEGER): INTEGER is
			-- gboolean gda_config_save_data_source (const gchar *name,
			-- const gchar *provider, const gchar *cnc_string, const
			-- gchar *description, const gchar *username, const gchar
			-- *password, gboolean is_global);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_save_data_source_info (a_dsn_info: INTEGER): INTEGER is
      	      -- gboolean gda_config_save_data_source_info (GdaDataSourceInfo *dsn_info);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_remove_data_source (a_name: POINTER) is
      	      -- void gda_config_remove_data_source (const gchar *name);
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_add_listener (a_path, a_gdaconfiglistenerfunc, some_data: POINTER): INTEGER is
			-- guint gda_config_add_listener (const gchar *path,
			-- GdaConfigListenerFunc func, gpointer user_data);
		obsolete "Result should be NATURAL"
	   external "C use <ligda/libgda.h>"
	   end

	gda_config_remove_listener (a_guint_id: INTEGER) is
			-- void gda_config_remove_listener (guint id);
	   external "C use <ligda/libgda.h>"
	   end


end
