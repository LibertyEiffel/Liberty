-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_TYPE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_type_clear_synonyms (a_dt: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_get_synonyms (a_dt: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_add_synonym (a_dt: POINTER; a_synonym: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_get_g_type (a_dt: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_set_g_type (a_dt: POINTER; a_g_type: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_get_sqlname (a_dt: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_set_sqlname (a_dt: POINTER; a_sqlname: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_new (a_dict: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_type_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
