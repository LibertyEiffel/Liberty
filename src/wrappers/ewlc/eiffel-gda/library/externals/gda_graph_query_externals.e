-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_GRAPH_QUERY_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_graph_query_sync_targets (a_graph: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_graph_query_new (a_query: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_graph_query_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
