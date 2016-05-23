-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_FUNCTION_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_function_accepts_arg_dict_types (a_func: POINTER; an_arg_types: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_get_ret_dict_type (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_set_ret_dict_type (a_func: POINTER; a_dt: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_get_arg_dict_types (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_set_arg_dict_types (a_func: POINTER; an_arg_types: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_get_sqlname (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_set_sqlname (a_func: POINTER; a_sqlname: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_get_dbms_id (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_set_dbms_id (a_func: POINTER; an_id: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_new (a_dict: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_function_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
