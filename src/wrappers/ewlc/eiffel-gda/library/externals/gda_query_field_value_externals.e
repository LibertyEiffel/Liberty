-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_FIELD_VALUE_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_field_value_restrict (a_field: POINTER; a_model: POINTER; a_col: INTEGER_32; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_is_value_null (a_field: POINTER; a_context: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_get_not_null (a_field: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_set_not_null (a_field: POINTER; a_not_null: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_get_parameter_index (a_field: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_get_is_parameter (a_field: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_set_is_parameter (a_field: POINTER; an_is_param: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_get_default_value (a_field: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_set_default_value (a_field: POINTER; a_default_val: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_get_value (a_field: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_set_value (a_field: POINTER; a_val: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_new (a_query: POINTER; a_type: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_value_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
