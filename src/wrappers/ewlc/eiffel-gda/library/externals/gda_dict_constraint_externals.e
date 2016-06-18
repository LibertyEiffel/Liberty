-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_CONSTRAINT_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_constraint_not_null_get_field (a_cstr: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_not_null_set_field (a_cstr: POINTER; a_field: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_unique_get_fields (a_cstr: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_unique_set_fields (a_cstr: POINTER; a_fields: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_get_actions (a_cstr: POINTER; an_on_update: POINTER; an_on_delete: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_set_actions (a_cstr: POINTER; an_on_update: INTEGER_32; an_on_delete: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_get_fields (a_cstr: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_get_ref_table (a_cstr: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_fkey_set_fields (a_cstr: POINTER; a_pairs: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_pkey_get_fields (a_cstr: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_pkey_set_fields (a_cstr: POINTER; a_fields: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_uses_field (a_cstr: POINTER; a_field: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_get_table (a_cstr: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_equal (a_cstr1: POINTER; a_cstr2: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_get_constraint_type (a_cstr: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_new_with_db (a_db: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_new (a_table: POINTER; a_type: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_dict_constraint_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
