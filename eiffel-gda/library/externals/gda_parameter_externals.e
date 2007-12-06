indexing
	description: "External calls for GDA_PARAMETER"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_PARAMETER_EXTERNALS

insert
	ANY
		undefine
			copy, is_equal
		end
	
	G_TYPE_EXTERNAL -- for "like g_type" anchored declarations

feature {} -- External calls

	gda_parameter_new (a_type: INTEGER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_copy (a_parameter: POINTER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_new_string (a_name, a_string: POINTER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_new_boolean (a_name: POINTER; a_bool: INTEGER): POINTER is -- GdaParameter*
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_g_type (a_parameter: POINTER): like g_type is
			-- GType gda_parameter_get_g_type (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_value (a_parameter: POINTER): POINTER is 
			-- const GValue* gda_parameter_get_value (GdaParameter
			-- *param);
		external "C use <libgda/libgda.h>"
		end


	gda_parameter_get_value_str (a_param: POINTER): POINTER is 
			-- gchar* gda_parameter_get_value_str (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_value (a_parameter, a_const_gvalue: POINTER) is
			-- void gda_parameter_set_value (GdaParameter *param, const
			-- GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_value_str (a_parameter, a_str_value: POINTER): INTEGER is
			-- gboolean gda_parameter_set_value_str (GdaParameter *param,
			-- const gchar *value);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_declare_invalid (a_parameter: POINTER) is
			-- void gda_parameter_declare_invalid (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_is_valid (a_parameter: POINTER): INTEGER is
			-- gboolean gda_parameter_is_valid (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_get_default_value (a_parameter: POINTER): POINTER is 
			-- const GValue* gda_parameter_get_default_value
			-- (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_default_value (a_parameter, a_gvalue: POINTER) is
			-- void gda_parameter_set_default_value (GdaParameter *param,
			-- const GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_exists_default_value (a_parameter: POINTER): INTEGER is
			-- gboolean gda_parameter_get_exists_default_value
			-- (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_set_exists_default_value (a_parameter: POINTER; does_default_value_exists: INTEGER) is
			-- void gda_parameter_set_exists_default_value (GdaParameter
			-- *param, gboolean default_value_exists);
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_set_not_null (a_parameter: POINTER; not_null_bool: INTEGER) is
			-- void gda_parameter_set_not_null (GdaParameter *param,
			-- gboolean not_null);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_not_null (a_parameter: POINTER): INTEGER is
			-- gboolean gda_parameter_get_not_null (GdaParameter *param);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_restrict_values (a_parameter, a_data_model: POINTER; a_col: INTEGER; an_error_handle: POINTER): INTEGER is
			-- gboolean gda_parameter_restrict_values (GdaParameter
			-- *param, GdaDataModel *model, gint col, GError **error);
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_has_restrict_values (a_parameter, a_model_ref, a_col_ptr: POINTER): INTEGER is
			-- gboolean gda_parameter_has_restrict_values (GdaParameter
			-- *param, GdaDataModel **model, gint *col);
		external "C use <libgda/libgda.h>"
		end
	
	gda_parameter_replace_param_users (a_parameter, hashtable_replacements: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_bind_to_param (a_parameter, bind_to_param: POINTER) is
			-- void gda_parameter_bind_to_param (GdaParameter *param,
			-- GdaParameter *bind_to);
		external "C use <libgda/libgda.h>"
		end

	gda_parameter_get_bind_param (a_parameter: POINTER): POINTER is -- GdaParameter*
			-- GdaParameter* gda_parameter_get_bind_param (GdaParameter
			-- *param);
		external "C use <libgda/libgda.h>"
		end

feature {} -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaParameter)"
		end
end
