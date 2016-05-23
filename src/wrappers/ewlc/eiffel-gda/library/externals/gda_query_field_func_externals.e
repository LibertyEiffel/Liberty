-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_FIELD_FUNC_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_field_func_get_args (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_func_set_args (a_func: POINTER; an_args: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_func_get_ref_func_name (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_func_get_ref_func (a_func: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_func_new (a_query: POINTER; a_func_name: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_func_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_func_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
