-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_FIELD_FIELD_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_field_field_get_target (a_field: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_field_get_ref_field (a_field: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_field_get_ref_field_name (a_field: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_field_new (a_query: POINTER; a_field: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_field_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_field_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
