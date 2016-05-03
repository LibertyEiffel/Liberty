-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_DICT_AGGREGATE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_dict_aggregate_get_ret_dict_type (an_agg: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_set_ret_dict_type (an_agg: POINTER; a_dt: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_get_arg_dict_type (an_agg: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_set_arg_dict_type (an_agg: POINTER; a_dt: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_get_sqlname (an_agg: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_set_sqlname (an_agg: POINTER; a_sqlname: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_get_dbms_id (an_agg: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_set_dbms_id (an_agg: POINTER; an_id: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_new (a_dict: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_dict_aggregate_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
