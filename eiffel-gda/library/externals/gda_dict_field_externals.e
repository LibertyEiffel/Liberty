indexing
	description: "External calls for  GDA_DICT_FIELD"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DICT_FIELD_EXTERNALS

inherit ANY undefine is_equal, copy end

insert GDA_DICT_FIELD_ATTRIBUTE_ENUM

feature {} -- External calls
	gda_dict_field_new (a_dict, a_dict_type: POINTER): POINTER is
			--  GObject* gda_dict_field_new (GdaDict *dict, GdaDictType *type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_length (a_field: POINTER; a_length: INTEGER) is
			--  void gda_dict_field_set_length (GdaDictField *field, gint length);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_get_length (a_field: POINTER): INTEGER is
			--  gint gda_dict_field_get_length (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_set_scale (a_field: POINTER; a_length: INTEGER) is
			--  void gda_dict_field_set_scale (GdaDictField *field, gint length);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_get_scale (a_field: POINTER): INTEGER is
			--  gint gda_dict_field_get_scale (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_constraints (a_field: POINTER): POINTER is
			--  GSList* gda_dict_field_get_constraints (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_set_dict_type (a_field, a_dict_type: POINTER) is
			--  void gda_dict_field_set_dict_type (GdaDictField *field, GdaDictType *type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_default_value (a_field, a_value: POINTER) is
			-- void gda_dict_field_set_default_value (GdaDictField *field, const
			-- GValue *value);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_default_value (a_field: POINTER): POINTER is
			-- const GValue* gda_dict_field_get_default_value (GdaDictField
			-- *field);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_null_allowed (a_field: POINTER): INTEGER is
			--  gboolean gda_dict_field_is_null_allowed (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_is_pkey_part (a_field: POINTER): INTEGER is
			--  gboolean gda_dict_field_is_pkey_part (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_is_pkey_alone (a_field: POINTER): INTEGER is
			--  gboolean gda_dict_field_is_pkey_alone (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_is_fkey_part (a_field: POINTER): INTEGER is
			--  gboolean gda_dict_field_is_fkey_part (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_field_is_fkey_alone (a_field: POINTER): INTEGER is
			--  gboolean gda_dict_field_is_fkey_alone (GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_set_attributes (a_field: POINTER; some_attributes: INTEGER) is
			--  void gda_dict_field_set_attributes (GdaDictField *field, guint
			--  attributes);
			-- TODO: `some_attributes' should be NATURAL since it is a guint
		external "C use <libgda/libgda.h>"
		end

	gda_dict_field_get_attributes (a_field: POINTER): INTEGER is
			--  guint gda_dict_field_get_attributes (GdaDictField *field);
			-- TODO: It should be NATURAL, since it is a guint
		external "C use <libgda/libgda.h>"
		end

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictField)"
		end
end
