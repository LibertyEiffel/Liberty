-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_FIELD_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_field_is_list (a_qfield: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_equal (a_qfield1: POINTER; a_qfield2: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_internal (a_qfield: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_set_internal (a_qfield: POINTER; an_internal: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_is_visible (a_qfield: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_set_visible (a_qfield: POINTER; a_visible: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_alias (a_qfield: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_set_alias (a_qfield: POINTER; an_alias: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_parameters (a_qfield: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_dict_type (a_qfield: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_new_from_sql (a_query: POINTER; a_sqlfield: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_new_copy (an_orig: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_new_from_xml (a_query: POINTER; a_node: POINTER; an_error: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
