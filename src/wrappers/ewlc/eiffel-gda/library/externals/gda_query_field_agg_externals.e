-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_QUERY_FIELD_AGG_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_query_field_agg_get_arg (an_agg: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_agg_set_arg (an_agg: POINTER; an_arg: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_agg_get_ref_agg (an_agg: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_agg_new (a_query: POINTER; an_agg_name: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_agg_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_query_field_agg_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
