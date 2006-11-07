indexing
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GDA_DICT_CONSTRAINT_EXTERNALS
insert
	GDA_DICT_CONSTRAINT_TYPE_ENUM
	GDA_DICT_CONSTRAINT_FK_ACTION_ENUM
feature {} -- External calls
	gda_dict_constraint_new  (a_table: POINTER; a_type: INTEGER): POINTER is
			-- GdaDictConstraint* gda_dict_constraint_new (GdaDictTable
			-- *table, GdaDictConstraintType type);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_new_with_db (a_database: POINTER): POINTER is
			--  GdaDictConstraint* gda_dict_constraint_new_with_db (GdaDictDatabase *db);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_get_constraint_type (a_constraint: POINTER): INTEGER is
			--  GdaDictConstraintType gda_dict_constraint_get_constraint_type (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_equal (a_constraint, another: POINTER): INTEGER is
			-- gboolean gda_dict_constraint_equal (GdaDictConstraint
			-- *cstr1, GdaDictConstraint *cstr2);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_get_table (a_constraint: POINTER): POINTER is
			-- GdaDictTable* gda_dict_constraint_get_table
			-- (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_uses_field  (a_constraint, a_field: POINTER): INTEGER is
			-- gboolean gda_dict_constraint_uses_field (GdaDictConstraint
			-- *cstr, GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_pkey_set_fields (a_constraint, fields: POINTER) is
			-- void gda_dict_constraint_pkey_set_fields
			-- (GdaDictConstraint *cstr, const GSList *fields);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_pkey_get_fields (a_constraint: POINTER): POINTER is
			-- GSList* gda_dict_constraint_pkey_get_fields
			-- (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_set_fields (a_constraint, pairs: POINTER) is
			-- void gda_dict_constraint_fkey_set_fields
			-- (GdaDictConstraint *cstr, const GSList *pairs);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_get_ref_table (a_constraint: POINTER): POINTER is
			-- GdaDictTable* gda_dict_constraint_fkey_get_ref_table
			-- (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_get_fields (a_constraint: POINTER): POINTER is
			-- GSList* gda_dict_constraint_fkey_get_fields
			-- (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_set_actions (a_constraint: POINTER; on_update_enum, on_delete_enum: INTEGER) is
			-- void gda_dict_constraint_fkey_set_actions
			-- (GdaDictConstraint *cstr, GdaDictConstraintFkAction
			-- on_update, GdaDictConstraintFkAction on_delete);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_constraint_fkey_get_actions (a_constraint, on_update_ptr, on_delete_ptr: POINTER) is
			-- void gda_dict_constraint_fkey_get_actions
			-- (GdaDictConstraint *cstr, GdaDictConstraintFkAction
			-- *on_update, GdaDictConstraintFkAction *on_delete);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_constraint_unique_set_fields (a_constraint, fields: POINTER) is
			-- void gda_dict_constraint_unique_set_fields
			-- (GdaDictConstraint *cstr, const GSList *fields);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_constraint_unique_get_fields (a_constraint: POINTER): POINTER is
			-- GSList* gda_dict_constraint_unique_get_fields
			-- (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end
	
	gda_dict_constraint_not_null_set_field (a_constraint, field: POINTER) is
			-- void gda_dict_constraint_not_null_set_field
			-- (GdaDictConstraint *cstr, GdaDictField *field);
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_not_null_get_field (a_constraint: POINTER): POINTER is
			-- GdaDictField* gda_dict_constraint_not_null_get_field
			-- (GdaDictConstraint *cstr);
		external "C use <libgda/libgda.h>"
		end

feature -- size

	struct_size: INTEGER is
		external "C inline use <libgda/libgda.h>"
		alias "sizeof(GdaDictConstraint)"
		end
end
