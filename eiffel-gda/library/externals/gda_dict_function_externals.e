indexing
	description: "External calls for GDA_DICT_FUNCTION"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DICT_FUNCTION_EXTERNALS
feature {} -- External calls
	gda_dict_function_new (a_dict: POINTER): POINTER is
			-- GObject* gda_dict_function_new (GdaDict *dict);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_set_dbms_id (a_function, an_id: POINTER) is
			-- void gda_dict_function_set_dbms_id (GdaDictFunction *func,
			-- const gchar *id);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_get_dbms_id (a_function: POINTER): POINTER is
			-- gchar* gda_dict_function_get_dbms_id(GdaDictFunction
			-- *func);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_set_sqlname (a_function, an_sqlname: POINTER) is
			-- void gda_dict_function_set_sqlname (GdaDictFunction *func,
			-- const gchar *sqlname);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_get_sqlname (a_function: POINTER): POINTER is
			-- const gchar* gda_dict_function_get_sqlname
			-- (GdaDictFunction *func);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_set_arg_types (a_function, some_arg_types: POINTER) is
			-- void gda_dict_function_set_arg_types (GdaDictFunction
			-- *func, const GSList *arg_types);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_get_arg_types (a_function: POINTER): POINTER is
			--	const GSList* gda_dict_function_get_arg_types
			--	(GdaDictFunction *func);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_set_ret_type (a_function, a_dt: POINTER) is
			--	void gda_dict_function_set_ret_type (GdaDictFunction
			--	*func, GdaDictType *dt);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_get_ret_type (a_function: POINTER): POINTER is
			--	GdaDictType* gda_dict_function_get_ret_type
			--	(GdaDictFunction *func);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_function_accepts_args (a_function, some_arg_types: POINTER): INTEGER is
			-- gboolean gda_dict_function_accepts_args (GdaDictFunction
			-- *func, const GSList *arg_types);
	   external "C use <libgda/libgda.h>"
	   end

feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictFunction)"
		end
end
