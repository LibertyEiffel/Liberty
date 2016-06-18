-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_CONDITION_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_condition_get_main_conditions (a_condition: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_represents_join_strict (a_condition: POINTER; a_target1: POINTER; a_target2: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_represents_join (a_condition: POINTER; a_target1: POINTER; a_target2: POINTER; an_is_equi_join: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_ref_objects_all (a_cond: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_leaf_get_operator (a_condition: POINTER; an_op: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_leaf_set_operator (a_condition: POINTER; an_op: INTEGER_32; a_field: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_node_del_child (a_condition: POINTER; a_child: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_node_add_child (a_condition: POINTER; a_child: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_is_leaf (a_condition: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_is_ancestor (a_condition: POINTER; an_ancestor: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_child_by_xml_id (a_condition: POINTER; a_xml_id: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_parent (a_condition: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_children (a_condition: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_cond_type (a_condition: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_set_cond_type (a_condition: POINTER; a_type: INTEGER_32)
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_new_from_sql (a_query: POINTER; a_sql_cond: POINTER; a_targets: POINTER; an_error: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_new_copy (an_orig: POINTER; a_replacements: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_new (a_query: POINTER; a_type: INTEGER_32): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_condition_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
