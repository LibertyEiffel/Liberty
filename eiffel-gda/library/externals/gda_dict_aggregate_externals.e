indexing
	description: "External calls for  GDA_DICT_AGGREGATE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class  GDA_DICT_AGGREGATE_EXTERNALS
feature {} -- External calls
	
 gda_dict_aggregate_new (a_dict: POINTER): POINTER is
			--  GObject* gda_dict_aggregate_new (GdaDict *dict);
		external "C use <libgda/libgda.h>"
		end
	
 gda_dict_aggregate_set_dbms_id (an_aggregate, an_id: POINTER) is
			-- void gda_dict_aggregate_set_dbms_id (GdaDictAggregate
			-- *agg, const gchar *id);
		external "C use <libgda/libgda.h>"
		end
	
 gda_dict_aggregate_get_dbms_id (an_aggregate: POINTER): POINTER is
			--  gchar* gda_dict_aggregate_get_dbms_id (GdaDictAggregate *agg);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_aggregate_set_sqlname (an_aggregate, an_sqlname: POINTER) is
			-- void gda_dict_aggregate_set_sqlname (GdaDictAggregate
			-- *agg, const gchar *sqlname);
		external "C use <libgda/libgda.h>"
		end
		 
	gda_dict_aggregate_get_sqlname (an_aggregate: POINTER): POINTER is
			--  const gchar* gda_dict_aggregate_get_sqlname
			--  (GdaDictAggregate *agg);
		external "C use <libgda/libgda.h>"
		end
		 
	gda_dict_aggregate_set_arg_type (an_aggregate, a_dict_type: POINTER) is
			--  void gda_dict_aggregate_set_arg_type (GdaDictAggregate
			--  *agg, GdaDictType *dt);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_aggregate_get_arg_type (an_aggregate: POINTER): POINTER is
			--  GdaDictType* gda_dict_aggregate_get_arg_type (GdaDictAggregate *agg);
		external "C use <libgda/libgda.h>"
		end
		 
	gda_dict_aggregate_set_ret_type (an_aggregate, a_dict_type: POINTER) is
			-- void gda_dict_aggregate_set_ret_type (GdaDictAggregate
			-- *agg, GdaDictType *dt);
		external "C use <libgda/libgda.h>"
		end
		 
	gda_dict_aggregate_get_ret_type (an_aggregate: POINTER): POINTER is
			--  GdaDictType* gda_dict_aggregate_get_ret_type
			--  (GdaDictAggregate *agg);
		external "C use <libgda/libgda.h>"
		end
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictAggregate)"
		end
end
