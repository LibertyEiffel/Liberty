indexing
	description: "External calls for GDA_DICT_TYPE"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class  GDA_DICT_TYPE_EXTERNALS
feature {} -- External calls
	
	gda_dict_type_new (a_dict: POINTER): POINTER is
			--	GdaDictType* gda_dict_type_new (GdaDict *dict);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_set_sqlname (a_dict_type, a_name: POINTER) is
			-- void gda_dict_type_set_sqlname (GdaDictType *dt, const
			-- gchar *sqlname);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_get_sqlname (a_dict_type: POINTER): POINTER is
			-- const gchar* gda_dict_type_get_sqlname (GdaDictType *dt);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_set_gda_type (a_dict_type: POINTER; a_type: INTEGER) is
			-- void gda_dict_type_set_gda_type (GdaDictType *dt, GType
			-- gda_type);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_get_gda_type (a_dict_type: POINTER): INTEGER is
			-- 	GType gda_dict_type_get_gda_type (GdaDictType *dt);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_add_synonym (a_dict_type, a_synonym: POINTER) is
			-- void gda_dict_type_add_synonym (GdaDictType *dt, const
			-- gchar *synonym);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_get_synonyms (a_dict_type: POINTER): POINTER is
			-- const GSList* gda_dict_type_get_synonyms (GdaDictType
			-- *dt);
	   external "C use <libgda/libgda.h>"
	   end

	gda_dict_type_clear_synonyms (a_dict_type: POINTER) is
			--	void gda_dict_type_clear_synonyms (GdaDictType *dt);
	   external "C use <libgda/libgda.h>"
	   end

 
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictType)"
		end
end
