-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_FIELD_ALL_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_field_all_get_target (a_field: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_all_new (a_query: POINTER; a_target: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_all_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_all_error_quark: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
