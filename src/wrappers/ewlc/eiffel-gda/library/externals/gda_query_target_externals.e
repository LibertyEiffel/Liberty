-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_TARGET_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_target_get_complete_name (a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_alias (a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_set_alias (a_target: POINTER; an_alias: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_represented_table_name (a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_represented_entity (a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_query (a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_new_copy (an_orig: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_new (a_query: POINTER; a_table: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_target_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
