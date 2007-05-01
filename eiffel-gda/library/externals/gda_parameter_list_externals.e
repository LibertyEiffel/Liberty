indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PARAMETER_LIST_EXTERNALS

inherit ANY undefine is_equal, copy end


insert
	GDA_PARAMETER_LIST_PARAM_HINT_ENUM

feature {} -- External calls
	gda_parameter_list_new (some_params: POINTER): POINTER is
			-- GdaParameterList* gda_parameter_list_new (GSList *params)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_new_from_spec_string (a_dict, an_xml_spec, a_error_ref: POINTER): POINTER is
			-- GdaParameterList* gda_parameter_list_new_from_spec_string (GdaDict *dict, const gchar *xml_spec, GError **error)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_get_length (a_parameter_list: POINTER): INTEGER is
			-- guint gda_parameter_list_get_length (GdaParameterList *plist)
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_get_spec (a_parameter_list: POINTER): POINTER is
			-- gchar* gda_parameter_list_get_spec (GdaParameterList *paramlist)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_add_param (a_parameter_list, a_parameter: POINTER) is
			-- void gda_parameter_list_add_param (GdaParameterList *paramlist,
			-- GdaParameter *param)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_add_param_from_string (a_parameter_list, a_name: POINTER; a_type: INTEGER; a_str: POINTER): POINTER is
			-- GdaParameter* gda_parameter_list_add_param_from_string
			-- (GdaParameterList *paramlist, const gchar *name, GType type, const
			-- gchar *str)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_add_param_from_value (a_parameter_list, a_name, a_value: POINTER): POINTER is
			-- GdaParameter* gda_parameter_list_add_param_from_value
			-- (GdaParameterList *paramlist, const gchar *name, GValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_is_coherent (a_parameter_list, an_error_ref: POINTER): INTEGER is
			-- gboolean gda_parameter_list_is_coherent (GdaParameterList
			-- *paramlist, GError **error)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_is_valid (a_parameter_list: POINTER): INTEGER is
			-- gboolean gda_parameter_list_is_valid (GdaParameterList *paramlist)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_find_param (a_parameter_list, a_name: POINTER): POINTER is
			-- GdaParameter* gda_parameter_list_find_param (GdaParameterList
			-- *paramlist, const gchar *param_name)
		external "C use <libgda/libgda.h>"
 end
 
 gda_parameter_list_find_param_for_user (a_parameter_list, an_object: POINTER): POINTER is
			-- GdaParameter* gda_parameter_list_find_param_for_user
			-- (GdaParameterList *paramlist, GdaObject *user)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_find_node_for_param (a_parameter_list, a_parameter: POINTER): POINTER is
			-- GdaParameterListNode* gda_parameter_list_find_node_for_param
			-- (GdaParameterList *paramlist, GdaParameter *param)
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_find_source_for_param (a_parameter_list, a_parameter: POINTER): POINTER is
			-- GdaParameterListSource* gda_parameter_list_find_source_for_param
			-- (GdaParameterList *paramlist, GdaParameter *param)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_find_source (a_parameter_list, a_model: POINTER): POINTER is
			-- GdaParameterListSource* gda_parameter_list_find_source
			-- (GdaParameterList *paramlist, GdaDataModel *model)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_set_param_default_value (a_parameter_list, a_parameter, a_value: POINTER) is
			-- void gda_parameter_list_set_param_default_value (GdaParameterList
			-- *paramlist, GdaParameter *param, const GValue *value)
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_list_set_param_default_alias (a_parameter_list, a_parameter, an_alias: POINTER) is
			-- void gda_parameter_list_set_param_default_alias (GdaParameterList
			-- *paramlist, GdaParameter *param, GdaParameter *alias)
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_list_get_param_default_value (a_parameter_list, a_param: POINTER): POINTER is
			-- const GValue* gda_parameter_list_get_param_default_value
			-- (GdaParameterList *paramlist, GdaParameter *param)
		external "C use <libgda/libgda.h>"
		end
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameterList)"
		end
end
