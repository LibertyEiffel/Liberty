indexing
	description: "External calls for GDA_COLUMN"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_COLUMN_EXTERNALS
feature {} -- External calls
	gda_column_new: POINTER is
			-- GdaColumn* gda_column_new (void);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_copy (a_column: POINTER): POINTER is
			-- GdaColumn* gda_column_copy (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_defined_size (a_column: POINTER): INTEGER is
			-- glong gda_column_get_defined_size (GdaColumn *column);
		external "C use <libgda/libgda.h>"
	end
	
	gda_column_set_defined_size (a_column: POINTER; a_size: INTEGER) is
			-- void gda_column_set_defined_size (GdaColumn *column, glong size);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_name (a_column: POINTER): POINTER is
			-- const gchar* gda_column_get_name (GdaColumn *column);
		external "C use <libgda/libgda.h>"
	end
	
	gda_column_set_name (a_column, a_name: POINTER) is
			-- void gda_column_set_name (GdaColumn *column, const gchar *name);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_title (a_column: POINTER): POINTER is
			-- const gchar* gda_column_get_title (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_title (a_column, a_title: POINTER) is
			-- void gda_column_set_title (GdaColumn *column, const gchar *title);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_table (a_column: POINTER): POINTER is
			-- const gchar* gda_column_get_table (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_table (a_column, a_table: POINTER) is
			-- void gda_column_set_table (GdaColumn *column, const gchar *table);
		external "C use <libgda/libgda.h>"
		end

	gda_column_get_caption (a_column: POINTER): POINTER is
			-- const gchar* gda_column_get_caption (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_caption (a_column, a_caption: POINTER) is
			-- void gda_column_set_caption (GdaColumn *column, const gchar *caption);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_scale (a_column: POINTER): INTEGER is
			-- glong gda_column_get_scale (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_scale (a_column: POINTER; a_scale: INTEGER) is
			-- void gda_column_set_scale (GdaColumn *column, glong scale);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_dbms_type (a_column: POINTER): POINTER is
			-- const gchar* gda_column_get_dbms_type (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_dbms_type (a_column, a_dbms_type: POINTER) is
			-- void gda_column_set_dbms_type (GdaColumn *column, const gchar
			-- *dbms_type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_gda_type (a_column: POINTER): INTEGER is
			-- GType gda_column_get_gda_type (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_gda_type (a_column: POINTER; a_type: INTEGER) is
			-- void gda_column_set_gda_type (GdaColumn *column, GType type);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_allow_null (a_column: POINTER): INTEGER is
			-- gboolean gda_column_get_allow_null (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_allow_null (a_column: POINTER; a_allow: INTEGER) is
			-- void gda_column_set_allow_null (GdaColumn *column, gboolean allow);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_primary_key (a_column: POINTER): INTEGER is
			-- gboolean gda_column_get_primary_key (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_primary_key (a_column: POINTER; a_pk: INTEGER) is
			-- void gda_column_set_primary_key (GdaColumn *column, gboolean pk);
		external "C use <libgda/libgda.h>"
		end

	gda_column_get_unique_key (a_column: POINTER): INTEGER is
			-- gboolean gda_column_get_unique_key (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_unique_key (a_column: POINTER; a_uk: INTEGER) is
			-- void gda_column_set_unique_key (GdaColumn *column, gboolean uk);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_references (a_column: POINTER): POINTER is
			-- const gchar* gda_column_get_references (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end

	gda_column_set_references (a_column, a_ref: POINTER) is
			-- void gda_column_set_references(GdaColumn *column, const gchar *ref);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_auto_increment (a_column: POINTER): INTEGER is
			-- gboolean gda_column_get_auto_increment (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_auto_increment (a_column: POINTER; a_is_auto: INTEGER) is
			-- gda_column_set_auto_increment (a_column: POINTER; gboolean is_auto);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_get_position (a_column: POINTER): INTEGER is
			-- gint gda_column_get_position (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_position (a_column: POINTER; a_position: INTEGER) is
			-- void gda_column_set_position (GdaColumn *column, gint position);
		external "C use <libgda/libgda.h>"
		end

	gda_column_get_default_value (a_column: POINTER): POINTER is
			-- const GValue* gda_column_get_default_value (GdaColumn *column);
		external "C use <libgda/libgda.h>"
		end
	
	gda_column_set_default_value (a_column, a_default_value: POINTER) is
			-- void gda_column_set_default_value (GdaColumn *column, const GValue
			-- *default_value);
		external "C use <libgda/libgda.h>"
		end
	
feature -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaColumn)"
		end
end
