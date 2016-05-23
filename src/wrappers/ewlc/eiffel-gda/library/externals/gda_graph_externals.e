-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
deferred class GDA_GRAPH_EXTERNALS


inherit ANY undefine is_equal, copy end


feature {} -- External calls

	gda_graph_get_items (a_graph: POINTER): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_get_item_from_obj (a_graph: POINTER; a_ref_obj: POINTER; a_create_if_needed: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_del_item (a_graph: POINTER; an_item: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_add_item (a_graph: POINTER; an_item: POINTER) is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_get_graph_type (a_graph: POINTER): INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_new (a_dict: POINTER; a_type: INTEGER_32): POINTER is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_get_type: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

	gda_graph_error_quark: INTEGER_32 is
		external "C use <libgda/libgda.h>"
		end

end
