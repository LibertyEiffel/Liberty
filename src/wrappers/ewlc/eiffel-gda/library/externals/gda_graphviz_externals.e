-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_GRAPHVIZ_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_graphviz_save_file (a_graph: POINTER; a_filename: POINTER; an_error: POINTER): INTEGER_32
		external "C use <libgda/libgda.h>"
		end

	gda_graphviz_add_to_graph (a_graph: POINTER; an_obj: POINTER)
		external "C use <libgda/libgda.h>"
		end

	gda_graphviz_new (a_dict: POINTER): POINTER
		external "C use <libgda/libgda.h>"
		end

	gda_graphviz_get_type: INTEGER_32
		external "C use <libgda/libgda.h>"
		end

end
