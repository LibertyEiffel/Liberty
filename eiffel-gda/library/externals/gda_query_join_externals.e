-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_JOIN_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_join_render_type (a_join: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_set_condition_from_sql (a_join: POINTER; a_cond: POINTER; an_error: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_set_condition_from_fkcons (a_join: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_get_condition (a_join: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_set_condition (a_join: POINTER; a_cond: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_swap_targets (a_join: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_get_target_2 (a_join: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_get_target_1 (a_join: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_get_query (a_join: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_get_join_type (a_join: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_set_join_type (a_join: POINTER; a_type: INTEGER_32) is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_new_copy (an_orig: POINTER; a_replacements: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_new_with_xml_ids (a_query: POINTER; a_target_1_xml_id: POINTER; a_target_2_xml_id: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_new_with_targets (a_query: POINTER; a_target_1: POINTER; a_target_2: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_join_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
